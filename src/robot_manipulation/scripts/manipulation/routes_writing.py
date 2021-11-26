#type:ignore
import sys
import copy
import rospy
import moveit_commander
import geometry_msgs.msg
from geometry_msgs.msg import PoseStamped
import baxter_interface
import csv


def routes_writing():
    rospy.init_node('routes_writing', anonymous=True)
    left_gripper=baxter_interface.Gripper('left')
    right_gripper=baxter_interface.Gripper('right')
    joint_state_topic = ['joint_states:=/robot/joint_states']
    moveit_commander.roscpp_initialize(joint_state_topic)
    robot = moveit_commander.RobotCommander()
    group = moveit_commander.MoveGroupCommander("both_arms")
       
    right_pose = group.get_current_pose(end_effector_link='right_gripper').pose
    left_pose=group.get_current_pose(end_effector_link='left_gripper').pose
    print('right_pose:',right_pose)
    print('left_pose:',left_pose)
    csv_writer.writerow((6,right_pose.position.x,right_pose.position.y,right_pose.position.z,right_pose.orientation.x,right_pose.orientation.y
    ,right_pose.orientation.z,right_pose.orientation.w,left_pose.position.x,left_pose.position.y,left_pose.position.z,right_pose.orientation.x,left_pose.orientation.y
    ,left_pose.orientation.z,left_pose.orientation.w,'left','r_o_l_c'))

if __name__ == '__main__':
    try:
        f=open('./routes.csv','a')
        csv_writer=csv.writer(f)
        routes_writing()
    except rospy.ROSInterruptException:
        pass