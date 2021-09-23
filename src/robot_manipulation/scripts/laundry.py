#!/usr/bin/env python
import rospy
import moveit_commander
from geometry_msgs.msg import PoseStamped
import baxter_interface
import argparse

parser=argparse.ArgumentParser()
parser.add_argument('--object',type=str,default='',help='object category')
opt=parser.parse_args()

def pick():
    
    rospy.init_node('pick', anonymous=True)
    right_gripper=baxter_interface.Gripper('right')
    left_gripper=baxter_interface.Gripper('left')
    joint_state_topic = ['joint_states:=/robot/joint_states']
    moveit_commander.roscpp_initialize(joint_state_topic)
    group = moveit_commander.MoveGroupCommander("both_arms")

    for i in range (1):
        left_gripper.calibrate()
        right_gripper.calibrate()

        left_gripper.close()
        right_gripper.close()

        rospy.sleep(2.0)
        
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
            group.execute(plan,wait=False)
            rospy.loginfo("move finished")  
            rospy.sleep(2)  
            group.stop()  
            rospy.loginfo("stoped")  
            rospy.sleep(2)

def place():
    rospy.init_node('place', anonymous=True)
    right_gripper=baxter_interface.Gripper('right')
    joint_state_topic = ['joint_states:=/robot/joint_states']
    moveit_commander.roscpp_initialize(joint_state_topic)
    group = moveit_commander.MoveGroupCommander("both_arms")
       
    right_current_pose = group.get_current_pose(end_effector_link='right_gripper').pose
    
    right_target_pose=right_current_pose
    '''
    if opt.object=='towel':
        right_target_pose.position.x =0.680355880089
        right_target_pose.position.y =-0.862794585912
        right_target_pose.position.z =0.248716960311
    elif opt.object=='t-shirt':
        right_target_pose.position.x= 0.0917482396374
        right_target_pose.position.y= -0.871452640032
        right_target_pose.position.z= 0.254370167959
    elif opt.object=='sweater':
        right_target_pose.position.x= 0.326935491974
        right_target_pose.position.y= -1.11071772232
        right_target_pose.position.z= 0.244979600882
    elif opt.object=='shirt':
        right_target_pose.position.x= 0.647209864394
        right_target_pose.position.y= -0.954447305459
        right_target_pose.position.z= 0.214360675126
    #?
    elif opt.object=='jeans':
        right_target_pose.position.x= 0.789846460015
        right_target_pose.position.y= -0.811025609559
        right_target_pose.position.z= -0.00642444057407
    '''
    group.set_pose_target(right_target_pose, end_effector_link='right_gripper')
    print ('right_target_pose:',right_target_pose)
    '''
    plan = group.plan()

    if not plan.joint_trajectory.points:
        print ("[ERROR] No trajectory found")
    else:
        group.go(wait=True)
    '''
    right_gripper.calibrate()
    right_gripper.open()
        
    moveit_commander.roscpp_shutdown()
    moveit_commander.os._exit(0)

if __name__ == '__main__':
    try:
        #pick()
        place()
    except rospy.ROSInterruptException:
        pass
