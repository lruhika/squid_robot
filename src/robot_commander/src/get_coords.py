#!/usr/bin/env python  
import rospy
from robot_commander.srv import GetCoords
from path_planner.srv import GetPoints
import numpy as np

CLOSE_RADIUS = 0.05


def callback(req):
    top_left = req.top_left
    bottom_right = req.bottom_right
    height = np.abs(top_left[0] - bottom_right[0])  # difference in x
    width = np.abs(top_left[1] - bottom_right[1])  # difference in y
    print('\n\nHEIGHT:', height, '\nWIDTH:', width)
    # HEIGHT:', 0.29547613859176636, '\nWIDTH:', 0.23654679208993912
    
    rospy.wait_for_service('get_points')
    try:
        get_points = rospy.ServiceProxy('get_points', GetPoints)
        response = get_points()
        print("get coords line 17\n", response)

        points = np.array(response.points_array).reshape((-1, 2))
        shape = response.shape
        # corner_points = np.array([[0, 0], shape])
        # points = np.vstack((corner_points, points))

        coords1 = np.empty(points.shape)
        coords1[:, 0] = ((shape[0] - points[:, 0]) / shape[0]) * height + bottom_right[0]
        coords1[:, 1] = ((shape[1] - points[:, 1]) / shape[1]) * width - bottom_right[1]

        coords2 = np.empty(points.shape)
        coords2[:, 0] = -points[:, 0] / shape[0] * height + top_left[0]
        coords2[:, 1] = -points[:, 1] / shape[1] * width - top_left[1]

        coords = (coords1 + coords2) / 2

        filtered_coords = []
        for point in coords:
            close_x = np.logical_and(coords[:, 0] < point[0] + CLOSE_RADIUS, coords[:, 0] > point[0] - CLOSE_RADIUS)
            close_y = np.logical_and(coords[:, 1] < point[1] + CLOSE_RADIUS, coords[:, 1] > point[1] - CLOSE_RADIUS)
            if np.logical_or(close_x, close_y).sum() > 1:
                filtered_coords.append(point)
        coords = np.array(filtered_coords)

        print("bottom_right: ", bottom_right)
        
        print("coords type: ", type(coords), "coords: ", coords)
        return [coords.flatten()]
    except rospy.ServiceException as e:
        print(e)
        return []

def main():
    rospy.wait_for_service('get_points')
    rospy.init_node('get_coords_server')
    s = rospy.Service('get_coords', GetCoords, callback)
    print('Ready to get coords from points.')
    rospy.spin()


if __name__ == '__main__':
    main()
