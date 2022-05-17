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


ros::Publisher pub;
double point2planedistnace(pcl::PointXYZ pt, pcl::ModelCoefficients::Ptr coefficients){
    double f1 = fabs(coefficients->values[0]*pt.x+coefficients->values[1]*pt.y+coefficients->values[2]*pt.z+coefficients->values[3]);
    double f2 = sqrt(pow(coefficients->values[0],2)+pow(coefficients->values[1],2)+pow(coefficients->values[2],2));
    return f1/f2;
}

class ColorMap{
public:
    ColorMap(double mn, double mx): mn(mn), mx(mx){}
    void setMinMax(double min, double max){ mn = min; mx = max;}
    void setMin(double min){mn = min;}
    void setMax(double max){mx = max;}
    void getColor(double c,uint8_t& R, uint8_t& G, uint8_t& B){
        double normalized = (c - mn)/(mx-mn) * 2 - 1;
        R = (int) (base(normalized - 0.5) * 255);
        G = (int) (base(normalized) * 255);
        B = (int) (base(normalized + 0.5) * 255);
    }
    void getColor(double c, double &rd, double &gd, double &bd){
        uint8_t r;
        uint8_t g;
        uint8_t b;
        getColor(c,r,g,b);
        rd = (double)r/255;
        gd = (double)g/255;
        bd = (double)b/255;
    }
    uint32_t getColor(double c){
        uint8_t r;
        uint8_t g;
        uint8_t b;
        getColor(c,r,g,b);
        return ((uint32_t)r<<16|(uint32_t)g<<8|(uint32_t)b);
    }


private:
    double interpolate(double val, double y0, double x0, double y1, double x1){
        return (val - x0)*(y1-y0)/(x1-x0) + y0;
    }
    double base(double val){
        if (val <= -0.75) return 0;
        else if (val <= -0.25) return interpolate(val,0,-0.75,1,-0.25);
        else if (val <= 0.25) return 1;
        else if (val <= 0.75) return interpolate(val,1.0,0.25,0.0,0.75);
        else return 0;
    }
private:
    double mn,mx;
};

class Color{
private:
    uint8_t r;
    uint8_t g;
    uint8_t b;

public:
    Color(uint8_t R,uint8_t G,uint8_t B):r(R),g(G),b(B){

    }

