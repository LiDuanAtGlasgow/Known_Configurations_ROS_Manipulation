#type:ignore
#!/usr/bin/env python
import sys
import copy
import rospy
import moveit_commander
import geometry_msgs.msg
from geometry_msgs.msg import PoseStamped
import baxter_interface


def calibration():
    rospy.init_node('calibration', anonymous=True)
    left_gripper=baxter_interface.Gripper('left')
    right_gripper=baxter_interface.Gripper('right')
    joint_state_topic = ['joint_states:=/robot/joint_states']
    moveit_commander.roscpp_initialize(joint_state_topic)
    robot = moveit_commander.RobotCommander()
    group = moveit_commander.MoveGroupCommander("both_arms")
       
    right_current_pose = group.get_current_pose(end_effector_link='right_gripper').pose

    right_target_pose=right_current_pose
    right_target_pose.position.x = 0.446273250899
    right_target_pose.position.y = -0.0248277593526
    right_target_pose.position.z = -0.19782991077

    right_target_pose.orientation.w = 0.169312721177
    right_target_pose.orientation.x = -0.475369227256
    right_target_pose.orientation.y = 0.863169053249
    right_target_pose.orientation.z = -0.0172187612482


    group.set_pose_target(right_target_pose, end_effector_link='right_gripper')
    print ('right_target_pose:',right_target_pose)

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
        calibration()
    except rospy.ROSInterruptException:
        pass