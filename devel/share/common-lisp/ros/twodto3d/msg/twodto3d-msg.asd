
(cl:in-package :asdf)

(defsystem "twodto3d-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "mymessage" :depends-on ("_package_mymessage"))
    (:file "_package_mymessage" :depends-on ("_package"))
  ))