// ROS
#include <ros/ros.h>
#include <ros/publisher.h>
#include <sensor_msgs/PointCloud2.h>
#include <dynamic_reconfigure/server.h>

// PCL
#include <sensor_msgs/PointCloud2.h>
#include <pcl_conversions/pcl_conversions.h>
#include <pcl/point_cloud.h>
#include <pcl/point_types.h>
#include <pcl/filters/voxel_grid.h>
#include <sensor_msgs/PointCloud.h>
#include <sensor_msgs/point_cloud_conversion.h>
#include <pcl/PCLPointCloud2.h>
#include <pcl/conversions.h>
#include <pcl_ros/transforms.h>
#include <pcl/ModelCoefficients.h>
#include <pcl/sample_consensus/method_types.h>
#include <pcl/sample_consensus/model_types.h>
#include <pcl/segmentation/sac_segmentation.h>
#include <pcl/filters/extract_indices.h>
#include <pcl/filters/passthrough.h>

//TF
#include <tf/transform_listener.h>

//geometry
#include "geometry_msgs/PoseStamped.h"


ros::Publisher pub;
void 
cloud_cb (const sensor_msgs::PointCloud2ConstPtr& input)
{
  pcl::PCLPointCloud2* cloud = new pcl::PCLPointCloud2;
  pcl::PCLPointCloud2ConstPtr cloudPtr(cloud);
  pcl::PCLPointCloud2 cloud_filtered;
  pcl_conversions::toPCL(*input, *cloud);
  pcl::VoxelGrid<pcl::PCLPointCloud2> sor;
  sor.setInputCloud (cloudPtr);
  sor.setLeafSize (0.05, 0.05, 0.05);
  sor.filter (cloud_filtered);
  sensor_msgs::PointCloud2 pcl_in;
  sensor_msgs::PointCloud2 pcl_out;
  pcl_conversions::fromPCL(cloud_filtered, pcl_in);
  pcl::PointCloud<pcl::PointXYZ>::Ptr temp_cloud(new pcl::PointCloud<pcl::PointXYZ>);
  pcl::fromPCLPointCloud2(cloud_filtered,*temp_cloud);
  float x_temp=0;
  float z_temp=0;
  float y_temp=0;
  int count=0;
  pcl::PointCloud<pcl::PointXYZRGB>::Ptr cloud_pub(new pcl::PointCloud<pcl::PointXYZRGB>);
  pcl::PointXYZRGB pt_color;
  tf::TransformListener listener;
  tf::StampedTransform transform;
  //tf::Transformer transform;
  //float gripper_x=0.5189491798; 						
  //float gripper_y=0.1250818048;
  //float gripper_z=-0.1772217644;
  float gripper_x=0.5056303011; 						
  float gripper_y=0.087287458;
  float gripper_z=-0.2270845833;
  float min_dis=100;
  float target_x=0;
  float target_y=0;
  float target_z=0;
  float targethec_x=0;
  float targethec_y=0;
  float targethec_z=0;
  for(int i = 0 ; i < temp_cloud->points.size(); ++i){
  x_temp = temp_cloud->points[i].x;
  y_temp = temp_cloud->points[i].y;
  z_temp = temp_cloud->points[i].z;
  count=count+1;
  listener.waitForTransform("/base", "/camera_depth_optical_frame", ros::Time(), ros::Duration(10.0));
  listener.lookupTransform("/base", "/camera_depth_optical_frame",  ros::Time(0), transform);
  pcl_ros::transformPointCloud("/base",transform,pcl_in, pcl_out);
  pcl::PCLPointCloud2 pcl_pc2;
  pcl_conversions::toPCL(pcl_out,pcl_pc2);
  pcl::PointCloud<pcl::PointXYZ>::Ptr temp_cloud_2(new pcl::PointCloud<pcl::PointXYZ>);
  pcl::fromPCLPointCloud2(pcl_pc2,*temp_cloud_2);
  if (z_temp<1){
      if (z_temp>0.4){
          pt_color.x = temp_cloud->points[i].x;
          pt_color.y = temp_cloud->points[i].y;
          pt_color.z = temp_cloud->points[i].z;
          pt_color.r=static_cast<int> (255);
          pt_color.g=static_cast<int> (0);
          pt_color.b=static_cast<int> (0);
          cloud_pub->points.push_back(pt_color);
          float x_display=temp_cloud_2->points[i].x;
          float y_display=temp_cloud_2->points[i].y;
          float z_display=temp_cloud_2->points[i].z;
          ROS_INFO("temp_cloud->points x:[%f], y:[%f], z[%f], cout[%i]",x_temp,y_temp,z_temp,count);
          ROS_INFO("temp_cloud_2->points x:[%f], y:[%f], z[%f], cout[%i]",x_display,y_display,z_display,count);
          float dis=sqrt(pow((gripper_x-x_display),2)+pow((gripper_y-y_display),2)+pow((gripper_z-z_display),2));
          if (min_dis>dis){
            min_dis=dis;
            target_x=temp_cloud->points[i].x;
            target_y=temp_cloud->points[i].y;
            target_z=temp_cloud->points[i].z;
            targethec_x=x_display;
            targethec_y=y_display;
            targethec_z=z_display;
          }
      }
  }
}
pt_color.x = target_x;
pt_color.y = target_y;
pt_color.z = target_z;
pt_color.r=static_cast<int> (0);
pt_color.g=static_cast<int> (255);
pt_color.b=static_cast<int> (0);
ROS_INFO("minimal distance [%f], target_x [%f], target_y [%f], target_z [%f]",min_dis,targethec_x,targethec_y,targethec_z);
cloud_pub->points.push_back(pt_color);

sensor_msgs::PointCloud2 cloud_publish;
pcl::toROSMsg(*cloud_pub,cloud_publish);
cloud_publish.header = input->header;
pub.publish (cloud_publish);
}

int
main (int argc, char** argv)
{
  ros::init (argc, argv, "pcl_cloud_point");
  ros::NodeHandle nh;
  ros::Subscriber sub = nh.subscribe ("input", 1, cloud_cb);
  pub = nh.advertise<sensor_msgs::PointCloud2> ("output", 1);
  ros::spin ();
}