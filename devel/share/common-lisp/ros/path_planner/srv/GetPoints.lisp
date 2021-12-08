; Auto-generated. Do not edit!


(cl:in-package path_planner-srv)


;//! \htmlinclude GetPoints-request.msg.html

(cl:defclass <GetPoints-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass GetPoints-request (<GetPoints-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetPoints-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetPoints-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name path_planner-srv:<GetPoints-request> is deprecated: use path_planner-srv:GetPoints-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetPoints-request>) ostream)
  "Serializes a message object of type '<GetPoints-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetPoints-request>) istream)
  "Deserializes a message object of type '<GetPoints-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetPoints-request>)))
  "Returns string type for a service object of type '<GetPoints-request>"
  "path_planner/GetPointsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetPoints-request)))
  "Returns string type for a service object of type 'GetPoints-request"
  "path_planner/GetPointsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetPoints-request>)))
  "Returns md5sum for a message object of type '<GetPoints-request>"
  "deb7c82a588abe4d8862527f49dc8cd4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetPoints-request)))
  "Returns md5sum for a message object of type 'GetPoints-request"
  "deb7c82a588abe4d8862527f49dc8cd4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetPoints-request>)))
  "Returns full string definition for message of type '<GetPoints-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetPoints-request)))
  "Returns full string definition for message of type 'GetPoints-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetPoints-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetPoints-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetPoints-request
))
;//! \htmlinclude GetPoints-response.msg.html

(cl:defclass <GetPoints-response> (roslisp-msg-protocol:ros-message)
  ((points_array
    :reader points_array
    :initarg :points_array
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0))
   (shape
    :reader shape
    :initarg :shape
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0)))
)

(cl:defclass GetPoints-response (<GetPoints-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetPoints-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetPoints-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name path_planner-srv:<GetPoints-response> is deprecated: use path_planner-srv:GetPoints-response instead.")))

(cl:ensure-generic-function 'points_array-val :lambda-list '(m))
(cl:defmethod points_array-val ((m <GetPoints-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_planner-srv:points_array-val is deprecated.  Use path_planner-srv:points_array instead.")
  (points_array m))

(cl:ensure-generic-function 'shape-val :lambda-list '(m))
(cl:defmethod shape-val ((m <GetPoints-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_planner-srv:shape-val is deprecated.  Use path_planner-srv:shape instead.")
  (shape m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetPoints-response>) ostream)
  "Serializes a message object of type '<GetPoints-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'points_array))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'points_array))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'shape))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'shape))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetPoints-response>) istream)
  "Deserializes a message object of type '<GetPoints-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'points_array) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'points_array)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'shape) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'shape)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetPoints-response>)))
  "Returns string type for a service object of type '<GetPoints-response>"
  "path_planner/GetPointsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetPoints-response)))
  "Returns string type for a service object of type 'GetPoints-response"
  "path_planner/GetPointsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetPoints-response>)))
  "Returns md5sum for a message object of type '<GetPoints-response>"
  "deb7c82a588abe4d8862527f49dc8cd4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetPoints-response)))
  "Returns md5sum for a message object of type 'GetPoints-response"
  "deb7c82a588abe4d8862527f49dc8cd4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetPoints-response>)))
  "Returns full string definition for message of type '<GetPoints-response>"
  (cl:format cl:nil "int32[] points_array~%int32[] shape~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetPoints-response)))
  "Returns full string definition for message of type 'GetPoints-response"
  (cl:format cl:nil "int32[] points_array~%int32[] shape~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetPoints-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'points_array) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'shape) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetPoints-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetPoints-response
    (cl:cons ':points_array (points_array msg))
    (cl:cons ':shape (shape msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetPoints)))
  'GetPoints-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetPoints)))
  'GetPoints-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetPoints)))
  "Returns string type for a service object of type '<GetPoints>"
  "path_planner/GetPoints")