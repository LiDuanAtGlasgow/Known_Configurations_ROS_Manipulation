// Auto-generated. Do not edit!

// (in-package calibration_glasgow.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class HandEyeCalibrationRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.doIt = null;
    }
    else {
      if (initObj.hasOwnProperty('doIt')) {
        this.doIt = initObj.doIt
      }
      else {
        this.doIt = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type HandEyeCalibrationRequest
    // Serialize message field [doIt]
    bufferOffset = _serializer.bool(obj.doIt, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type HandEyeCalibrationRequest
    let len;
    let data = new HandEyeCalibrationRequest(null);
    // Deserialize message field [doIt]
    data.doIt = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'calibration_glasgow/HandEyeCalibrationRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3e7f2a3e38a161dfeb4d7798675f26e6';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool doIt
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new HandEyeCalibrationRequest(null);
    if (msg.doIt !== undefined) {
      resolved.doIt = msg.doIt;
    }
    else {
      resolved.doIt = false
    }

    return resolved;
    }
};

class HandEyeCalibrationResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.status_message = null;
      this.success = null;
    }
    else {
      if (initObj.hasOwnProperty('status_message')) {
        this.status_message = initObj.status_message
      }
      else {
        this.status_message = '';
      }
      if (initObj.hasOwnProperty('success')) {
        this.success = initObj.success
      }
      else {
        this.success = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type HandEyeCalibrationResponse
    // Serialize message field [status_message]
    bufferOffset = _serializer.string(obj.status_message, buffer, bufferOffset);
    // Serialize message field [success]
    bufferOffset = _serializer.int16(obj.success, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type HandEyeCalibrationResponse
    let len;
    let data = new HandEyeCalibrationResponse(null);
    // Deserialize message field [status_message]
    data.status_message = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [success]
    data.success = _deserializer.int16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.status_message.length;
    return length + 6;
  }

  static datatype() {
    // Returns string type for a service object
    return 'calibration_glasgow/HandEyeCalibrationResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c961c1082af2d3fbf511483988d033c3';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string status_message
    int16 success
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new HandEyeCalibrationResponse(null);
    if (msg.status_message !== undefined) {
      resolved.status_message = msg.status_message;
    }
    else {
      resolved.status_message = ''
    }

    if (msg.success !== undefined) {
      resolved.success = msg.success;
    }
    else {
      resolved.success = 0
    }

    return resolved;
    }
};

module.exports = {
  Request: HandEyeCalibrationRequest,
  Response: HandEyeCalibrationResponse,
  md5sum() { return '797b3801ffc970cbdf739724228d484b'; },
  datatype() { return 'calibration_glasgow/HandEyeCalibration'; }
};
