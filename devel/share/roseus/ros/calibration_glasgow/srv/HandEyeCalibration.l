;; Auto-generated. Do not edit!


(when (boundp 'calibration_glasgow::HandEyeCalibration)
  (if (not (find-package "CALIBRATION_GLASGOW"))
    (make-package "CALIBRATION_GLASGOW"))
  (shadow 'HandEyeCalibration (find-package "CALIBRATION_GLASGOW")))
(unless (find-package "CALIBRATION_GLASGOW::HANDEYECALIBRATION")
  (make-package "CALIBRATION_GLASGOW::HANDEYECALIBRATION"))
(unless (find-package "CALIBRATION_GLASGOW::HANDEYECALIBRATIONREQUEST")
  (make-package "CALIBRATION_GLASGOW::HANDEYECALIBRATIONREQUEST"))
(unless (find-package "CALIBRATION_GLASGOW::HANDEYECALIBRATIONRESPONSE")
  (make-package "CALIBRATION_GLASGOW::HANDEYECALIBRATIONRESPONSE"))

(in-package "ROS")





(defclass calibration_glasgow::HandEyeCalibrationRequest
  :super ros::object
  :slots (_doIt ))

(defmethod calibration_glasgow::HandEyeCalibrationRequest
  (:init
   (&key
    ((:doIt __doIt) nil)
    )
   (send-super :init)
   (setq _doIt __doIt)
   self)
  (:doIt
   (&optional __doIt)
   (if __doIt (setq _doIt __doIt)) _doIt)
  (:serialization-length
   ()
   (+
    ;; bool _doIt
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _doIt
       (if _doIt (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _doIt
     (setq _doIt (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass calibration_glasgow::HandEyeCalibrationResponse
  :super ros::object
  :slots (_status_message _success ))

(defmethod calibration_glasgow::HandEyeCalibrationResponse
  (:init
   (&key
    ((:status_message __status_message) "")
    ((:success __success) 0)
    )
   (send-super :init)
   (setq _status_message (string __status_message))
   (setq _success (round __success))
   self)
  (:status_message
   (&optional __status_message)
   (if __status_message (setq _status_message __status_message)) _status_message)
  (:success
   (&optional __success)
   (if __success (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; string _status_message
    4 (length _status_message)
    ;; int16 _success
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _status_message
       (write-long (length _status_message) s) (princ _status_message s)
     ;; int16 _success
       (write-word _success s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _status_message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _status_message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int16 _success
     (setq _success (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(defclass calibration_glasgow::HandEyeCalibration
  :super ros::object
  :slots ())

(setf (get calibration_glasgow::HandEyeCalibration :md5sum-) "797b3801ffc970cbdf739724228d484b")
(setf (get calibration_glasgow::HandEyeCalibration :datatype-) "calibration_glasgow/HandEyeCalibration")
(setf (get calibration_glasgow::HandEyeCalibration :request) calibration_glasgow::HandEyeCalibrationRequest)
(setf (get calibration_glasgow::HandEyeCalibration :response) calibration_glasgow::HandEyeCalibrationResponse)

(defmethod calibration_glasgow::HandEyeCalibrationRequest
  (:response () (instance calibration_glasgow::HandEyeCalibrationResponse :init)))

(setf (get calibration_glasgow::HandEyeCalibrationRequest :md5sum-) "797b3801ffc970cbdf739724228d484b")
(setf (get calibration_glasgow::HandEyeCalibrationRequest :datatype-) "calibration_glasgow/HandEyeCalibrationRequest")
(setf (get calibration_glasgow::HandEyeCalibrationRequest :definition-)
      "bool doIt
---
string status_message
int16 success

")

(setf (get calibration_glasgow::HandEyeCalibrationResponse :md5sum-) "797b3801ffc970cbdf739724228d484b")
(setf (get calibration_glasgow::HandEyeCalibrationResponse :datatype-) "calibration_glasgow/HandEyeCalibrationResponse")
(setf (get calibration_glasgow::HandEyeCalibrationResponse :definition-)
      "bool doIt
---
string status_message
int16 success

")



(provide :calibration_glasgow/HandEyeCalibration "797b3801ffc970cbdf739724228d484b")


