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
import argparse

def picknplace():
    p = PlanningSceneInterface("base")
    g = MoveGroupInterface("both_arms", "base")
    gr = MoveGroupInterface("right_arm", "base")
    gl = MoveGroupInterface("left_arm", "base")
    leftgripper = baxter_interface.Gripper('left')
    rightgripper=baxter_interface.Gripper('right')
    jts_both = ['left_e0', 'left_e1', 'left_s0', 'left_s1', 'left_w0', 'left_w1', 'left_w2', 'right_e0', 'right_e1', 'right_s0', 'right_s1', 'right_w0', 'right_w1', 'right_w2']
    jts_right = ['right_e0', 'right_e1', 'right_s0', 'right_s1', 'right_w0', 'right_w1', 'right_w2']
    jts_left = ['left_e0', 'left_e1', 'left_s0', 'left_s1', 'left_w0', 'left_w1', 'left_w2']
    pos1 = [-1.441426162661994, 0.8389151064712133, 0.14240920034028015, -0.14501001475655606, -1.7630090377446503, -1.5706376573674472, 0.09225918246029519,1.7238109084167481, 1.7169079948791506, 0.36930587426147465, -0.33249033539428713, -1.2160632682067871, 1.668587600115967, -1.810097327636719]
    pos2 = [-0.949534106616211, 1.4994662184448244, -0.6036214393432617, -0.7869321432861328, -2.4735440176391603, -1.212228316241455, -0.8690001153442384, 1.8342575250183106, 1.8668546167236328, -0.45674277907104494, -0.21667478604125978, -1.2712865765075685, 1.7472041154052735, -2.4582042097778323]
    lpos1 = [-1.441426162661994, 0.8389151064712133, 0.14240920034028015, -0.14501001475655606, -1.7630090377446503, -1.5706376573674472, 0.09225918246029519]
    lpos2 = [-0.949534106616211, 1.4994662184448244, -0.6036214393432617, -0.7869321432861328, -2.4735440176391603, -1.212228316241455, -0.8690001153442384]    
    rpos1 = [1.7238109084167481, 1.7169079948791506, 0.36930587426147465, -0.33249033539428713, -1.2160632682067871, 1.668587600115967, -1.810097327636719]
    rpos2 = [1.8342575250183106, 1.8668546167236328, -0.45674277907104494, -0.21667478604125978, -1.2712865765075685, 1.7472041154052735, -2.4582042097778323]

    parser = argparse.ArgumentParser(description='Known Configurations Manipulation Routes')
    parser.add_argument('--shape', type=str, default='none',
                        help='recoginsed garment shape')
    parser.add_argument('--pos', type=int, default=0,
                        help='recognised garment-grasping point')
    args = parser.parse_args()

    name='./routes/'+args.shape+'s/pos_'+str(args.pos).zfill(4)+'/routes.csv'
    start_time=time.time()
    with open (name,'rb') as csvfile:
        reader=csv.DictReader(csvfile)
        n=0
        for row in reader:
            n+=1
        data=np.ones((n,17))
    directions=[]
    grippers=[]
    with open (name,'rb') as csvfile:
        reader=csv.DictReader(csvfile)
        m=0
        for row in reader:
            data[m,0]=int(row['step'])
            data[m,1]=float(row['r_position_x'])
            data[m,2]=float(row['r_position_y'])
            data[m,3]=float(row['r_position_z'])
            data[m,4]=float(row['r_orientation_x'])
            data[m,5]=float(row['r_orientation_y'])
            data[m,6]=float(row['r_orientation_z'])
            data[m,7]=float(row['r_orientation_w'])
            data[m,8]=float(row['l_position_x'])
            data[m,9]=float(row['l_position_y'])
            data[m,10]=float(row['l_position_z'])
            data[m,11]=float(row['l_orientation_x'])
            data[m,12]=float(row['l_orientation_y'])
            data[m,13]=float(row['l_orientation_z'])
            data[m,14]=float(row['l_orientation_w'])
            directions.append(str(row['direction']))
            grippers.append(str(row['gripper']))
            m+=1
    print ('step len:',n)
    col_len=n
    n_epochs=1

    for epoch in range (n_epochs):
        for step in range (col_len):
            if grippers[step]=='r_o':
                rightgripper.open()
            if grippers[step]=='r_c':
                rightgripper.close()
            if grippers[step]=='l_o':
                leftgripper.open()
            if grippers[step]=='l_c':
                leftgripper.close()
            if grippers[step]=='rl_o':
                rightgripper.open()
                leftgripper.open()
            if grippers[step]=='l_c_r_o':
                leftgripper.close()
                rospy.sleep(2)
                rightgripper.open() 
            else:
                p.waitForSync()        
                pickgoal_r = PoseStamped()
                pickgoal_l=PoseStamped() 
                pickgoal_r.header.frame_id = "base"
                pickgoal_l.header.frame_id = "base"
                pickgoal_r.header.stamp = rospy.Time.now()
                pickgoal_l.header.stamp = rospy.Time.now()
                pickgoal_r.pose.position.x = data[step,1]
                pickgoal_r.pose.position.y = data[step,2]
                pickgoal_r.pose.position.z = data[step,3]
                pickgoal_r.pose.orientation.x = data[step,4]
                pickgoal_r.pose.orientation.y = data[step,5]
                pickgoal_r.pose.orientation.z = data[step,6]
                pickgoal_r.pose.orientation.w = data[step,7]
                pickgoal_l.pose.position.x = data[step,8]
                pickgoal_l.pose.position.y = data[step,9]
                pickgoal_l.pose.position.z = data[step,10]
                pickgoal_l.pose.orientation.x = data[step,11]
                pickgoal_l.pose.orientation.y = data[step,12]
                pickgoal_l.pose.orientation.z = data[step,13]
                pickgoal_l.pose.orientation.w = data[step,14]
                if directions[step]=='right':
                    gr.moveToPose(pickgoal_r, "right_gripper", plan_only=False)
                    rospy.sleep(2.0)
                if directions[step]=='left':
                    gl.moveToPose(pickgoal_l, "left_gripper", plan_only=False)
                    rospy.sleep(2.0)
                if directions[step]=='both':
                    gr.moveToPose(pickgoal_r, "right_gripper", plan_only=False)
                    rospy.sleep(2.0)
                    gl.moveToPose(pickgoal_l, "left_gripper", plan_only=False)
                    rospy.sleep(2.0)
            if grippers[step]=='w_r_c':
                rightgripper.close()
            if grippers[step]=='w_r_o_l_o':
                rightgripper.open()
                leftgripper.open()
            if grippers[step]=='w_r_o_l_c':
                rightgripper.open()
                leftgripper.close()
                
            print ('step',step+1,'finished, time:',time.time()-start_time)
            start_time=time.time()

if __name__=='__main__':
    try:
        rospy.init_node('pnp', anonymous=True)
        picknplace()

    except rospy.ROSInterruptException:
        pass