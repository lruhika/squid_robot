#!/usr/bin/env python  
import rospy
from baxter_forward_kinematics import *
import baxter_interface
from baxter_interface import gripper as robot_gripper
from moveit_msgs.srv import GetPositionIK, GetPositionIKRequest, GetPositionIKResponse
from moveit_msgs.msg import OrientationConstraint, Constraints
from trac_ik_python.trac_ik import IK
from robot_commander.srv import GetCoords
from moveit_commander import MoveGroupCommander
from controller import Controller
from baxter_interface import Limb
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
        self.home_coord = np.array([0.6, 0.18, 0.18])
        self.hover_z = -0.08
        self.poke_hover_z = -0.095
        self.shallow_poke_depth = 0.045
        self.deep_poke_depth = 0.08
        self.poke_x_offset = 0.01
        self.group = MoveGroupCommander('left_arm')

        self.Kp = 0.45 * np.array([0.8, 2.5, 1.7, 2.2, 2.4, 3, 4])
        self.Kd = 0.015 * np.array([2, 1, 2, 0.5, 0.8, 0.8, 0.8])
        self.Ki = 0.01 * np.array([1.4, 1.4, 1.4, 1, 0.6, 0.6, 0.6])
        self.Kw = np.array([0.9, 0.9, 0.9, 0.9, 0.9, 0.9, 0.9])
        self.controller = Controller(self.Kp, self.Ki, self.Kd, self.Kw, Limb('left'))


    def get_constraint(self):
        orien_const = OrientationConstraint()
        orien_const.link_name = 'left_gripper'
        orien_const.header.frame_id = 'base'
        orien_const.orientation.y = 1.0
        orien_const.absolute_x_axis_tolerance = 0.1
        orien_const.absolute_y_axis_tolerance = 0.1
        orien_const.absolute_z_axis_tolerance = 0.1
        orien_const.weight = 1.0

        constraints = Constraints()
        constraints.orientation_constraints = [orien_const]
        return constraints


    def coord_to_poke(self, coord, is_deeper=False):
        coord = np.append(coord, self.hover_z)
        start_coord, end_coord = coord, coord
        hover_coord = coord - np.array([self.poke_x_offset, 0, 0])
        hover_coord[2] = self.poke_hover_z
        if is_deeper:
            poke_coord = coord - np.array([self.poke_x_offset, 0, self.deep_poke_depth])
        else:
            poke_coord = coord - np.array([self.poke_x_offset, 0, self.shallow_poke_depth])
        end_coord[0] -= self.poke_x_offset
        return start_coord, hover_coord, poke_coord, end_coord


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


    def do_ik(self, coord, constrain=False):
        print('COORD IS', coord)
        if coord[2] > 1 or coord[2] < -0.2:
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
                self.group.set_start_state_to_current_state()
                if constrain:
                    constraint = self.get_constraint()
                    self.group.set_path_constraints(constraint)
                # plan = self.group.plan()
                # if not self.controller.execute_path(plan):
                #     raise Exception('Execution failed')
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
        
        request.ik_request.pose_stamped.pose.orientation.x = orientation[0]
        request.ik_request.pose_stamped.pose.orientation.y = orientation[1]
        request.ik_request.pose_stamped.pose.orientation.z = orientation[2]
        request.ik_request.pose_stamped.pose.orientation.w = orientation[3]

        return request


    def main(self):
        while not rospy.is_shutdown():
            raw_input('Press enter to go home.')
            self.do_ik(self.home_coord)

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
            poke_further_coords = np.array(coords_response.poke_further_coords_array).reshape((-1, 2))

            all_coords = np.concatenate((coords, poke_further_coords), axis=0)
            all_coords = sorted(coords, key=lambda c: c[0])

            raw_input('Press enter to trace out path without poking.')
            hover_z = np.tile(self.hover_z, (len(all_coords), 1))
            hover_coords = np.block([coords, hover_z])
            for coord in hover_coords:
                self.do_ik(coord)

            manual_offset = raw_input("If needed, enter a manual offset in the form x y: ").split(" ")
            man_x_off = float(manual_offset[0])
            man_y_off = float(manual_offset[1])

            true_tile = np.tile(True, (len(poke_further_coords), 1))
            false_tile = np.tile(False, (len(coords), 1))
            shallow_coords = np.block([coords, false_tile])
            deep_coords = np.block([poke_further_coords, true_tile])
            coords = np.concatenate((shallow_coords, deep_coords), axis=0)
            coords = sorted(coords, key=lambda c: c[0])

            self.do_ik(coord + np.array([0, 0, 2 * self.shallow_poke_depth]))
            raw_input('Press enter to begin executing poking path.')
            for coord in coords:
                is_deeper = coord[-1]
                coord = coord[:2]
                start, hover, poke, end = self.coord_to_poke(coord, is_deeper=is_deeper)
                for i, destination in enumerate([start, hover, poke, end]):
                    self.do_ik(destination - np.array([man_x_off, man_y_off, 0]))
                    if i == 1:
                        rospy.sleep(2)
                    else:
                        rospy.sleep(0.5)

            print('Image poked out!')

            # raw_input('Press enter to trace out deeper path without poking.')
            # pf_hover_z = np.tile(self.hover_z, (len(poke_further_coords), 1))
            # pf_hover_coords = np.block([poke_further_coords, pf_hover_z])
            # for coord in pf_hover_coords:
            #     self.do_ik(coord)
            
            # self.do_ik(coord + np.array([0, 0, 4 * self.poke_depth])) # todo: what is this for?
            # raw_input('Press enter to begin executing deeper poking path.')
            # for coord in poke_further_coords:
            #     start, poke, end = self.coord_to_poke(coord, is_deeper=True)
            #     for i, destination in enumerate([start, poke, end]):
            #         self.do_ik(destination)
            #         rospy.sleep(1)


if __name__ == '__main__':
    executor = Executor()
    executor.main()
