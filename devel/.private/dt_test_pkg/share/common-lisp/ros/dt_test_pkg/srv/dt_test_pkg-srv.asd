
(cl:in-package :asdf)

(defsystem "dt_test_pkg-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "ControlEval" :depends-on ("_package_ControlEval"))
    (:file "_package_ControlEval" :depends-on ("_package"))
  ))