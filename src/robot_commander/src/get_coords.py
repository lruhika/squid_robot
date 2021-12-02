#!/usr/bin/env python  
import rospy
from robot_commander.srv import GetCoords
from color_detector.srv import GetPoints
import numpy as np

def callback(req):
    top_left = req.top_left
    bottom_right = req.bottom_right
    height = np.abs(top_left[0] - bottom_right[0])  # difference in x
    width = np.abs(top_left[1] - bottom_right[1])   # difference in y
    
    rospy.wait_for_service('get_points')
    try:
        get_points = rospy.ServiceProxy('get_points', GetPoints)
        response = get_points()
        points = response.points_array
    except rospy.ServiceException as e:
        print(f"Service call failed: {e}")

    coords = np.empty(points.shape)
    coords[:, 0] = points[:, 0] / width + top_left[0]       # TODO not sure if this is right
    coords[:, 1] = points[:, 1] / height + bottom_right[1]  # TODO not sure if this is right
    return coords


def main():
    rospy.wait_for_service('get_points')
    rospy.init_node('get_coords_server')
    s = rospy.Service('get_coords', GetCoords, callback)
    print('Ready to get coords from points.')
    rospy.spin()


if __name__ == '__main__':
    main()
