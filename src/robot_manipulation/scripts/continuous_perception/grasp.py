#!/usr/bin/env python
import sys
import copy
import rospy
import moveit_commander
import geometry_msgs.msg
from geometry_msgs.msg import PoseStamped
import baxter_interface


def grasp():
    rospy.init_node('grasp', anonymous=True)
    left_gripper=baxter_interface.Gripper('left')
    right_gripper=baxter_interface.Gripper('right')
    joint_state_topic = ['joint_states:=/robot/joint_states']
    moveit_commander.roscpp_initialize(joint_state_topic)
    robot = moveit_commander.RobotCommander()
    group = moveit_commander.MoveGroupCommander("both_arms")

    for i in range (1):
        #left_gripper.calibrate()
        #right_gripper.calibrate()

        #left_gripper.close()
        #right_gripper.close()

        #rospy.sleep(2.0)
        
        left_current_pose = group.get_current_pose(end_effector_link='left_gripper').pose
        right_current_pose = group.get_current_pose(end_effector_link='right_gripper').pose

        left_target_pose = left_current_pose
        #left_target_pose.position.z = left_current_pose.position.z +(-1)**(i)*0.1
        right_target_pose=right_current_pose
        right_target_pose.position.z = right_current_pose.position.z +(-1)**(i)*0.8

        right_target_pose = right_current_pose

        group.set_pose_target(left_target_pose, end_effector_link='left_gripper')
        group.set_pose_target(right_target_pose, end_effector_link='right_gripper')

        print ('left_current_pose:',left_current_pose)
        print ('right_current_pose:',right_current_pose)

        plan = group.plan()

        if not plan.joint_trajectory.points:
            print ("[ERROR] No trajectory found")
        else:
            group.go(wait=True)
        #left_gripper.calibrate()
        #right_gripper.calibrate()
        #left_gripper.open()
        #right_gripper.open()
        
    moveit_commander.roscpp_shutdown()
    moveit_commander.os._exit(0)

if __name__ == '__main__':
    try:
        grasp()
    except rospy.ROSInterruptException:
        pass
