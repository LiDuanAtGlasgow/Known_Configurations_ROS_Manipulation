; Auto-generated. Do not edit!


(cl:in-package twodto3d-srv)


;//! \htmlinclude twodto3d-request.msg.html

(cl:defclass <twodto3d-request> (roslisp-msg-protocol:ros-message)
  ((two_d_array
    :reader two_d_array
    :initarg :two_d_array
    :type std_msgs-msg:Float32MultiArray
    :initform (cl:make-instance 'std_msgs-msg:Float32MultiArray)))
)

(cl:defclass twodto3d-request (<twodto3d-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <twodto3d-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'twodto3d-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name twodto3d-srv:<twodto3d-request> is deprecated: use twodto3d-srv:twodto3d-request instead.")))

(cl:ensure-generic-function 'two_d_array-val :lambda-list '(m))
(cl:defmethod two_d_array-val ((m <twodto3d-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader twodto3d-srv:two_d_array-val is deprecated.  Use twodto3d-srv:two_d_array instead.")
  (two_d_array m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <twodto3d-request>) ostream)
  "Serializes a message object of type '<twodto3d-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'two_d_array) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <twodto3d-request>) istream)
  "Deserializes a message object of type '<twodto3d-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'two_d_array) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<twodto3d-request>)))
  "Returns string type for a service object of type '<twodto3d-request>"
  "twodto3d/twodto3dRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'twodto3d-request)))
  "Returns string type for a service object of type 'twodto3d-request"
  "twodto3d/twodto3dRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<twodto3d-request>)))
  "Returns md5sum for a message object of type '<twodto3d-request>"
  "0a72e6459b11515d7f19e6e41260f1a9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'twodto3d-request)))
  "Returns md5sum for a message object of type 'twodto3d-request"
  "0a72e6459b11515d7f19e6e41260f1a9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<twodto3d-request>)))
  "Returns full string definition for message of type '<twodto3d-request>"
  (cl:format cl:nil "std_msgs/Float32MultiArray two_d_array~%~%================================================================================~%MSG: std_msgs/Float32MultiArray~%# Please look at the MultiArrayLayout message definition for~%# documentation on all multiarrays.~%~%MultiArrayLayout  layout        # specification of data layout~%float32[]         data          # array of data~%~%~%================================================================================~%MSG: std_msgs/MultiArrayLayout~%# The multiarray declares a generic multi-dimensional array of a~%# particular data type.  Dimensions are ordered from outer most~%# to inner most.~%~%MultiArrayDimension[] dim # Array of dimension properties~%uint32 data_offset        # padding elements at front of data~%~%# Accessors should ALWAYS be written in terms of dimension stride~%# and specified outer-most dimension first.~%# ~%# multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]~%#~%# A standard, 3-channel 640x480 image with interleaved color channels~%# would be specified as:~%#~%# dim[0].label  = \"height\"~%# dim[0].size   = 480~%# dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)~%# dim[1].label  = \"width\"~%# dim[1].size   = 640~%# dim[1].stride = 3*640 = 1920~%# dim[2].label  = \"channel\"~%# dim[2].size   = 3~%# dim[2].stride = 3~%#~%# multiarray(i,j,k) refers to the ith row, jth column, and kth channel.~%~%================================================================================~%MSG: std_msgs/MultiArrayDimension~%string label   # label of given dimension~%uint32 size    # size of given dimension (in type units)~%uint32 stride  # stride of given dimension~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'twodto3d-request)))
  "Returns full string definition for message of type 'twodto3d-request"
  (cl:format cl:nil "std_msgs/Float32MultiArray two_d_array~%~%================================================================================~%MSG: std_msgs/Float32MultiArray~%# Please look at the MultiArrayLayout message definition for~%# documentation on all multiarrays.~%~%MultiArrayLayout  layout        # specification of data layout~%float32[]         data          # array of data~%~%~%================================================================================~%MSG: std_msgs/MultiArrayLayout~%# The multiarray declares a generic multi-dimensional array of a~%# particular data type.  Dimensions are ordered from outer most~%# to inner most.~%~%MultiArrayDimension[] dim # Array of dimension properties~%uint32 data_offset        # padding elements at front of data~%~%# Accessors should ALWAYS be written in terms of dimension stride~%# and specified outer-most dimension first.~%# ~%# multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]~%#~%# A standard, 3-channel 640x480 image with interleaved color channels~%# would be specified as:~%#~%# dim[0].label  = \"height\"~%# dim[0].size   = 480~%# dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)~%# dim[1].label  = \"width\"~%# dim[1].size   = 640~%# dim[1].stride = 3*640 = 1920~%# dim[2].label  = \"channel\"~%# dim[2].size   = 3~%# dim[2].stride = 3~%#~%# multiarray(i,j,k) refers to the ith row, jth column, and kth channel.~%~%================================================================================~%MSG: std_msgs/MultiArrayDimension~%string label   # label of given dimension~%uint32 size    # size of given dimension (in type units)~%uint32 stride  # stride of given dimension~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <twodto3d-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'two_d_array))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <twodto3d-request>))
  "Converts a ROS message object to a list"
  (cl:list 'twodto3d-request
    (cl:cons ':two_d_array (two_d_array msg))
))
;//! \htmlinclude twodto3d-response.msg.html

(cl:defclass <twodto3d-response> (roslisp-msg-protocol:ros-message)
  ((three_d_array
    :reader three_d_array
    :initarg :three_d_array
    :type std_msgs-msg:Float32MultiArray
    :initform (cl:make-instance 'std_msgs-msg:Float32MultiArray)))
)

(cl:defclass twodto3d-response (<twodto3d-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <twodto3d-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'twodto3d-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name twodto3d-srv:<twodto3d-response> is deprecated: use twodto3d-srv:twodto3d-response instead.")))

(cl:ensure-generic-function 'three_d_array-val :lambda-list '(m))
(cl:defmethod three_d_array-val ((m <twodto3d-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader twodto3d-srv:three_d_array-val is deprecated.  Use twodto3d-srv:three_d_array instead.")
  (three_d_array m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <twodto3d-response>) ostream)
  "Serializes a message object of type '<twodto3d-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'three_d_array) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <twodto3d-response>) istream)
  "Deserializes a message object of type '<twodto3d-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'three_d_array) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<twodto3d-response>)))
  "Returns string type for a service object of type '<twodto3d-response>"
  "twodto3d/twodto3dResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'twodto3d-response)))
  "Returns string type for a service object of type 'twodto3d-response"
  "twodto3d/twodto3dResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<twodto3d-response>)))
  "Returns md5sum for a message object of type '<twodto3d-response>"
  "0a72e6459b11515d7f19e6e41260f1a9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'twodto3d-response)))
  "Returns md5sum for a message object of type 'twodto3d-response"
  "0a72e6459b11515d7f19e6e41260f1a9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<twodto3d-response>)))
  "Returns full string definition for message of type '<twodto3d-response>"
  (cl:format cl:nil "std_msgs/Float32MultiArray three_d_array~%~%~%================================================================================~%MSG: std_msgs/Float32MultiArray~%# Please look at the MultiArrayLayout message definition for~%# documentation on all multiarrays.~%~%MultiArrayLayout  layout        # specification of data layout~%float32[]         data          # array of data~%~%~%================================================================================~%MSG: std_msgs/MultiArrayLayout~%# The multiarray declares a generic multi-dimensional array of a~%# particular data type.  Dimensions are ordered from outer most~%# to inner most.~%~%MultiArrayDimension[] dim # Array of dimension properties~%uint32 data_offset        # padding elements at front of data~%~%# Accessors should ALWAYS be written in terms of dimension stride~%# and specified outer-most dimension first.~%# ~%# multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]~%#~%# A standard, 3-channel 640x480 image with interleaved color channels~%# would be specified as:~%#~%# dim[0].label  = \"height\"~%# dim[0].size   = 480~%# dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)~%# dim[1].label  = \"width\"~%# dim[1].size   = 640~%# dim[1].stride = 3*640 = 1920~%# dim[2].label  = \"channel\"~%# dim[2].size   = 3~%# dim[2].stride = 3~%#~%# multiarray(i,j,k) refers to the ith row, jth column, and kth channel.~%~%================================================================================~%MSG: std_msgs/MultiArrayDimension~%string label   # label of given dimension~%uint32 size    # size of given dimension (in type units)~%uint32 stride  # stride of given dimension~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'twodto3d-response)))
  "Returns full string definition for message of type 'twodto3d-response"
  (cl:format cl:nil "std_msgs/Float32MultiArray three_d_array~%~%~%================================================================================~%MSG: std_msgs/Float32MultiArray~%# Please look at the MultiArrayLayout message definition for~%# documentation on all multiarrays.~%~%MultiArrayLayout  layout        # specification of data layout~%float32[]         data          # array of data~%~%~%================================================================================~%MSG: std_msgs/MultiArrayLayout~%# The multiarray declares a generic multi-dimensional array of a~%# particular data type.  Dimensions are ordered from outer most~%# to inner most.~%~%MultiArrayDimension[] dim # Array of dimension properties~%uint32 data_offset        # padding elements at front of data~%~%# Accessors should ALWAYS be written in terms of dimension stride~%# and specified outer-most dimension first.~%# ~%# multiarray(i,j,k) = data[data_offset + dim_stride[1]*i + dim_stride[2]*j + k]~%#~%# A standard, 3-channel 640x480 image with interleaved color channels~%# would be specified as:~%#~%# dim[0].label  = \"height\"~%# dim[0].size   = 480~%# dim[0].stride = 3*640*480 = 921600  (note dim[0] stride is just size of image)~%# dim[1].label  = \"width\"~%# dim[1].size   = 640~%# dim[1].stride = 3*640 = 1920~%# dim[2].label  = \"channel\"~%# dim[2].size   = 3~%# dim[2].stride = 3~%#~%# multiarray(i,j,k) refers to the ith row, jth column, and kth channel.~%~%================================================================================~%MSG: std_msgs/MultiArrayDimension~%string label   # label of given dimension~%uint32 size    # size of given dimension (in type units)~%uint32 stride  # stride of given dimension~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <twodto3d-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'three_d_array))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <twodto3d-response>))
  "Converts a ROS message object to a list"
  (cl:list 'twodto3d-response
    (cl:cons ':three_d_array (three_d_array msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'twodto3d)))
  'twodto3d-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'twodto3d)))
  'twodto3d-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'twodto3d)))
  "Returns string type for a service object of type '<twodto3d>"
  "twodto3d/twodto3d")