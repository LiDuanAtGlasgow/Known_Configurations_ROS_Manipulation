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

def picknplace():
    p = PlanningSceneInterface("base")
    gr = MoveGroupInterface("right_arm", "base")
    rightgripper=baxter_interface.Gripper('right')

    start_time=time.time()
    p.waitForSync()        
    pickgoal = PoseStamped() 
    pickgoal.header.frame_id = "base"
    pickgoal.header.stamp = rospy.Time.now()
    pickgoal.pose.position.x = 0.446273250899
    pickgoal.pose.position.y = -0.0248277593526
    pickgoal.pose.position.z = -0.19782991077
    pickgoal.pose.orientation.x = -0.475369227256
    pickgoal.pose.orientation.y = 0.863169053249
    pickgoal.pose.orientation.z = -0.0172187612482
    pickgoal.pose.orientation.w = 0.169312721177
    gr.moveToPose(pickgoal, "right_gripper", plan_only=False)
    rospy.sleep(2.0)
    #rightgripper.open()
    print ('finished, time:',time.time()-start_time)

if __name__=='__main__':
    try:
        rospy.init_node('pnp', anonymous=True)
        picknplace()

    except rospy.ROSInterruptException:
        pass