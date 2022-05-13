; Auto-generated. Do not edit!


(cl:in-package calibration_glasgow-srv)


;//! \htmlinclude HandEyeCalibration-request.msg.html

(cl:defclass <HandEyeCalibration-request> (roslisp-msg-protocol:ros-message)
  ((doIt
    :reader doIt
    :initarg :doIt
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass HandEyeCalibration-request (<HandEyeCalibration-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <HandEyeCalibration-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'HandEyeCalibration-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name calibration_glasgow-srv:<HandEyeCalibration-request> is deprecated: use calibration_glasgow-srv:HandEyeCalibration-request instead.")))

(cl:ensure-generic-function 'doIt-val :lambda-list '(m))
(cl:defmethod doIt-val ((m <HandEyeCalibration-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader calibration_glasgow-srv:doIt-val is deprecated.  Use calibration_glasgow-srv:doIt instead.")
  (doIt m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <HandEyeCalibration-request>) ostream)
  "Serializes a message object of type '<HandEyeCalibration-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'doIt) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <HandEyeCalibration-request>) istream)
  "Deserializes a message object of type '<HandEyeCalibration-request>"
    (cl:setf (cl:slot-value msg 'doIt) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<HandEyeCalibration-request>)))
  "Returns string type for a service object of type '<HandEyeCalibration-request>"
  "calibration_glasgow/HandEyeCalibrationRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'HandEyeCalibration-request)))
  "Returns string type for a service object of type 'HandEyeCalibration-request"
  "calibration_glasgow/HandEyeCalibrationRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<HandEyeCalibration-request>)))
  "Returns md5sum for a message object of type '<HandEyeCalibration-request>"
  "797b3801ffc970cbdf739724228d484b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'HandEyeCalibration-request)))
  "Returns md5sum for a message object of type 'HandEyeCalibration-request"
  "797b3801ffc970cbdf739724228d484b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<HandEyeCalibration-request>)))
  "Returns full string definition for message of type '<HandEyeCalibration-request>"
  (cl:format cl:nil "bool doIt~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'HandEyeCalibration-request)))
  "Returns full string definition for message of type 'HandEyeCalibration-request"
  (cl:format cl:nil "bool doIt~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <HandEyeCalibration-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <HandEyeCalibration-request>))
  "Converts a ROS message object to a list"
  (cl:list 'HandEyeCalibration-request
    (cl:cons ':doIt (doIt msg))
))
;//! \htmlinclude HandEyeCalibration-response.msg.html

(cl:defclass <HandEyeCalibration-response> (roslisp-msg-protocol:ros-message)
  ((status_message
    :reader status_message
    :initarg :status_message
    :type cl:string
    :initform "")
   (success
    :reader success
    :initarg :success
    :type cl:fixnum
    :initform 0))
)

(cl:defclass HandEyeCalibration-response (<HandEyeCalibration-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <HandEyeCalibration-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'HandEyeCalibration-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name calibration_glasgow-srv:<HandEyeCalibration-response> is deprecated: use calibration_glasgow-srv:HandEyeCalibration-response instead.")))

(cl:ensure-generic-function 'status_message-val :lambda-list '(m))
(cl:defmethod status_message-val ((m <HandEyeCalibration-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader calibration_glasgow-srv:status_message-val is deprecated.  Use calibration_glasgow-srv:status_message instead.")
  (status_message m))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <HandEyeCalibration-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader calibration_glasgow-srv:success-val is deprecated.  Use calibration_glasgow-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <HandEyeCalibration-response>) ostream)
  "Serializes a message object of type '<HandEyeCalibration-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'status_message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'status_message))
  (cl:let* ((signed (cl:slot-value msg 'success)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <HandEyeCalibration-response>) istream)
  "Deserializes a message object of type '<HandEyeCalibration-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'status_message) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'status_message) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'success) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<HandEyeCalibration-response>)))
  "Returns string type for a service object of type '<HandEyeCalibration-response>"
  "calibration_glasgow/HandEyeCalibrationResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'HandEyeCalibration-response)))
  "Returns string type for a service object of type 'HandEyeCalibration-response"
  "calibration_glasgow/HandEyeCalibrationResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<HandEyeCalibration-response>)))
  "Returns md5sum for a message object of type '<HandEyeCalibration-response>"
  "797b3801ffc970cbdf739724228d484b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'HandEyeCalibration-response)))
  "Returns md5sum for a message object of type 'HandEyeCalibration-response"
  "797b3801ffc970cbdf739724228d484b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<HandEyeCalibration-response>)))
  "Returns full string definition for message of type '<HandEyeCalibration-response>"
  (cl:format cl:nil "string status_message~%int16 success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'HandEyeCalibration-response)))
  "Returns full string definition for message of type 'HandEyeCalibration-response"
  (cl:format cl:nil "string status_message~%int16 success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <HandEyeCalibration-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'status_message))
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <HandEyeCalibration-response>))
  "Converts a ROS message object to a list"
  (cl:list 'HandEyeCalibration-response
    (cl:cons ':status_message (status_message msg))
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'HandEyeCalibration)))
  'HandEyeCalibration-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'HandEyeCalibration)))
  'HandEyeCalibration-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'HandEyeCalibration)))
  "Returns string type for a service object of type '<HandEyeCalibration>"
  "calibration_glasgow/HandEyeCalibration")