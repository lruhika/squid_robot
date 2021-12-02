#!/usr/bin/env python

import numpy as np

import kin_func_skeleton as kfs
# NEW!!!
def twist(q,w):
    t = np.zeros(6)
    t[0:3] = np.cross(-w,q)
    t[3:6] = w
    return t

def baxter_forward_kinematics_from_angles(joint_angles):
    """
    Computes the orientation of the Baxter's left end-effector given the joint
    angles in radians.

    Parameters
    ----------
    joint_angles ((7x) np.ndarray): 7 joint angles (s0, s1, e0, e1, w0, w1, w2)

    Returns
    -------
    (4x4) np.ndarray: homogenous transformation matrix
    """

    qs = np.ndarray((3, 8))  # points on each joint axis in the zero configuration
    ws = np.ndarray((3, 7))  # axis vector of each joint axis

    # Assign the q values
    qs[0:3, 0] = [0.0635, 0.2598, 0.1188]
    qs[0:3, 1] = [0.1106, 0.3116, 0.3885]
    qs[0:3, 2] = [0.1827, 0.3838, 0.3881]
    qs[0:3, 3] = [0.3682, 0.5684, 0.3181]
    qs[0:3, 4] = [0.4417, 0.6420, 0.3177]
    qs[0:3, 5] = [0.6332, 0.8337, 0.3067]
    qs[0:3, 6] = [0.7152, 0.9158, 0.3063]
    qs[0:3, 7] = [0.7957, 0.9965, 0.3058]

    # Assign the w values
    ws[0:3, 0] = [-0.0059, 0.0113, 0.9999]
    ws[0:3, 1] = [-0.7077, 0.7065, -0.0122]
    ws[0:3, 2] = [0.7065, 0.7077, -0.0038]
    ws[0:3, 3] = [-0.7077, 0.7065, -0.0122]
    ws[0:3, 4] = [0.7065, 0.7077, -0.0038]
    ws[0:3, 5] = [-0.7077, 0.7065, -0.0122]
    ws[0:3, 6] = [0.7065, 0.7077, -0.0038]

    R = np.array([[0.0076, 0.0001, -1.0000],
                  [-0.7040, 0.7102, -0.0053],
                  [0.7102, 0.7040, 0.0055]]).T  # rotation matrix of zero config

    g_zero=np.zeros((4,4))
    g_zero[0:3,0:3] = R
    g_zero[0:3,3]= qs[0:3,7]
    g_zero[3] = [0,0,0,1]

    t = np.zeros((6,7))
    # NEW!!!!
    for i in range(0,7):
        t[:,i] = twist(qs[0:3,i],ws[0:3,i])

    g_complete = kfs.prod_exp(t, joint_angles)

    g_complete = np.matmul(g_complete,g_zero)
    print(g_complete)
    return g_complete


def baxter_forward_kinematics_from_joint_state(joint_state):
    """
    Computes the orientation of the Baxter's left end-effector given the joint
    state.
	s0, s1, e0, e1, w0, w1, w2
	4,5,  2,3,6,7,8
    Parameters
    ----------
    joint_state (sensor_msgs.JointState): JointState of Baxter robot

    Returns
    -------
    (4x4) np.ndarray: homogenous transformation matrix
    """
    #angles = np.array([[joint_state.position[4], joint_state.position[5], joint_state.position[2],
                  #      joint_state.position[6], joint_state.position[7], joint_state.position[8]])

    # YOUR CODE HERE (Task 2)

    print(baxter_forward_kinematics_from_angles(joint_state))
