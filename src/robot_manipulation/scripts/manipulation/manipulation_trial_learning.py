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

def del_meth(somelist, rem):
    for i in rem:
        somelist[i]='!' 
    for i in range(0,somelist.count('!')):
        somelist.remove('!')
    return somelist

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
    n=10
    start_time=time.time()

    while n>0:
        n-=1
        p.waitForSync()        
        #g.moveToJointPosition(jts_both, pos2, plan_only=False)

        pickgoal = PoseStamped() 
        pickgoal.header.frame_id = "base"
        pickgoal.header.stamp = rospy.Time.now()
        pickgoal.pose.position.x = 0.493193509665
        pickgoal.pose.position.y = -0.0144730317973
        pickgoal.pose.position.z = -0.203235216733
        pickgoal.pose.orientation.x = -1
        pickgoal.pose.orientation.y = 0
        pickgoal.pose.orientation.z = 0
        pickgoal.pose.orientation.w = 0
        gr.moveToPose(pickgoal, "right_gripper", plan_only=False)
        rospy.sleep(2.0)
        rightgripper.close()
        pickgoal=PoseStamped()
        pickgoal.header.frame_id = "base"
        pickgoal.header.stamp = rospy.Time.now()
        pickgoal.pose.position.x = 0.493193509665
        pickgoal.pose.position.y = -0.0144730317973
        pickgoal.pose.position.z = -0.081924473793
        pickgoal.pose.orientation.x = -1
        pickgoal.pose.orientation.y = 0
        pickgoal.pose.orientation.z = 0
        pickgoal.pose.orientation.w = 0
        gr.moveToPose(pickgoal, "right_gripper", plan_only=False)
        rospy.sleep(2.0)
        pickgoal=PoseStamped()
        pickgoal.header.frame_id = "base"
        pickgoal.header.stamp = rospy.Time.now()
        pickgoal.pose.position.x = 0.493193509665
        pickgoal.pose.position.y = 0.20874886234
        pickgoal.pose.position.z = -0.081924473793
        pickgoal.pose.orientation.x = -1
        pickgoal.pose.orientation.y = 0
        pickgoal.pose.orientation.z = 0
        pickgoal.pose.orientation.w = 0
        gr.moveToPose(pickgoal, "right_gripper", plan_only=False)
        rospy.sleep(2.0)
        pickgoal=PoseStamped()
        pickgoal.header.frame_id = "base"
        pickgoal.header.stamp = rospy.Time.now()
        pickgoal.pose.position.x = 0.493193509665
        pickgoal.pose.position.y = 0.20874886234
        pickgoal.pose.position.z = -0.203235216733
        pickgoal.pose.orientation.x = -1
        pickgoal.pose.orientation.y = 0
        pickgoal.pose.orientation.z = 0
        pickgoal.pose.orientation.w = 0
        gr.moveToPose(pickgoal, "right_gripper", plan_only=False)
        rospy.sleep(2.0)
        rightgripper.open()
        g.moveToJointPosition(jts_both, pos1, plan_only=False)
        rospy.sleep(2.0)
        print ('finished, time:',time.time()-start_time)
        start_time=time.time()
if __name__=='__main__':
    try:
        rospy.init_node('pnp', anonymous=True)
        picknplace()

    except rospy.ROSInterruptException:
        pass