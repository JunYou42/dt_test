
(cl:in-package :asdf)

(defsystem "dt_test_pkg-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Wind" :depends-on ("_package_Wind"))
    (:file "_package_Wind" :depends-on ("_package"))
  ))