; Auto-generated. Do not edit!


(cl:in-package dt_test_pkg-msg)


;//! \htmlinclude Wind.msg.html

(cl:defclass <Wind> (roslisp-msg-protocol:ros-message)
  ((wind_x
    :reader wind_x
    :initarg :wind_x
    :type cl:float
    :initform 0.0)
   (wind_y
    :reader wind_y
    :initarg :wind_y
    :type cl:float
    :initform 0.0)
   (wind_z
    :reader wind_z
    :initarg :wind_z
    :type cl:float
    :initform 0.0))
)

(cl:defclass Wind (<Wind>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Wind>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Wind)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name dt_test_pkg-msg:<Wind> is deprecated: use dt_test_pkg-msg:Wind instead.")))

(cl:ensure-generic-function 'wind_x-val :lambda-list '(m))
(cl:defmethod wind_x-val ((m <Wind>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dt_test_pkg-msg:wind_x-val is deprecated.  Use dt_test_pkg-msg:wind_x instead.")
  (wind_x m))

(cl:ensure-generic-function 'wind_y-val :lambda-list '(m))
(cl:defmethod wind_y-val ((m <Wind>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dt_test_pkg-msg:wind_y-val is deprecated.  Use dt_test_pkg-msg:wind_y instead.")
  (wind_y m))

(cl:ensure-generic-function 'wind_z-val :lambda-list '(m))
(cl:defmethod wind_z-val ((m <Wind>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader dt_test_pkg-msg:wind_z-val is deprecated.  Use dt_test_pkg-msg:wind_z instead.")
  (wind_z m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Wind>) ostream)
  "Serializes a message object of type '<Wind>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'wind_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'wind_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'wind_z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Wind>) istream)
  "Deserializes a message object of type '<Wind>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'wind_x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'wind_y) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'wind_z) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Wind>)))
  "Returns string type for a message object of type '<Wind>"
  "dt_test_pkg/Wind")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Wind)))
  "Returns string type for a message object of type 'Wind"
  "dt_test_pkg/Wind")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Wind>)))
  "Returns md5sum for a message object of type '<Wind>"
  "8f26644c548e30cf22288c73078d1351")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Wind)))
  "Returns md5sum for a message object of type 'Wind"
  "8f26644c548e30cf22288c73078d1351")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Wind>)))
  "Returns full string definition for message of type '<Wind>"
  (cl:format cl:nil "float64 wind_x~%float64 wind_y~%float64 wind_z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Wind)))
  "Returns full string definition for message of type 'Wind"
  (cl:format cl:nil "float64 wind_x~%float64 wind_y~%float64 wind_z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Wind>))
  (cl:+ 0
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Wind>))
  "Converts a ROS message object to a list"
  (cl:list 'Wind
    (cl:cons ':wind_x (wind_x msg))
    (cl:cons ':wind_y (wind_y msg))
    (cl:cons ':wind_z (wind_z msg))
))
