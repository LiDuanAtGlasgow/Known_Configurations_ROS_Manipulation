#!/usr/bin/env python
#type:ignore
import sys
import cv2
from cv_bridge import CvBridge, CvBridgeError
from std_msgs.msg import String
from sensor_msgs.msg import Image
import rospy
import numpy as np
import time
import message_filters
import os 

class image_convert:
    def __init__(self,pos):
        self.image_depth=message_filters.Subscriber("/camera/depth/image_raw",Image)
        self.image_rgb=message_filters.Subscriber("/camera/rgb/image_raw",Image)
        self.bridge=CvBridge()
        self.time_sychronization=message_filters.ApproximateTimeSynchronizer([self.image_depth,self.image_rgb],queue_size=10,slop=0.01,allow_headerless=True)
        self.start_time=time.time()
        self.pos=pos

    def callback(self,image_depth,image_rgb):
        cv_image_rgb=self.bridge.imgmsg_to_cv2(image_rgb)
        cv_image_rgb=cv2.cvtColor(cv_image_rgb, cv2.COLOR_BGR2RGB)
        cv_image_depth=self.bridge.imgmsg_to_cv2(image_depth,"32FC1")
        cv_image_depth = np.array(cv_image_depth, dtype=np.float32)
        cv2.normalize(cv_image_depth, cv_image_depth, 0, 1, cv2.NORM_MINMAX)
        cv_image_depth=cv_image_depth*255
        if time.time()-self.start_time>0.1:
            cv2.imwrite('/home/kentuen/Known_Configurations_datas/GarNet_KCNet/continuous_perception/tshirts/pos_'+str(self.pos).zfill(4)+'_/'+'%f_depth.png'%(time.time()),cv_image_depth)
            cv2.imwrite('/home/kentuen/Known_Configurations_datas/GarNet_KCNet/continuous_perception/tshirts/pos_'+str(self.pos).zfill(4)+'_/'+'%f_rgb.png'%(time.time()),cv_image_rgb)
            self.start_time=time.time()
            print ('Photo taken!')
        cv2.waitKey(3)
    
    def image_capture(self):
        print ('image capture starts...')
        self.time_sychronization.registerCallback(self.callback)


def main(args):
    pos=1
    direcorty='/home/kentuen/Known_Configurations_datas/GarNet_KCNet/continuous_perception/tshirts/pos_'+str(pos).zfill(4)+'_/'
    if not os.path.exists(direcorty):
        os.makedirs(direcorty)
    rospy.init_node("cv_image_convertor",anonymous=True)
    convertor=image_convert(pos=pos)
    convertor.image_capture()
    try:
        rospy.spin()
    except KeyboardInterrupt:
        print ("Shut Down...")

if __name__=="__main__":
    main(sys.argv)
