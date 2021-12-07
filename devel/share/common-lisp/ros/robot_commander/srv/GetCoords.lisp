; Auto-generated. Do not edit!


(cl:in-package robot_commander-srv)


;//! \htmlinclude GetCoords-request.msg.html

(cl:defclass <GetCoords-request> (roslisp-msg-protocol:ros-message)
  ((top_left
    :reader top_left
    :initarg :top_left
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (bottom_right
    :reader bottom_right
    :initarg :bottom_right
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass GetCoords-request (<GetCoords-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetCoords-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetCoords-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_commander-srv:<GetCoords-request> is deprecated: use robot_commander-srv:GetCoords-request instead.")))

(cl:ensure-generic-function 'top_left-val :lambda-list '(m))
(cl:defmethod top_left-val ((m <GetCoords-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_commander-srv:top_left-val is deprecated.  Use robot_commander-srv:top_left instead.")
  (top_left m))

(cl:ensure-generic-function 'bottom_right-val :lambda-list '(m))
(cl:defmethod bottom_right-val ((m <GetCoords-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_commander-srv:bottom_right-val is deprecated.  Use robot_commander-srv:bottom_right instead.")
  (bottom_right m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetCoords-request>) ostream)
  "Serializes a message object of type '<GetCoords-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'top_left))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'top_left))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'bottom_right))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'bottom_right))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetCoords-request>) istream)
  "Deserializes a message object of type '<GetCoords-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'top_left) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'top_left)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'bottom_right) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'bottom_right)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetCoords-request>)))
  "Returns string type for a service object of type '<GetCoords-request>"
  "robot_commander/GetCoordsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetCoords-request)))
  "Returns string type for a service object of type 'GetCoords-request"
  "robot_commander/GetCoordsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetCoords-request>)))
  "Returns md5sum for a message object of type '<GetCoords-request>"
  "5fda44d5b45a78ce5dc124b63492459c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetCoords-request)))
  "Returns md5sum for a message object of type 'GetCoords-request"
  "5fda44d5b45a78ce5dc124b63492459c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetCoords-request>)))
  "Returns full string definition for message of type '<GetCoords-request>"
  (cl:format cl:nil "float32[] top_left~%float32[] bottom_right~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetCoords-request)))
  "Returns full string definition for message of type 'GetCoords-request"
  (cl:format cl:nil "float32[] top_left~%float32[] bottom_right~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetCoords-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'top_left) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'bottom_right) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetCoords-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetCoords-request
    (cl:cons ':top_left (top_left msg))
    (cl:cons ':bottom_right (bottom_right msg))
))
;//! \htmlinclude GetCoords-response.msg.html

(cl:defclass <GetCoords-response> (roslisp-msg-protocol:ros-message)
  ((coords_array
    :reader coords_array
    :initarg :coords_array
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass GetCoords-response (<GetCoords-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetCoords-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetCoords-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_commander-srv:<GetCoords-response> is deprecated: use robot_commander-srv:GetCoords-response instead.")))

(cl:ensure-generic-function 'coords_array-val :lambda-list '(m))
(cl:defmethod coords_array-val ((m <GetCoords-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_commander-srv:coords_array-val is deprecated.  Use robot_commander-srv:coords_array instead.")
  (coords_array m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetCoords-response>) ostream)
  "Serializes a message object of type '<GetCoords-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'coords_array))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'coords_array))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetCoords-response>) istream)
  "Deserializes a message object of type '<GetCoords-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'coords_array) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'coords_array)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetCoords-response>)))
  "Returns string type for a service object of type '<GetCoords-response>"
  "robot_commander/GetCoordsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetCoords-response)))
  "Returns string type for a service object of type 'GetCoords-response"
  "robot_commander/GetCoordsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetCoords-response>)))
  "Returns md5sum for a message object of type '<GetCoords-response>"
  "5fda44d5b45a78ce5dc124b63492459c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetCoords-response)))
  "Returns md5sum for a message object of type 'GetCoords-response"
  "5fda44d5b45a78ce5dc124b63492459c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetCoords-response>)))
  "Returns full string definition for message of type '<GetCoords-response>"
  (cl:format cl:nil "float32[] coords_array~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetCoords-response)))
  "Returns full string definition for message of type 'GetCoords-response"
  (cl:format cl:nil "float32[] coords_array~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetCoords-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'coords_array) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetCoords-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetCoords-response
    (cl:cons ':coords_array (coords_array msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetCoords)))
  'GetCoords-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetCoords)))
  'GetCoords-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetCoords)))
  "Returns string type for a service object of type '<GetCoords>"
  "robot_commander/GetCoords")