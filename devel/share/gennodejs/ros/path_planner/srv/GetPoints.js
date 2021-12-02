// Auto-generated. Do not edit!

// (in-package path_planner.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class GetPointsRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetPointsRequest
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetPointsRequest
    let len;
    let data = new GetPointsRequest(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'path_planner/GetPointsRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd41d8cd98f00b204e9800998ecf8427e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GetPointsRequest(null);
    return resolved;
    }
};

class GetPointsResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.points_array = null;
    }
    else {
      if (initObj.hasOwnProperty('points_array')) {
        this.points_array = initObj.points_array
      }
      else {
        this.points_array = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetPointsResponse
    // Serialize message field [points_array]
    bufferOffset = _arraySerializer.float32(obj.points_array, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetPointsResponse
    let len;
    let data = new GetPointsResponse(null);
    // Deserialize message field [points_array]
    data.points_array = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.points_array.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'path_planner/GetPointsResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '726e62144bd80158a62de6337dc76b64';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32[] points_array
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GetPointsResponse(null);
    if (msg.points_array !== undefined) {
      resolved.points_array = msg.points_array;
    }
    else {
      resolved.points_array = []
    }

    return resolved;
    }
};

module.exports = {
  Request: GetPointsRequest,
  Response: GetPointsResponse,
  md5sum() { return '726e62144bd80158a62de6337dc76b64'; },
  datatype() { return 'path_planner/GetPoints'; }
};
