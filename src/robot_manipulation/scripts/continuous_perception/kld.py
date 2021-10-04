#!/usr/bin/env python
#type:ignore
import sys
import copy
import rospy
import moveit_commander
import geometry_msgs.msg
from baxter_pykdl import baxter_kinematics

def kld():
    for i in range (1):
        joint_state_topic = ['joint_states:=/robot/joint_states']
        moveit_commander.roscpp_initialize(joint_state_topic)
        rospy.init_node('kld', anonymous=True)

        robot = moveit_commander.RobotCommander()
        group = moveit_commander.MoveGroupCommander("both_arms")

        left_current_pose = group.get_current_pose(end_effector_link='left_gripper').pose
        right_current_pose = group.get_current_pose(end_effector_link='right_gripper').pose
        
        kin=baxter_kinematics('right')
        pose=[0.25,0.25,0.25]
        print ('Inverse Kinematics:',kin.inverse_kinematics(pose))


        pose_target_1 = geometry_msgs.msg.Pose()

        pose_target_1=left_current_pose

        pose_target_1.position.x = 0.718002624994
        pose_target_1.position.y = 0.314545060661
        pose_target_1.position.z = 0.1+(-1)**i*0.2

        pose_target_2= geometry_msgs.msg.Pose()

        pose_target_2=right_current_pose

        pose_target_2.position.x=0.172001760766
        pose_target_2.position.y=-0.434271939606
        pose_target_2.position.z=-0.3

        left_target_pose=pose_target_1
        #left_target_pose=left_current_pose
        #eft_target_pose.position.z = left_current_pose.position.z+0.4
        right_pose=right_current_pose

        right_target_pose=right_pose

        group.set_pose_target(left_target_pose, end_effector_link='left_gripper')
        group.set_pose_target(right_target_pose, end_effector_link='right_gripper')

        print ('left_current_pose:',left_current_pose)
        print ('right_current_pose:',right_current_pose)

        plan = group.plan()

        if not plan.joint_trajectory.points:
            print ("[ERROR] No trajectory found")
        else:
            group.go(wait=True)
    moveit_commander.roscpp_shutdown()
    moveit_commander.os._exit(0)


if __name__ == '__main__':
    try:
        kld()
    except rospy.ROSInterruptException:
        pass