#type:ignore
#!/usr/bin/env python
import sys
import copy
import rospy
import moveit_commander
import geometry_msgs.msg
from geometry_msgs.msg import PoseStamped
import baxter_interface


def place():
    rospy.init_node('place', anonymous=True)
    left_gripper=baxter_interface.Gripper('left')
    right_gripper=baxter_interface.Gripper('right')
    joint_state_topic = ['joint_states:=/robot/joint_states']
    moveit_commander.roscpp_initialize(joint_state_topic)
    robot = moveit_commander.RobotCommander()
    group = moveit_commander.MoveGroupCommander("both_arms")
       
    right_current_pose = group.get_current_pose(end_effector_link='right_gripper').pose

    right_target_pose=right_current_pose
    right_target_pose.position.x = 0.604283817393
    right_target_pose.position.y = -0.0398003209776
    right_target_pose.position.z = -0.194280900048

    right_target_pose.orientation.w = 0.169160534127
    right_target_pose.orientation.x = -0.476115019096
    right_target_pose.orientation.y = 0.862793735057
    right_target_pose.orientation.z = -0.0169166495311

    #right_target_pose.position.x = 0.429166559664
    #right_target_pose.position.y = -0.0533638389082
    #right_target_pose.position.z = 0.1452591987

    #right_target_pose.orientation.w = 0.169160534127
    #right_target_pose.orientation.x = -0.47524790367
    #right_target_pose.orientation.y = 0.863619934546
    #right_target_pose.orientation.z = -0.0131155042023


    group.set_pose_target(right_target_pose, end_effector_link='right_gripper')
    print ('right_target_pose:',right_target_pose)

    plan = group.plan()

    if not plan.joint_trajectory.points:
        print ("[ERROR] No trajectory found")
    else:
        group.go(wait=True)

    left_gripper.calibrate()
    right_gripper.calibrate()
    left_gripper.open()
    right_gripper.open()
        
    moveit_commander.roscpp_shutdown()
    moveit_commander.os._exit(0)

if __name__ == '__main__':
    try:
        place()
    except rospy.ROSInterruptException:
        pass