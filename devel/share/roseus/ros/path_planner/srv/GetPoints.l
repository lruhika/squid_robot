;; Auto-generated. Do not edit!


(when (boundp 'path_planner::GetPoints)
  (if (not (find-package "PATH_PLANNER"))
    (make-package "PATH_PLANNER"))
  (shadow 'GetPoints (find-package "PATH_PLANNER")))
(unless (find-package "PATH_PLANNER::GETPOINTS")
  (make-package "PATH_PLANNER::GETPOINTS"))
(unless (find-package "PATH_PLANNER::GETPOINTSREQUEST")
  (make-package "PATH_PLANNER::GETPOINTSREQUEST"))
(unless (find-package "PATH_PLANNER::GETPOINTSRESPONSE")
  (make-package "PATH_PLANNER::GETPOINTSRESPONSE"))

(in-package "ROS")





(defclass path_planner::GetPointsRequest
  :super ros::object
  :slots ())

(defmethod path_planner::GetPointsRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass path_planner::GetPointsResponse
  :super ros::object
  :slots (_points_array ))

(defmethod path_planner::GetPointsResponse
  (:init
   (&key
    ((:points_array __points_array) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _points_array __points_array)
   self)
  (:points_array
   (&optional __points_array)
   (if __points_array (setq _points_array __points_array)) _points_array)
  (:serialization-length
   ()
   (+
    ;; float32[] _points_array
    (* 4    (length _points_array)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[] _points_array
     (write-long (length _points_array) s)
     (dotimes (i (length _points_array))
       (sys::poke (elt _points_array i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[] _points_array
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _points_array (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _points_array i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(defclass path_planner::GetPoints
  :super ros::object
  :slots ())

(setf (get path_planner::GetPoints :md5sum-) "726e62144bd80158a62de6337dc76b64")
(setf (get path_planner::GetPoints :datatype-) "path_planner/GetPoints")
(setf (get path_planner::GetPoints :request) path_planner::GetPointsRequest)
(setf (get path_planner::GetPoints :response) path_planner::GetPointsResponse)

(defmethod path_planner::GetPointsRequest
  (:response () (instance path_planner::GetPointsResponse :init)))

(setf (get path_planner::GetPointsRequest :md5sum-) "726e62144bd80158a62de6337dc76b64")
(setf (get path_planner::GetPointsRequest :datatype-) "path_planner/GetPointsRequest")
(setf (get path_planner::GetPointsRequest :definition-)
      "---
float32[] points_array
")

(setf (get path_planner::GetPointsResponse :md5sum-) "726e62144bd80158a62de6337dc76b64")
(setf (get path_planner::GetPointsResponse :datatype-) "path_planner/GetPointsResponse")
(setf (get path_planner::GetPointsResponse :definition-)
      "---
float32[] points_array
")



(provide :path_planner/GetPoints "726e62144bd80158a62de6337dc76b64")


