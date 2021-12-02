// Auto-generated. Do not edit!

// (in-package robot_commander.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class GetCoordsRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.top_left = null;
      this.bottom_right = null;
    }
    else {
      if (initObj.hasOwnProperty('top_left')) {
        this.top_left = initObj.top_left
      }
      else {
        this.top_left = [];
      }
      if (initObj.hasOwnProperty('bottom_right')) {
        this.bottom_right = initObj.bottom_right
      }
      else {
        this.bottom_right = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetCoordsRequest
    // Serialize message field [top_left]
    bufferOffset = _arraySerializer.float32(obj.top_left, buffer, bufferOffset, null);
    // Serialize message field [bottom_right]
    bufferOffset = _arraySerializer.float32(obj.bottom_right, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetCoordsRequest
    let len;
    let data = new GetCoordsRequest(null);
    // Deserialize message field [top_left]
    data.top_left = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [bottom_right]
    data.bottom_right = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.top_left.length;
    length += 4 * object.bottom_right.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'robot_commander/GetCoordsRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '2b9f4e3329747e348a5ae40cdd0c24ee';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32[] top_left
    float32[] bottom_right
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GetCoordsRequest(null);
    if (msg.top_left !== undefined) {
      resolved.top_left = msg.top_left;
    }
    else {
      resolved.top_left = []
    }

    if (msg.bottom_right !== undefined) {
      resolved.bottom_right = msg.bottom_right;
    }
    else {
      resolved.bottom_right = []
    }

    return resolved;
    }
};

class GetCoordsResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.coords_array = null;
    }
    else {
      if (initObj.hasOwnProperty('coords_array')) {
        this.coords_array = initObj.coords_array
      }
      else {
        this.coords_array = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetCoordsResponse
    // Serialize message field [coords_array]
    bufferOffset = _arraySerializer.float32(obj.coords_array, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetCoordsResponse
    let len;
    let data = new GetCoordsResponse(null);
    // Deserialize message field [coords_array]
    data.coords_array = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.coords_array.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'robot_commander/GetCoordsResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '23977c619124dc561fdfab0c5e59985a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32[] coords_array
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GetCoordsResponse(null);
    if (msg.coords_array !== undefined) {
      resolved.coords_array = msg.coords_array;
    }
    else {
      resolved.coords_array = []
    }

    return resolved;
    }
};

module.exports = {
  Request: GetCoordsRequest,
  Response: GetCoordsResponse,
  md5sum() { return '5fda44d5b45a78ce5dc124b63492459c'; },
  datatype() { return 'robot_commander/GetCoords'; }
};
