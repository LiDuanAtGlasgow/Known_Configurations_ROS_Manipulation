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
    g = MoveGroupInterface("both_arms", "base")
    gr = MoveGroupInterface("right_arm", "base")
    gl = MoveGroupInterface("left_arm", "base")
    leftgripper = baxter_interface.Gripper('left')
    leftgripper.calibrate()
    leftgripper.open()
    rightgripper=baxter_interface.Gripper('right')
    rightgripper.calibrate()
    rightgripper.open()
    jts_both = ['left_e0', 'left_e1', 'left_s0', 'left_s1', 'left_w0', 'left_w1', 'left_w2', 'right_e0', 'right_e1', 'right_s0', 'right_s1', 'right_w0', 'right_w1', 'right_w2']
    jts_right = ['right_e0', 'right_e1', 'right_s0', 'right_s1', 'right_w0', 'right_w1', 'right_w2']
    jts_left = ['left_e0', 'left_e1', 'left_s0', 'left_s1', 'left_w0', 'left_w1', 'left_w2']
    pos1 = [-1.441426162661994, 0.8389151064712133, 0.14240920034028015, -0.14501001475655606, -1.7630090377446503, -1.5706376573674472, 0.09225918246029519,1.7238109084167481, 1.7169079948791506, 0.36930587426147465, -0.33249033539428713, -1.2160632682067871, 1.668587600115967, -1.810097327636719]
    pos2 = [-0.949534106616211, 1.4994662184448244, -0.6036214393432617, -0.7869321432861328, -2.4735440176391603, -1.212228316241455, -0.8690001153442384, 1.8342575250183106, 1.8668546167236328, -0.45674277907104494, -0.21667478604125978, -1.2712865765075685, 1.7472041154052735, -2.4582042097778323]
    lpos1 = [-1.441426162661994, 0.8389151064712133, 0.14240920034028015, -0.14501001475655606, -1.7630090377446503, -1.5706376573674472, 0.09225918246029519]
    lpos2 = [-0.949534106616211, 1.4994662184448244, -0.6036214393432617, -0.7869321432861328, -2.4735440176391603, -1.212228316241455, -0.8690001153442384]    
    rpos1 = [1.7238109084167481, 1.7169079948791506, 0.36930587426147465, -0.33249033539428713, -1.2160632682067871, 1.668587600115967, -1.810097327636719]
    rpos2 = [1.8342575250183106, 1.8668546167236328, -0.45674277907104494, -0.21667478604125978, -1.2712865765075685, 1.7472041154052735, -2.4582042097778323]
    g.moveToJointPosition(jts_both, pos1, plan_only=False)

    start_time=time.time()
    with open ('data_collection.csv','rb') as csvfile:
        reader=csv.DictReader(csvfile)
        n=0
        for row in reader:
            print(row['step'])
            n+=1
        data=np.ones((n,9))
    with open ('data_collection.csv','rb') as csvfile:
        reader=csv.DictReader(csvfile)
        m=0
        for row in reader:
            data[m,0]=int(row['step'])
            data[m,1]=float(row['position_x'])
            data[m,2]=float(row['position_y'])
            data[m,3]=float(row['position_z'])
            data[m,4]=float(row['orientation_x'])
            data[m,5]=float(row['orientation_y'])
            data[m,6]=float(row['orientation_z'])
            data[m,7]=float(row['orientation_w'])
            data[m,8]=int(row['grippers'])
            m+=1
    print ('step len:',n)
    col_len=3
    n_epochs=2

    for epoch in range (n_epochs):
        for step in range (col_len):
            p.waitForSync()        
            pickgoal = PoseStamped() 
            pickgoal.header.frame_id = "base"
            pickgoal.header.stamp = rospy.Time.now()
            pickgoal.pose.position.x = data[step%4,1]
            pickgoal.pose.position.y = data[step%4,2]
            pickgoal.pose.position.z = data[step%4,3]
            pickgoal.pose.orientation.x = data[step%4,4]
            pickgoal.pose.orientation.y = data[step%4,5]
            pickgoal.pose.orientation.z = data[step%4,6]
            pickgoal.pose.orientation.w = data[step%4,7]
            gr.moveToPose(pickgoal, "right_gripper", plan_only=False)
            rospy.sleep(2.0)
            if data[step%3,8]==0:
                rightgripper.close()
            else:
                rightgripper.open()
            print ('finished, time:',time.time()-start_time)
            start_time=time.time()
        g.moveToJointPosition(jts_both, pos1, plan_only=False)
        rospy.sleep(15.0)

if __name__=='__main__':
    try:
        rospy.init_node('pnp', anonymous=True)
        picknplace()

    except rospy.ROSInterruptException:
        pass