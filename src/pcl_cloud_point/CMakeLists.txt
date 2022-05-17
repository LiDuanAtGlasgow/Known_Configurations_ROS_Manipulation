cmake_minimum_required(VERSION 2.8.3)
project(pcl_cloud_point)
find_package(catkin REQUIRED COMPONENTS
  pcl_ros
  roscpp
  sensor_msgs
  visualization_msgs
  dynamic_reconfigure
)
catkin_package()
include_directories(${catkin_INCLUDE_DIRS})
add_executable(segmentation src/segmentation.cpp)
target_link_libraries(segmentation ${catkin_LIBRARIES} ${PCL_LIBRARIES})