    void getColor(uint8_t &R,uint8_t &G,uint8_t &B){
        R = r;
        G = g;
        B = b;
    }
    void getColor(double &rd, double &gd, double &bd){
        rd = (double)r/255;
        gd = (double)g/255;
        bd = (double)b/255;
    }
    uint32_t getColor(){
        return ((uint32_t)r<<16|(uint32_t)g<<8|(uint32_t)b);
    }
};
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
  sensor_msgs::PointCloud2 output;
  pcl_conversions::fromPCL(cloud_filtered, output);
  pcl::PointCloud<pcl::PointXYZ>::Ptr temp_cloud(new pcl::PointCloud<pcl::PointXYZ>);
  pcl::fromPCLPointCloud2(cloud_filtered,*temp_cloud);
  float x_temp=0;
  float z_temp=0;
  float y_temp=0;
  int count=0;
  for(int i = 0 ; i < temp_cloud->points.size(); ++i){
  x_temp = x_temp+temp_cloud->points[i].x;
  y_temp = y_temp+temp_cloud->points[i].y;
  z_temp = z_temp+temp_cloud->points[i].z;
  count+=1;
}
  ROS_INFO("temp_cloud->points x:[%f], y:[%f], z[%f], count [%i]",x_temp/count,y_temp/count,z_temp/count,count);
  pub.publish (output);
  //pcl::PCLPointCloud2* cloud = new pcl::PCLPointCloud2;
  //pcl::PCLPointCloud2ConstPtr cloudPtr(cloud);
  //pcl::PCLPointCloud2 cloud_filtered;
  //pcl_conversions::toPCL(*input, *cloud);
  //pcl::VoxelGrid<pcl::PCLPointCloud2> sor;
  //sor.setInputCloud (cloudPtr);
  //sor.setLeafSize (0.05, 0.05, 0.05);
  //sor.filter (cloud_filtered);
  //sensor_msgs::PointCloud2 output;
  //pcl_conversions::fromPCL(cloud_filtered, output);
  //pcl::PointCloud<pcl::PointXYZ>::Ptr temp_cloud(new pcl::PointCloud<pcl::PointXYZ>);
  //pcl::fromPCLPointCloud2(cloud_filtered,*temp_cloud);
  //pcl::ModelCoefficients::Ptr coefficients (new pcl::ModelCoefficients);
  //pcl::PointIndices::Ptr inliers (new pcl::PointIndices);
  //pcl::SACSegmentation<pcl::PointXYZ> seg;
  //seg.setOptimizeCoefficients (true);
  //seg.setModelType (pcl::SACMODEL_PLANE);
  //seg.setMethodType (pcl::SAC_RANSAC);
  //seg.setDistanceThreshold (0.01);

  //pcl::PointCloud<pcl::PointXYZRGB>::Ptr cloud_pub(new pcl::PointCloud<pcl::PointXYZRGB>);
  //int original_size(temp_cloud->height*temp_cloud->width);
  //int n_planes(0);
  //double _min_percentage=5;
  //while (temp_cloud->height*temp_cloud->width>original_size*_min_percentage/100){
  //  seg.setInputCloud(temp_cloud);
  //  seg.segment(*inliers, *coefficients);
  //  if (inliers->indices.size() == 0)
  //      break;
  //  double mean_error(0);
  //  double max_error(0);
  //  double min_error(100000);
  //  std::vector<double> err;
  //  for (int i=0;i<inliers->indices.size();i++){
  //      pcl::PointXYZ pt = temp_cloud->points[inliers->indices[i]];
  //      double d = point2planedistnace(pt,coefficients)*1000;
  //      err.push_back(d);
  //      mean_error += d;
  //      if (d>max_error) max_error = d;
  //      if (d<min_error) min_error = d;
  //      }
  //      mean_error/=inliers->indices.size();
  //      ColorMap cm(min_error,max_error);
  //      double sigma(0);
  //      bool _color_pc_with_error=false;
  //      std::vector<Color> colors;
  //      for (int i=0;i<inliers->indices.size();i++){
  //          sigma += pow(err[i] - mean_error,2);
  //          pcl::PointXYZ pt = temp_cloud->points[inliers->indices[i]];
  //          pcl::PointXYZRGB pt_color;
  //          pt_color.x = pt.x;
  //          pt_color.y = pt.y;
  //          pt_color.z = pt.z;
  //          uint32_t rgb;
  //          if (_color_pc_with_error)
  //              rgb = cm.getColor(err[i]);

  //          else{
    //          //rgb = colors[n_planes].getColor();
    //            //pt_color.rgb = *reinterpret_cast<float*>(&rgb);
    //            ROS_INFO("N_planes for Colors:[%i]",n_planes);
    //            //if (10<n_planes<=13){
    //            //pt_color.r=static_cast<int> (255);
    //            //pt_color.g=static_cast<int> (0);
    //            //pt_color.b=static_cast<int> (0);
    //            //}
    //            //if (13<n_planes<=15){
    //            //pt_color.r=static_cast<int> (0);
    //            //pt_color.g=static_cast<int> (255);
    //            //pt_color.b=static_cast<int> (0);
    //            //}
    //            if (n_planes==16){
    //            pt_color.r=static_cast<int> (128);
    //            pt_color.g=static_cast<int> (0);
    //            pt_color.b=static_cast<int> (128);
    //            }
    //            //if (n_planes>20){
    //            //pt_color.r=static_cast<int> (0);
    //            //pt_color.g=static_cast<int> (0);
    //            //pt_color.b=static_cast<int> (255);
    //            // }
    //            cloud_pub->points.push_back(pt_color);
    //        }
    //    }
    //    pcl::ExtractIndices<pcl::PointXYZ> extract;
    //    sigma = sqrt(sigma/inliers->indices.size());
    //    extract.setInputCloud(temp_cloud);
    //    extract.setIndices(inliers);
    //    extract.setNegative(true);
    //    pcl::PointCloud<pcl::PointXYZ> cloudF;
    //    extract.filter(cloudF);
    //    temp_cloud->swap(cloudF);

    //    ROS_INFO("fitted plane %i: %fx%s%fy%s%fz%s%f=0 (inliers: %zu/%i)",
    //    n_planes,
    //    coefficients->values[0],(coefficients->values[1]>=0?"+":""),
    //    coefficients->values[1],(coefficients->values[2]>=0?"+":""),
    //    coefficients->values[2],(coefficients->values[3]>=0?"+":""),
    //    coefficients->values[3],
    //    inliers->indices.size(),original_size);
    //    ROS_INFO("mean error: %f(mm), standard deviation: %f (mm), max error: %f(mm)",mean_error,sigma,max_error);
    //    ROS_INFO("poitns left in cloud %i",temp_cloud->width*temp_cloud->height);
    //    n_planes++;
    //    }
    //    ROS_INFO("N_PLANES: [%i]",n_planes);
    //    sensor_msgs::PointCloud2 cloud_publish;
    //    pcl::toROSMsg(*cloud_pub,cloud_publish);
    //    cloud_publish.header = input->header;
    //    pub.publish(cloud_publish);
}

int
main (int argc, char** argv)
{
  ros::init (argc, argv, "pcl_cloud_point_segmentation");
  ros::NodeHandle nh;
  ros::Subscriber sub = nh.subscribe ("input", 1, cloud_cb);
  pub = nh.advertise<sensor_msgs::PointCloud2> ("segemented_output", 1);
  ros::spin ();
}