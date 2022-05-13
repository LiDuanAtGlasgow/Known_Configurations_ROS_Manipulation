;; Auto-generated. Do not edit!


(when (boundp 'twodto3d::twodto3d)
  (if (not (find-package "TWODTO3D"))
    (make-package "TWODTO3D"))
  (shadow 'twodto3d (find-package "TWODTO3D")))
(unless (find-package "TWODTO3D::TWODTO3D")
  (make-package "TWODTO3D::TWODTO3D"))
(unless (find-package "TWODTO3D::TWODTO3DREQUEST")
  (make-package "TWODTO3D::TWODTO3DREQUEST"))
(unless (find-package "TWODTO3D::TWODTO3DRESPONSE")
  (make-package "TWODTO3D::TWODTO3DRESPONSE"))

(in-package "ROS")

(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass twodto3d::twodto3dRequest
  :super ros::object
  :slots (_two_d_array ))

(defmethod twodto3d::twodto3dRequest
  (:init
   (&key
    ((:two_d_array __two_d_array) (instance std_msgs::Float32MultiArray :init))
    )
   (send-super :init)
   (setq _two_d_array __two_d_array)
   self)
  (:two_d_array
   (&rest __two_d_array)
   (if (keywordp (car __two_d_array))
       (send* _two_d_array __two_d_array)
     (progn
       (if __two_d_array (setq _two_d_array (car __two_d_array)))
       _two_d_array)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Float32MultiArray _two_d_array
    (send _two_d_array :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Float32MultiArray _two_d_array
       (send _two_d_array :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Float32MultiArray _two_d_array
     (send _two_d_array :deserialize buf ptr-) (incf ptr- (send _two_d_array :serialization-length))
   ;;
   self)
  )

(defclass twodto3d::twodto3dResponse
  :super ros::object
  :slots (_three_d_array ))

(defmethod twodto3d::twodto3dResponse
  (:init
   (&key
    ((:three_d_array __three_d_array) (instance std_msgs::Float32MultiArray :init))
    )
   (send-super :init)
   (setq _three_d_array __three_d_array)
   self)
  (:three_d_array
   (&rest __three_d_array)
   (if (keywordp (car __three_d_array))
       (send* _three_d_array __three_d_array)
     (progn
       (if __three_d_array (setq _three_d_array (car __three_d_array)))
       _three_d_array)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Float32MultiArray _three_d_array
    (send _three_d_array :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Float32MultiArray _three_d_array
       (send _three_d_array :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Float32MultiArray _three_d_array
     (send _three_d_array :deserialize buf ptr-) (incf ptr- (send _three_d_array :serialization-length))
   ;;
   self)
  )

(defclass twodto3d::twodto3d
  :super ros::object
  :slots ())

(setf (get twodto3d::twodto3d :md5sum-) "0a72e6459b11515d7f19e6e41260f1a9")
(setf (get twodto3d::twodto3d :datatype-) "twodto3d/twodto3d")
(setf (get twodto3d::twodto3d :request) twodto3d::twodto3dRequest)
(setf (get twodto3d::twodto3d :response) twodto3d::twodto3dResponse)

(defmethod twodto3d::twodto3dRequest
  (:response () (instance twodto3d::twodto3dResponse :init)))

(setf (get twodto3d::twodto3dRequest :md5sum-) "0a72e6459b11515d7f19e6e41260f1a9")
(setf (get twodto3d::twodto3dRequest :datatype-) "twodto3d/twodto3dRequest")
(setf (get twodto3d::twodto3dRequest :definition-)
      "std_msgs/Float32MultiArray two_d_array

================================================================================
MSG: std_msgs/Float32MultiArray
# Please look at the MultiArrayLayout message definition for
# documentation on all multiarrays.

MultiArrayLayout  layout        # specification of data layout
float32[]         data          # array of data


================================================================================
MSG: std_msgs/MultiArrayLayout
# The multiarray declares a generic multi-dimensional array of a
# particular data type.  Dimensions are ordered from outer most
# to inner most.

MultiArrayDimension[] dim # Array of dimension properties
uint32 data_offset        # padding elements at front of data

# Accessors should ALWAYS be written in terms of dimension stride
# and specified outer-most dimension first.
# 
# multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]
#
# A standard, 3-channel 640x480 image with interleaved color channels
# would be specified as:
#
# dim[0].label  = \"height\"
# dim[0].size   = 480
# dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)
# dim[1].label  = \"width\"
# dim[1].size   = 640
# dim[1].stride = 3*640 = 1920
# dim[2].label  = \"channel\"
# dim[2].size   = 3
# dim[2].stride = 3
#
# multiarray(i,j,k) refers to the ith row, jth column, and kth channel.

================================================================================
MSG: std_msgs/MultiArrayDimension
string label   # label of given dimension
uint32 size    # size of given dimension (in type units)
---
std_msgs/Float32MultiArray three_d_array


================================================================================
MSG: std_msgs/Float32MultiArray
# Please look at the MultiArrayLayout message definition for
# documentation on all multiarrays.

MultiArrayLayout  layout        # specification of data layout
float32[]         data          # array of data


================================================================================
MSG: std_msgs/MultiArrayLayout
# The multiarray declares a generic multi-dimensional array of a
# particular data type.  Dimensions are ordered from outer most
# to inner most.

MultiArrayDimension[] dim # Array of dimension properties
uint32 data_offset        # padding elements at front of data

# Accessors should ALWAYS be written in terms of dimension stride
# and specified outer-most dimension first.
# 
# multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]
#
# A standard, 3-channel 640x480 image with interleaved color channels
# would be specified as:
#
# dim[0].label  = \"height\"
# dim[0].size   = 480
# dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)
# dim[1].label  = \"width\"
# dim[1].size   = 640
# dim[1].stride = 3*640 = 1920
# dim[2].label  = \"channel\"
# dim[2].size   = 3
# dim[2].stride = 3
#
# multiarray(i,j,k) refers to the ith row, jth column, and kth channel.

================================================================================
MSG: std_msgs/MultiArrayDimension
string label   # label of given dimension
uint32 size    # size of given dimension (in type units)
")

(setf (get twodto3d::twodto3dResponse :md5sum-) "0a72e6459b11515d7f19e6e41260f1a9")
(setf (get twodto3d::twodto3dResponse :datatype-) "twodto3d/twodto3dResponse")
(setf (get twodto3d::twodto3dResponse :definition-)
      "std_msgs/Float32MultiArray two_d_array

================================================================================
MSG: std_msgs/Float32MultiArray
# Please look at the MultiArrayLayout message definition for
# documentation on all multiarrays.

MultiArrayLayout  layout        # specification of data layout
float32[]         data          # array of data


================================================================================
MSG: std_msgs/MultiArrayLayout
# The multiarray declares a generic multi-dimensional array of a
# particular data type.  Dimensions are ordered from outer most
# to inner most.

MultiArrayDimension[] dim # Array of dimension properties
uint32 data_offset        # padding elements at front of data

# Accessors should ALWAYS be written in terms of dimension stride
# and specified outer-most dimension first.
# 
# multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]
#
# A standard, 3-channel 640x480 image with interleaved color channels
# would be specified as:
#
# dim[0].label  = \"height\"
# dim[0].size   = 480
# dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)
# dim[1].label  = \"width\"
# dim[1].size   = 640
# dim[1].stride = 3*640 = 1920
# dim[2].label  = \"channel\"
# dim[2].size   = 3
# dim[2].stride = 3
#
# multiarray(i,j,k) refers to the ith row, jth column, and kth channel.

================================================================================
MSG: std_msgs/MultiArrayDimension
string label   # label of given dimension
uint32 size    # size of given dimension (in type units)
---
std_msgs/Float32MultiArray three_d_array


================================================================================
MSG: std_msgs/Float32MultiArray
# Please look at the MultiArrayLayout message definition for
# documentation on all multiarrays.

MultiArrayLayout  layout        # specification of data layout
float32[]         data          # array of data


================================================================================
MSG: std_msgs/MultiArrayLayout
# The multiarray declares a generic multi-dimensional array of a
# particular data type.  Dimensions are ordered from outer most
# to inner most.

MultiArrayDimension[] dim # Array of dimension properties
uint32 data_offset        # padding elements at front of data

# Accessors should ALWAYS be written in terms of dimension stride
# and specified outer-most dimension first.
# 
# multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]
#
# A standard, 3-channel 640x480 image with interleaved color channels
# would be specified as:
#
# dim[0].label  = \"height\"
# dim[0].size   = 480
# dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)
# dim[1].label  = \"width\"
# dim[1].size   = 640
# dim[1].stride = 3*640 = 1920
# dim[2].label  = \"channel\"
# dim[2].size   = 3
# dim[2].stride = 3
#
# multiarray(i,j,k) refers to the ith row, jth column, and kth channel.

================================================================================
MSG: std_msgs/MultiArrayDimension
string label   # label of given dimension
uint32 size    # size of given dimension (in type units)
")



(provide :twodto3d/twodto3d "0a72e6459b11515d7f19e6e41260f1a9")


