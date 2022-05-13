; Auto-generated. Do not edit!


(cl:in-package twodto3d-msg)


;//! \htmlinclude mymessage.msg.html

(cl:defclass <mymessage> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (data
    :reader data
    :initarg :data
    :type cl:float
    :initform 0.0))
)

(cl:defclass mymessage (<mymessage>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <mymessage>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'mymessage)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name twodto3d-msg:<mymessage> is deprecated: use twodto3d-msg:mymessage instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <mymessage>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader twodto3d-msg:header-val is deprecated.  Use twodto3d-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <mymessage>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader twodto3d-msg:data-val is deprecated.  Use twodto3d-msg:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <mymessage>) ostream)
  "Serializes a message object of type '<mymessage>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'data))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <mymessage>) istream)
  "Deserializes a message object of type '<mymessage>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'data) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<mymessage>)))
  "Returns string type for a message object of type '<mymessage>"
  "twodto3d/mymessage")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'mymessage)))
  "Returns string type for a message object of type 'mymessage"
  "twodto3d/mymessage")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<mymessage>)))
  "Returns md5sum for a message object of type '<mymessage>"
  "e6c99c37e6f9fe98e071d524cc164e65")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'mymessage)))
  "Returns md5sum for a message object of type 'mymessage"
  "e6c99c37e6f9fe98e071d524cc164e65")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<mymessage>)))
  "Returns full string definition for message of type '<mymessage>"
  (cl:format cl:nil "Header header~%float64 data~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'mymessage)))
  "Returns full string definition for message of type 'mymessage"
  (cl:format cl:nil "Header header~%float64 data~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <mymessage>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <mymessage>))
  "Converts a ROS message object to a list"
  (cl:list 'mymessage
    (cl:cons ':header (header msg))
    (cl:cons ':data (data msg))
))
