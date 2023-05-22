; Auto-generated. Do not edit!


(cl:in-package dt_test_pkg-srv)


;//! \htmlinclude ControlEval-request.msg.html

(cl:defclass <ControlEval-request> (roslisp-msg-protocol:ros-message)
  ((current_pose
    :reader current_pose
    :initarg :current_pose
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose))
   (target_pose
    :reader target_pose
    :initarg :target_pose
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose))
   (limit_time
    :reader limit_time
    :initarg :limit_time
    :type cl:float
    :initform 0.0))
)

(cl:defclass ControlEval-request (<ControlEval-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ControlEval-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ControlEval-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name dt_test_pkg-srv:<ControlEval-request> is deprecated: use dt_test_pkg-srv:ControlEval-request instead.")))

(cl:ensure-generic-function 'current_pose-val :lambda-list '(m))
(cl:defmethod current_pose-val ((m <ControlEval-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dt_test_pkg-srv:current_pose-val is deprecated.  Use dt_test_pkg-srv:current_pose instead.")
  (current_pose m))

(cl:ensure-generic-function 'target_pose-val :lambda-list '(m))
(cl:defmethod target_pose-val ((m <ControlEval-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dt_test_pkg-srv:target_pose-val is deprecated.  Use dt_test_pkg-srv:target_pose instead.")
  (target_pose m))

(cl:ensure-generic-function 'limit_time-val :lambda-list '(m))
(cl:defmethod limit_time-val ((m <ControlEval-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dt_test_pkg-srv:limit_time-val is deprecated.  Use dt_test_pkg-srv:limit_time instead.")
  (limit_time m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ControlEval-request>) ostream)
  "Serializes a message object of type '<ControlEval-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'current_pose) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'target_pose) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'limit_time))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ControlEval-request>) istream)
  "Deserializes a message object of type '<ControlEval-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'current_pose) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'target_pose) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'limit_time) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ControlEval-request>)))
  "Returns string type for a service object of type '<ControlEval-request>"
  "dt_test_pkg/ControlEvalRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ControlEval-request)))
  "Returns string type for a service object of type 'ControlEval-request"
  "dt_test_pkg/ControlEvalRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ControlEval-request>)))
  "Returns md5sum for a message object of type '<ControlEval-request>"
  "958048232c806861307e0b0592b4443c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ControlEval-request)))
  "Returns md5sum for a message object of type 'ControlEval-request"
  "958048232c806861307e0b0592b4443c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ControlEval-request>)))
  "Returns full string definition for message of type '<ControlEval-request>"
  (cl:format cl:nil "#CREATE request parameters~%geometry_msgs/Pose current_pose~%geometry_msgs/Pose  target_pose~%float64 limit_time~%~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ControlEval-request)))
  "Returns full string definition for message of type 'ControlEval-request"
  (cl:format cl:nil "#CREATE request parameters~%geometry_msgs/Pose current_pose~%geometry_msgs/Pose  target_pose~%float64 limit_time~%~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ControlEval-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'current_pose))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'target_pose))
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ControlEval-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ControlEval-request
    (cl:cons ':current_pose (current_pose msg))
    (cl:cons ':target_pose (target_pose msg))
    (cl:cons ':limit_time (limit_time msg))
))
;//! \htmlinclude ControlEval-response.msg.html

(cl:defclass <ControlEval-response> (roslisp-msg-protocol:ros-message)
  ((control_ok
    :reader control_ok
    :initarg :control_ok
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass ControlEval-response (<ControlEval-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ControlEval-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ControlEval-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name dt_test_pkg-srv:<ControlEval-response> is deprecated: use dt_test_pkg-srv:ControlEval-response instead.")))

(cl:ensure-generic-function 'control_ok-val :lambda-list '(m))
(cl:defmethod control_ok-val ((m <ControlEval-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dt_test_pkg-srv:control_ok-val is deprecated.  Use dt_test_pkg-srv:control_ok instead.")
  (control_ok m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ControlEval-response>) ostream)
  "Serializes a message object of type '<ControlEval-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'control_ok) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ControlEval-response>) istream)
  "Deserializes a message object of type '<ControlEval-response>"
    (cl:setf (cl:slot-value msg 'control_ok) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ControlEval-response>)))
  "Returns string type for a service object of type '<ControlEval-response>"
  "dt_test_pkg/ControlEvalResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ControlEval-response)))
  "Returns string type for a service object of type 'ControlEval-response"
  "dt_test_pkg/ControlEvalResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ControlEval-response>)))
  "Returns md5sum for a message object of type '<ControlEval-response>"
  "958048232c806861307e0b0592b4443c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ControlEval-response)))
  "Returns md5sum for a message object of type 'ControlEval-response"
  "958048232c806861307e0b0592b4443c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ControlEval-response>)))
  "Returns full string definition for message of type '<ControlEval-response>"
  (cl:format cl:nil "#CREATE response parameters~%~%bool control_ok~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ControlEval-response)))
  "Returns full string definition for message of type 'ControlEval-response"
  (cl:format cl:nil "#CREATE response parameters~%~%bool control_ok~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ControlEval-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ControlEval-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ControlEval-response
    (cl:cons ':control_ok (control_ok msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ControlEval)))
  'ControlEval-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ControlEval)))
  'ControlEval-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ControlEval)))
  "Returns string type for a service object of type '<ControlEval>"
  "dt_test_pkg/ControlEval")