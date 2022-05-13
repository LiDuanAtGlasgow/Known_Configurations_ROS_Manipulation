#type:ignore
import time
import rospy
import roslib 
roslib.load_manifest("moveit_python")
from moveit_python import PlanningSceneInterface, MoveGroupInterface
from geometry_msgs.msg import PoseStamped, PoseArray
import baxter_interface
from moveit_python.geometry import rotate_pose_msg_by_euler_angles
from math import pi, sqrt
from operator import itemgetter
import moveit_commander
import csv
import numpy as np

def gripper_open():
    leftgripper = baxter_interface.Gripper('left')
    rightgripper=baxter_interface.Gripper('right')
    rightgripper.calibrate()
    rightgripper.open()
    #leftgripper.calibrate()
    #leftgripper.open()

if __name__=='__main__':
    try:
        rospy.init_node('pnp', anonymous=True)
        gripper_open()

    except rospy.ROSInterruptException:
        pass