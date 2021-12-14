#!/usr/bin/env python  
import rospy
from baxter_forward_kinematics import *
import baxter_interface
from baxter_interface import gripper as robot_gripper
from moveit_msgs.srv import GetPositionIK, GetPositionIKRequest, GetPositionIKResponse
from trac_ik_python.trac_ik import IK
from robot_commander.srv import GetCoords
from moveit_commander import MoveGroupCommander
import tf2_ros
import numpy as np

# HOME_COORD = np.array([0.68506, 0.41719, 0.033956])    # Tuned and tested on 12/3 TODO tune this
# HOME_COORD = np.array([1.0120748281478882, 0.18082711100578308, 0.0])
# HOME_COORD = np.array([0.6, 0.2, 0.0])

class Executor():
    def __init__(self):
        rospy.init_node('robot_executor')
        self.target_frame, self.source_frame = 'left_gripper', 'base'
        rospy.wait_for_service('compute_ik')
        self.compute_ik = rospy.ServiceProxy('compute_ik', GetPositionIK)
        self.left = baxter_interface.Limb('left')
        self.tfBuffer = tf2_ros.Buffer()
        tfListener = tf2_ros.TransformListener(self.tfBuffer)
        self.home_coord = np.array([0.8, 0.18, 0.18])
        self.hover_z = 0.02
        self.poke_depth = 0.1
        self.group = MoveGroupCommander('left_arm')
        self.redo_buffer = 0.01
        self.poked_ranges = []


    def coord_to_poke(self, coord):
        coord = np.append(coord, self.hover_z)
        start_coord, end_coord = coord, coord
        poke_coord = coord - np.array([0, 0, self.poke_depth])
        return start_coord, poke_coord, end_coord


    def perturb(self):
        try:
            trans = self.tfBuffer.lookup_transform(self.target_frame, self.source_frame, rospy.Time())
            robot = trans.transform.translation
            perturb_coord = np.array([robot.x, robot.y, robot.z])
            rand = np.random.rand() * 3
            if rand < 1:
                perturb_coord[2] += 0.05
            elif rand < 2:
                perturb_coord[1] += 0.05
            else:
                perturb_coord[0] += 0.05
            
            request = self.construct_request(perturb_coord)
            response = self.compute_ik(request)
            if response.error_code.val != 1:
                return False

            self.group.set_pose_target(request.ik_request.pose_stamped)
            self.group.go()
            return True
        except rospy.ServiceException as e:
            print(e)


    def do_ik(self, coord):
        print('COORD IS', coord)
        if coord[2] > 1 or coord[2] < -0.12:
            print('GOOD TRY NO SOLUTION')
            return 'failed'
        request = self.construct_request(coord)
        while True:
            try:
                response = self.compute_ik(request)
                print(response.error_code)
                i = 0
                while response.error_code.val != 1 and i < 5:
                    if self.perturb():
                        response = self.compute_ik(request)
                    i += 1
                self.group.set_pose_target(request.ik_request.pose_stamped)
                self.group.go()
                break
            except rospy.ServiceException as e:
                print(e)


    def construct_request(self, coord, orientation=np.array([0.0, 1.0, 0.0, 0.0])):
        request = GetPositionIKRequest()
        request.ik_request.group_name = "left_arm"
        request.ik_request.ik_link_name = "left_gripper"
        request.ik_request.attempts = 100
        request.ik_request.pose_stamped.header.frame_id = "base"

        request.ik_request.pose_stamped.pose.position.x = coord[0]
        request.ik_request.pose_stamped.pose.position.y = coord[1]
        request.ik_request.pose_stamped.pose.position.z = coord[2]
        # print(request.ik_request.pose_stamped.pose.position.x)
        # print(request.ik_request.pose_stamped.pose.position.y)
        # print(request.ik_request.pose_stamped.pose.position.z)
        
        request.ik_request.pose_stamped.pose.orientation.x = orientation[0]
        request.ik_request.pose_stamped.pose.orientation.y = orientation[1]
        request.ik_request.pose_stamped.pose.orientation.z = orientation[2]
        request.ik_request.pose_stamped.pose.orientation.w = orientation[3]

        return request

    def main(self):
        redo = True
        while redo == True:
            redo = self.execute()
    
    def mark_poked(self, coord):
        x = coord[0]
        y = coord[1]
        range = [x - self.redo_buffer, x + self.redo_buffer, y - self.redo_buffer, y + self.redo_buffer]
        self.poked_ranges.append(range)
        return

    def has_been_poked(self, coord):
        x = coord[0]
        y = coord[1]
        in_poked_ranges = np.array([True if x > r[0] and x < r[1] and y > r[2] and y < r[3] else False for r in self.poked_ranges])
        return any(in_poked_ranges)

    def execute(self):
        while not rospy.is_shutdown():
            raw_input('Press enter to go home.')
            self.do_ik(self.home_coord)

            # left_gripper = robot_gripper.Gripper('left')
            # print('Calibrating and opening gripper...')
            # left_gripper.calibrate()
            # rospy.sleep(1.0)
            # left_gripper.open()
            # rospy.sleep(1.0)
            
            raw_input('Press enter to begin corner calibration.')
            corner_transforms = {}
            for name in ["top left", "bottom right"]:
                while not rospy.is_shutdown():
                    raw_input('Move end of poker to the ' + name + ' corner of workspace, then hit enter.')
                    try:
                        trans = self.tfBuffer.lookup_transform(self.target_frame, self.source_frame, rospy.Time())
                        corner_transforms[name] = trans.transform
                        break
                    except (tf2_ros.LookupException, tf2_ros.ConnectivityException, tf2_ros.ExtrapolationException):
                        print("Error, try again.")
                        continue

            raw_input('Press enter to go home.')
            self.do_ik(self.home_coord)

            # get width and height of workspace
            top_left = corner_transforms["top left"].translation
            bottom_right = corner_transforms['bottom right'].translation

            # get coordinates of point trajectory
            rospy.wait_for_service('get_coords')
            get_coords = rospy.ServiceProxy('get_coords', GetCoords)
            req_top_left = [top_left.x, top_left.y, top_left.z]
            req_bottom_right = [bottom_right.x, bottom_right.y, bottom_right.z]
            coords_response = get_coords(req_top_left, req_bottom_right)
            coords = np.array(coords_response.coords_array).reshape((-1, 2))

            raw_input('Press enter to trace out path without poking.')
            print("execute path line 140\n", coords)
            
            hover_z = np.tile(self.hover_z, (len(coords), 1))
            hover_coords = np.block([coords, hover_z])
            for coord in hover_coords:
                if self.has_been_poked(coord):
                    continue
                else:
                    self.mark_poked(coord)
                    self.do_ik(coord)

            raw_input('Press enter to begin executing poking path.')
            for coord in coords:
                start, poke, end = self.coord_to_poke(coord)
                for destination in [start, poke, end]:
                    if self.has_been_poked(destination):
                        continue
                    else:
                        self.do_ik(destination)
                        rospy.sleep(1)
            print('Done!')

            redo = raw_input("Do you want to poke out a newly added path? (y/n)")
            if redo == "y":
                return True
            else:
                print('Image poked out!')
                return False


if __name__ == '__main__':
    executor = Executor()
    executor.main()
