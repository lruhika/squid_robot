#!/usr/bin/env python

# Description: Testing script for adjusting the upper and lower HSV bounds for 
#              the thresholding algorithm.

import cv2
import os
import rospy
import numpy as np
import cv_bridge
from sensor_msgs.msg import Image
from std_msgs.msg import Int32MultiArray
import process_img
from path_planner.srv import GetPoints

this_file = os.path.dirname(os.path.abspath(__file__))
IMG_DIR = '/'.join(this_file.split('/')[:-2]) + '/img'

def nothing(x):
    pass #Null Operation

def callback(req):
    image_topic = rospy.get_param("/cameras/left_hand_camera/image", default="/cameras/left_hand_camera/image")
    bridge = cv_bridge.CvBridge()

    cv2.namedWindow('Trackbars')
    # create trackbars for color change
    #This is only used for finding the value
    cv2.createTrackbar("L - H", "Trackbars", 0, 179, nothing)
    cv2.createTrackbar("L - S", "Trackbars", 0, 255, nothing)
    cv2.createTrackbar("L - V", "Trackbars", 0, 255, nothing)
    cv2.createTrackbar("U - H", "Trackbars", 179, 179, nothing)
    cv2.createTrackbar("U - S", "Trackbars", 255, 255, nothing)
    cv2.createTrackbar("U - V", "Trackbars", 255, 255, nothing)

    rospy.logwarn("Waiting for image on topic.")

    while not rospy.is_shutdown():
        ros_img = rospy.wait_for_message(image_topic, Image)
        frame = bridge.imgmsg_to_cv2(ros_img, desired_encoding="bgr8")
        
        hsv = cv2.cvtColor(frame, cv2.COLOR_BGR2HSV)
        # Get the trackbar locations
        l_h = cv2.getTrackbarPos("L - H", "Trackbars")
        l_s = cv2.getTrackbarPos("L - S", "Trackbars")
        l_v = cv2.getTrackbarPos("L - V", "Trackbars")
        u_h = cv2.getTrackbarPos("U - H", "Trackbars")
        u_s = cv2.getTrackbarPos("U - S", "Trackbars")
        u_v = cv2.getTrackbarPos("U - V", "Trackbars")
        
        # Represent the upper and lower bounds as arrays because that's what OpenCV expects
        lower_ = np.array([l_h, l_s, l_v])
        upper_ = np.array([u_h, u_s, u_v])
        thresh = cv2.inRange(hsv, lower_, upper_)       # Perform the thresholding

        # makes not much sense? Sort of like ignoring the middle and impurities? https://docs.opencv.org/3.4.12/db/df6/tutorial_erosion_dilatation.html
        kernel_erosion = np.ones((5, 5), np.uint8)      # Specify and erosion kernel
        kernel_dilation=np.ones((3,3), np.uint8)        # Specify a dilation kernel
        erosion = cv2.erode(thresh, kernel_erosion)     
        dilation = cv2.dilate(erosion, kernel_dilation)
        mask = dilation                                 # The diluted is our mask

        res_m = cv2.bitwise_and(frame, frame, mask= mask) 

        newImage = np.zeros_like(res_m)
        #print(newImage.shape)
        newImage[res_m == 0] = 255
        newImage[res_m != 0] = 0

        # We don't need to visualize contours here, uncomment if wanted.
        # contours, hierarchy = cv2.findContours(image=mask, mode=cv2.RETR_TREE, method=cv2.CHAIN_APPROX_NONE)
        # cv2.drawContours(image=res_m, contours=contours, contourIdx=-1, color=(0, 255, 0), thickness=2, lineType=cv2.LINE_AA)   

        cv2.imshow('frame',frame)                       # show the original frame
        cv2.imshow('result thresholded',res_m)          # show the resulting thresholded frame
        print("res shape")
        print(res_m.shape)
        cv2.imshow('newest',newImage)
        # print("new Image shape")
        # print(newImage.shape)
        #pub.publish(Int32MultiArray(data=newImage))

        # 
        # print(len())
        # path = get_path.img_to_path(bin_img)
        # print(path.shape)

        # print(newImage.shape)
        # status = cv2.imwrite('/home/cc/ee106a/fl21/class/ee106a-aet/ros_workspaces/project/newest.jpeg', newImage)
        # print(status)
        # cv2.imwrite("newest.jpg", newImage)
        #cv2.imwrite(IMG_DIR + "/newest.jpg", newImage)
        # clusters = cv2.imread(IMG_DIR + '/newest.jpg')
        # show_image(clusters, title='cluster')
        
        # Check if the user has pressed ESC key. Doesn't work?
        c = cv2.waitKey(1)
        
        if c == 27:
            print('image tuned!')
            #print(res_m[0])
            print(res_m.shape)
            # res_m = np.flip(res_m, axis=0)
            # res_m = np.flip(res_m)
            bin_img, path = process_img.process(res_m)
            # cv2.imshow('cropped',cropped)
            #print(bin_img)
            process_img.print_img(bin_img, path)
            print(path)
            # path = np.array(path)
            path = [y for x in path for y in x]
            # import pdb;pdb.set_trace()
            return np.array(path), np.array(bin_img).shape

            # newImage2 = np.zeros_like(res_m)
            # print(newImage.shape)
            # newImage2 = [[255 for i in r if r in path else 0] for r in newImage]
            # cv2.imshow('newest',newImage2)

            process_img.print_img(bin_img, path)
            break   # exit if ESC is pressed


def main():
    rospy.init_node('get_points_server')
    s = rospy.Service('get_points', GetPoints, callback)
    print('Ready to get points/path.')
    rospy.spin()


if __name__ == "__main__":
    pixel_locations_topic = rospy.get_param("pixel_locations_topic", default="pixel_locations")
    pub = rospy.Publisher(pixel_locations_topic, Int32MultiArray, queue_size=100)
    main()
