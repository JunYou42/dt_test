// Auto-generated. Do not edit!

// (in-package dt_test_pkg.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------


//-----------------------------------------------------------

class ControlEvalRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.current_pose = null;
      this.target_pose = null;
      this.limit_time = null;
    }
    else {
      if (initObj.hasOwnProperty('current_pose')) {
        this.current_pose = initObj.current_pose
      }
      else {
        this.current_pose = new geometry_msgs.msg.Pose();
      }
      if (initObj.hasOwnProperty('target_pose')) {
        this.target_pose = initObj.target_pose
      }
      else {
        this.target_pose = new geometry_msgs.msg.Pose();
      }
      if (initObj.hasOwnProperty('limit_time')) {
        this.limit_time = initObj.limit_time
      }
      else {
        this.limit_time = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ControlEvalRequest
    // Serialize message field [current_pose]
    bufferOffset = geometry_msgs.msg.Pose.serialize(obj.current_pose, buffer, bufferOffset);
    // Serialize message field [target_pose]
    bufferOffset = geometry_msgs.msg.Pose.serialize(obj.target_pose, buffer, bufferOffset);
    // Serialize message field [limit_time]
    bufferOffset = _serializer.float64(obj.limit_time, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ControlEvalRequest
    let len;
    let data = new ControlEvalRequest(null);
    // Deserialize message field [current_pose]
    data.current_pose = geometry_msgs.msg.Pose.deserialize(buffer, bufferOffset);
    // Deserialize message field [target_pose]
    data.target_pose = geometry_msgs.msg.Pose.deserialize(buffer, bufferOffset);
    // Deserialize message field [limit_time]
    data.limit_time = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 120;
  }

  static datatype() {
    // Returns string type for a service object
    return 'dt_test_pkg/ControlEvalRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '87b808674d4dafd860439bc0a555cd53';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    #CREATE request parameters
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ControlEvalRequest(null);
    if (msg.current_pose !== undefined) {
      resolved.current_pose = geometry_msgs.msg.Pose.Resolve(msg.current_pose)
    }
    else {
      resolved.current_pose = new geometry_msgs.msg.Pose()
    }

    if (msg.target_pose !== undefined) {
      resolved.target_pose = geometry_msgs.msg.Pose.Resolve(msg.target_pose)
    }
    else {
      resolved.target_pose = new geometry_msgs.msg.Pose()
    }

    if (msg.limit_time !== undefined) {
      resolved.limit_time = msg.limit_time;
    }
    else {
      resolved.limit_time = 0.0
    }

    return resolved;
    }
};

class ControlEvalResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.control_ok = null;
    }
    else {
      if (initObj.hasOwnProperty('control_ok')) {
        this.control_ok = initObj.control_ok
      }
      else {
        this.control_ok = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ControlEvalResponse
    // Serialize message field [control_ok]
    bufferOffset = _serializer.bool(obj.control_ok, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ControlEvalResponse
    let len;
    let data = new ControlEvalResponse(null);
    // Deserialize message field [control_ok]
    data.control_ok = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'dt_test_pkg/ControlEvalResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '6f3e17e0aaa02da7d620767756fd89dc';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    #CREATE response parameters
    
    bool control_ok
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ControlEvalResponse(null);
    if (msg.control_ok !== undefined) {
      resolved.control_ok = msg.control_ok;
    }
    else {
      resolved.control_ok = false
    }

    return resolved;
    }
};

module.exports = {
  Request: ControlEvalRequest,
  Response: ControlEvalResponse,
  md5sum() { return '958048232c806861307e0b0592b4443c'; },
  datatype() { return 'dt_test_pkg/ControlEval'; }
};
