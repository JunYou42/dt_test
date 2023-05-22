;; Auto-generated. Do not edit!


(when (boundp 'dt_test_pkg::ControlEval)
  (if (not (find-package "DT_TEST_PKG"))
    (make-package "DT_TEST_PKG"))
  (shadow 'ControlEval (find-package "DT_TEST_PKG")))
(unless (find-package "DT_TEST_PKG::CONTROLEVAL")
  (make-package "DT_TEST_PKG::CONTROLEVAL"))
(unless (find-package "DT_TEST_PKG::CONTROLEVALREQUEST")
  (make-package "DT_TEST_PKG::CONTROLEVALREQUEST"))
(unless (find-package "DT_TEST_PKG::CONTROLEVALRESPONSE")
  (make-package "DT_TEST_PKG::CONTROLEVALRESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))




(defclass dt_test_pkg::ControlEvalRequest
  :super ros::object
  :slots (_current_pose _target_pose _limit_time ))

(defmethod dt_test_pkg::ControlEvalRequest
  (:init
   (&key
    ((:current_pose __current_pose) (instance geometry_msgs::Pose :init))
    ((:target_pose __target_pose) (instance geometry_msgs::Pose :init))
    ((:limit_time __limit_time) 0.0)
    )
   (send-super :init)
   (setq _current_pose __current_pose)
   (setq _target_pose __target_pose)
   (setq _limit_time (float __limit_time))
   self)
  (:current_pose
   (&rest __current_pose)
   (if (keywordp (car __current_pose))
       (send* _current_pose __current_pose)
     (progn
       (if __current_pose (setq _current_pose (car __current_pose)))
       _current_pose)))
  (:target_pose
   (&rest __target_pose)
   (if (keywordp (car __target_pose))
       (send* _target_pose __target_pose)
     (progn
       (if __target_pose (setq _target_pose (car __target_pose)))
       _target_pose)))
  (:limit_time
   (&optional __limit_time)
   (if __limit_time (setq _limit_time __limit_time)) _limit_time)
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Pose _current_pose
    (send _current_pose :serialization-length)
    ;; geometry_msgs/Pose _target_pose
    (send _target_pose :serialization-length)
    ;; float64 _limit_time
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Pose _current_pose
       (send _current_pose :serialize s)
     ;; geometry_msgs/Pose _target_pose
       (send _target_pose :serialize s)
     ;; float64 _limit_time
       (sys::poke _limit_time (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Pose _current_pose
     (send _current_pose :deserialize buf ptr-) (incf ptr- (send _current_pose :serialization-length))
   ;; geometry_msgs/Pose _target_pose
     (send _target_pose :deserialize buf ptr-) (incf ptr- (send _target_pose :serialization-length))
   ;; float64 _limit_time
     (setq _limit_time (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass dt_test_pkg::ControlEvalResponse
  :super ros::object
  :slots (_control_ok ))

(defmethod dt_test_pkg::ControlEvalResponse
  (:init
   (&key
    ((:control_ok __control_ok) nil)
    )
   (send-super :init)
   (setq _control_ok __control_ok)
   self)
  (:control_ok
   (&optional (__control_ok :null))
   (if (not (eq __control_ok :null)) (setq _control_ok __control_ok)) _control_ok)
  (:serialization-length
   ()
   (+
    ;; bool _control_ok
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _control_ok
       (if _control_ok (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _control_ok
     (setq _control_ok (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass dt_test_pkg::ControlEval
  :super ros::object
  :slots ())

(setf (get dt_test_pkg::ControlEval :md5sum-) "958048232c806861307e0b0592b4443c")
(setf (get dt_test_pkg::ControlEval :datatype-) "dt_test_pkg/ControlEval")
(setf (get dt_test_pkg::ControlEval :request) dt_test_pkg::ControlEvalRequest)
(setf (get dt_test_pkg::ControlEval :response) dt_test_pkg::ControlEvalResponse)

(defmethod dt_test_pkg::ControlEvalRequest
  (:response () (instance dt_test_pkg::ControlEvalResponse :init)))

(setf (get dt_test_pkg::ControlEvalRequest :md5sum-) "958048232c806861307e0b0592b4443c")
(setf (get dt_test_pkg::ControlEvalRequest :datatype-) "dt_test_pkg/ControlEvalRequest")
(setf (get dt_test_pkg::ControlEvalRequest :definition-)
      "#CREATE request parameters
geometry_msgs/Pose current_pose
geometry_msgs/Pose  target_pose
float64 limit_time


================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
---
#CREATE response parameters

bool control_ok
")

(setf (get dt_test_pkg::ControlEvalResponse :md5sum-) "958048232c806861307e0b0592b4443c")
(setf (get dt_test_pkg::ControlEvalResponse :datatype-) "dt_test_pkg/ControlEvalResponse")
(setf (get dt_test_pkg::ControlEvalResponse :definition-)
      "#CREATE request parameters
geometry_msgs/Pose current_pose
geometry_msgs/Pose  target_pose
float64 limit_time


================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
---
#CREATE response parameters

bool control_ok
")



(provide :dt_test_pkg/ControlEval "958048232c806861307e0b0592b4443c")


