#!/usr/bin/env python


# Description: ROS driver node for the camera device, to publish the camera stream on a sensor_msgs/Image topic on ROS.

import rospy
import cv2
import cv_bridge
from sensor_msgs.msg import Image

def main():

    # Initialize the ROS node
    rospy.init_node("camera_publisher", anonymous= True)
    
    # Create the image publisher object
    #image_topic = rospy.get_param("image_topic", default= "image_raw")
    image_topic = "/cameras/right_hand_camera/image"
    
    img_pub = rospy.Publisher(image_topic, Image, queue_size= 100)

    # Creating the OpenCV bridge object that will convert
    # between ROS images and OpenCV(numpy) images back and forth.  
    bridge = cv_bridge.CvBridge()

    # Specifying the publish rate
    r = rospy.Rate(60) # 30Hz

    # Creating the VideoCapture object that will connect to the camera device
    cap = cv2.VideoCapture(rospy.get_param("camera_device", default= 0))
    
    try:
        while cap.isOpened():
            ret, frame = cap.read()
            if ret == True:
                ros_img = bridge.cv2_to_imgmsg(frame, encoding= "passthrough")  # passthrough, the default of opencv is BGR8
                ros_img.header.stamp = rospy.Time.now()   # Timestamping the message
                img_pub.publish(ros_img)
                r.sleep()
    
    except:
        exit()

if __name__ == "__main__":
    main()
