### Squid Games Robot

# Contributors
- Aaron Rovinsky
- Emma Stephan
- Srinija Cherivirala
- Ruhika Lankalapalli
- Aariz Hazari



**Table of Contents**


# Introduction

This project is inspired by the Dalgona game from the TV show Squid Game. In that particular game participants replicate a sketch by poking holes in a cookie. For our project we will make the robot look at a sketch and poke holes on styrofoam.

Process
=============

To achieve our goal we make use of a sensing, path planning and finally we actuate the robot to execute our project.

## Sensing 

The sensing part of the process consists of making use of the robot's camera to process an image.  This happens in the **path_planner** package in the **get_points** node. This node accesses the live stream of the Baxter's right hand camera. The image should be right below the camera and we do some live tuning to process this image. We convert the color space of the live stream to HSV to help with tuning. Once the colorspace is change we adjust the upper bounds of Hue, Saturation and Value to a point where all we have are points of interest (sketch)  and the corners of this sketch. The corners of the sketch are always kept red.
Further image processing is done in the **process_image.py** node which is called by **get_points**. The first thing that is done is to assume the only red spots in the image are in the corner. With this assumption, we find the coordinates of the red corner and crop the image. There will still exist a few random points int he cropped image which are not of interest but purely noise. To deal with these points we make use of cv2's blur function which smooths the image and gets rid of these random points of noise.
After all this processing we are left with a cropped image that just retains the sketch of interest. The final step is for us to find an ordered array of points to visit. Using a predetermined buffer we create an array of points that need to be poked out.

## Sensing(corner coordinates)

Once we have points of interest we acquire corner coordimates. To get the coordinates of the corner of the image we manually move the robot to the upper left and bottom right coordinates. In the **robot_commander** package's **execute_path**  node we first move the robot to a home coordinate. We then request the user to move the robot's arm to the top left and bottom right coordinate. The coordinates for those two locations are obtained by using the **lookup_transform** function and then recorded and passes to the path planning node (**get_coord**). 

## Path Planning

After getting points of interest using the camera we need to create a path that the robot needs to visit. We have points to visit from the sensing part of the process. These points correspond to pixels and not coordinates. So to get coordinates of interest we pass coordinates of the corner of the image from the **robot_commander** package's **execute_path.py** node. Makng use of the corner coordinate and the path pixels. We convert the points of interest to coordinates of interest.  This process is done in the **path_planner** package's **get_coord.py** node. 


###End
