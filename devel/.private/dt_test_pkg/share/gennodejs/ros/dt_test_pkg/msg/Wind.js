// Auto-generated. Do not edit!

// (in-package dt_test_pkg.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Wind {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.wind_x = null;
      this.wind_y = null;
      this.wind_z = null;
    }
    else {
      if (initObj.hasOwnProperty('wind_x')) {
        this.wind_x = initObj.wind_x
      }
      else {
        this.wind_x = 0.0;
      }
      if (initObj.hasOwnProperty('wind_y')) {
        this.wind_y = initObj.wind_y
      }
      else {
        this.wind_y = 0.0;
      }
      if (initObj.hasOwnProperty('wind_z')) {
        this.wind_z = initObj.wind_z
      }
      else {
        this.wind_z = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Wind
    // Serialize message field [wind_x]
    bufferOffset = _serializer.float64(obj.wind_x, buffer, bufferOffset);
    // Serialize message field [wind_y]
    bufferOffset = _serializer.float64(obj.wind_y, buffer, bufferOffset);
    // Serialize message field [wind_z]
    bufferOffset = _serializer.float64(obj.wind_z, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Wind
    let len;
    let data = new Wind(null);
    // Deserialize message field [wind_x]
    data.wind_x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [wind_y]
    data.wind_y = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [wind_z]
    data.wind_z = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 24;
  }

  static datatype() {
    // Returns string type for a message object
    return 'dt_test_pkg/Wind';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8f26644c548e30cf22288c73078d1351';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 wind_x
    float64 wind_y
    float64 wind_z
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Wind(null);
    if (msg.wind_x !== undefined) {
      resolved.wind_x = msg.wind_x;
    }
    else {
      resolved.wind_x = 0.0
    }

    if (msg.wind_y !== undefined) {
      resolved.wind_y = msg.wind_y;
    }
    else {
      resolved.wind_y = 0.0
    }

    if (msg.wind_z !== undefined) {
      resolved.wind_z = msg.wind_z;
    }
    else {
      resolved.wind_z = 0.0
    }

    return resolved;
    }
};

module.exports = Wind;
