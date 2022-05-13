
(cl:in-package :asdf)

(defsystem "calibration_glasgow-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "HandEyeCalibration" :depends-on ("_package_HandEyeCalibration"))
    (:file "_package_HandEyeCalibration" :depends-on ("_package"))
  ))