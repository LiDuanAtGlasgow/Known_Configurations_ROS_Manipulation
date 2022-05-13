
(cl:in-package :asdf)

(defsystem "twodto3d-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "twodto3d" :depends-on ("_package_twodto3d"))
    (:file "_package_twodto3d" :depends-on ("_package"))
  ))