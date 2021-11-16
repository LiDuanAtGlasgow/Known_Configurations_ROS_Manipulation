#type:ignore
import sys
import copy
import rospy
import moveit_commander
import geometry_msgs.msg
from geometry_msgs.msg import PoseStamped
import baxter_interface
import csv


def calibration():
    rospy.init_node('calibration', anonymous=True)
    left_gripper=baxter_interface.Gripper('left')
    right_gripper=baxter_interface.Gripper('right')
    joint_state_topic = ['joint_states:=/robot/joint_states']
    moveit_commander.roscpp_initialize(joint_state_topic)
    robot = moveit_commander.RobotCommander()
    group = moveit_commander.MoveGroupCommander("both_arms")
       
    pose = group.get_current_pose(end_effector_link='right_gripper').pose
    print('pose:',pose)
    csv_writer.writerow((pose.position.x,pose.position.y,pose.position.z,pose.orientation.x,pose.orientation.y
    ,pose.orientation.z,pose.orientation.w))

    #moveit_commander.roscpp_shutdown()
    #moveit_commander.os._exit(0)

if __name__ == '__main__':
    try:
        f=open('./routes.csv','a')
        csv_writer=csv.writer(f)
        calibration()
    except rospy.ROSInterruptException:
        pass