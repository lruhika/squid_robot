#!/usr/bin/env python  
import rospy
from baxter_forward_kinematics import *
from moveit_msgs.srv import GetPositionIK, GetPositionIKRequest, GetPositionIKResponse
from robot_commander.srv import GetCoords
from moveit_commander import MoveGroupCommander
import tf2_ros
import numpy as np

POKE_DEPTH = 0.03   # TODO tune this
HOVER_Z = -0.05     # TODO tune this
HOME_COORD = np.array([0, 1, 2])    # TODO tune this

def coord_to_poke(coord):
    coord = np.append(coord, HOVER_Z)
    start_coord, end_coord = coord, coord
    poke_coord = coord - np.array([0, 0, POKE_DEPTH])
    return start_coord, poke_coord, end_coord


def construct_request(coord):
    request = GetPositionIKRequest()
    request.ik_request.group_name = "left_arm"
    request.ik_request.ik_link_name = "left_gripper"
    request.ik_request.attempts = 20
    request.ik_request.pose_stamped.header.frame_id = "base"

    request.ik_request.pose_stamped.pose.position.x = coord[0]
    request.ik_request.pose_stamped.pose.position.y = coord[1]
    request.ik_request.pose_stamped.pose.position.z = coord[2]
    
    # TODO tune orientation
    request.ik_request.pose_stamped.pose.orientation.x = 0.0
    request.ik_request.pose_stamped.pose.orientation.y = 1.0
    request.ik_request.pose_stamped.pose.orientation.z = 0.0
    request.ik_request.pose_stamped.pose.orientation.w = 0.0

    return request


def go_home(compute_ik, request):
    while True:
        try:
            response = compute_ik(request)
            print(response)
            group.set_pose_target(request.ik_request.pose_stamped)
            group.go()
            break
        except rospy.ServiceException as e:
            # TODO get position of arm
            print("Service call failed: " + e)


def main():
    rospy.init_node('robot_executor')
    target_frame, source_frame = 'left_gripper', 'base'
    # left_gripper = robot_gripper.Gripper('left')
    group = MoveGroupCommander('left_arm')
    tfBuffer = tf2_ros.Buffer()
    tfListener = tf2_ros.TransformListener(tfBuffer)

    while not rospy.is_shutdown():
        rospy.wait_for_service('compute_ik')
        compute_ik = rospy.ServiceProxy('compute_ik', GetPositionIK)

        raw_input('Press enter to go home.')
        request = construct_request(HOME_COORD)
        go_home(compute_ik, request)
        
        raw_input('Press enter to begin corner calibration.')
        # get corners of workspace
        corner_transforms = {}
        for name in ["top left", "bottom right"]:
            while not rospy.is_shutdown():
                raw_input('Move end of poker to' + name + 'corner of workspace, then hit enter.')
                try:
                    trans = tfBuffer.lookup_transform(target_frame, source_frame, rospy.Time())
                    corner_transforms[name] = trans
                    break
                except (tf2_ros.LookupException, tf2_ros.ConnectivityException, tf2_ros.ExtrapolationException):
                    print("Error, try again.")
                    continue
        
        raw_input('Press enter to go home.')
        request = construct_request(HOME_COORD)
        go_home(compute_ik, request)

        # get width and height of workspace
        top_left = corner_transforms["top left"].translation
        bottom_right = corner_transforms['bottom right'].translation

        # get coordinates of point trajectory
        rospy.wait_for_service('get_coords')
        get_coords = rospy.ServiceProxy('get_coords', GetCoords)
        coords = get_coords(top_left, bottom_right)

        raw_input('Press enter to trace out path without poking.')
        hover_z = np.tile(HOVER_Z, (len(coords, 1)))
        hover_coords = np.append(coords, hover_z)
        for coord in hover_coords:
            request = construct_request(coord)
            while True:
                try:
                    response = compute_ik(request)
                    print(response)
                    group.set_pose_target(request.ik_request.pose_stamped)
                    group.go()
                    break
                except rospy.ServiceException as e:
                    # TODO get position of arm
                    print("Service call failed: " + e)

        raw_input('Press enter to begin executing poking path.')
        for coord in coords:
            start, poke, end = coord_to_poke(coord)
            for destination in [start, poke, end]:
                request = construct_request(destination)
                while True:
                    try:
                        response = compute_ik(request)
                        print(response)
                        group.set_pose_target(request.ik_request.pose_stamped)
                        group.go()
                        break
                    except rospy.ServiceException as e:
                        # TODO get position of arm
                        print("Service call failed: " + e)

        print('Image poked out!')


if __name__ == '__main__':
    main()
