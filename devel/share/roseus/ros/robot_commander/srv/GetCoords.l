;; Auto-generated. Do not edit!


(when (boundp 'robot_commander::GetCoords)
  (if (not (find-package "ROBOT_COMMANDER"))
    (make-package "ROBOT_COMMANDER"))
  (shadow 'GetCoords (find-package "ROBOT_COMMANDER")))
(unless (find-package "ROBOT_COMMANDER::GETCOORDS")
  (make-package "ROBOT_COMMANDER::GETCOORDS"))
(unless (find-package "ROBOT_COMMANDER::GETCOORDSREQUEST")
  (make-package "ROBOT_COMMANDER::GETCOORDSREQUEST"))
(unless (find-package "ROBOT_COMMANDER::GETCOORDSRESPONSE")
  (make-package "ROBOT_COMMANDER::GETCOORDSRESPONSE"))

(in-package "ROS")





(defclass robot_commander::GetCoordsRequest
  :super ros::object
  :slots (_top_left _bottom_right ))

(defmethod robot_commander::GetCoordsRequest
  (:init
   (&key
    ((:top_left __top_left) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:bottom_right __bottom_right) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _top_left __top_left)
   (setq _bottom_right __bottom_right)
   self)
  (:top_left
   (&optional __top_left)
   (if __top_left (setq _top_left __top_left)) _top_left)
  (:bottom_right
   (&optional __bottom_right)
   (if __bottom_right (setq _bottom_right __bottom_right)) _bottom_right)
  (:serialization-length
   ()
   (+
    ;; float32[] _top_left
    (* 4    (length _top_left)) 4
    ;; float32[] _bottom_right
    (* 4    (length _bottom_right)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[] _top_left
     (write-long (length _top_left) s)
     (dotimes (i (length _top_left))
       (sys::poke (elt _top_left i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _bottom_right
     (write-long (length _bottom_right) s)
     (dotimes (i (length _bottom_right))
       (sys::poke (elt _bottom_right i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[] _top_left
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _top_left (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _top_left i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _bottom_right
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _bottom_right (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _bottom_right i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(defclass robot_commander::GetCoordsResponse
  :super ros::object
  :slots (_coords_array ))

(defmethod robot_commander::GetCoordsResponse
  (:init
   (&key
    ((:coords_array __coords_array) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _coords_array __coords_array)
   self)
  (:coords_array
   (&optional __coords_array)
   (if __coords_array (setq _coords_array __coords_array)) _coords_array)
  (:serialization-length
   ()
   (+
    ;; float32[] _coords_array
    (* 4    (length _coords_array)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[] _coords_array
     (write-long (length _coords_array) s)
     (dotimes (i (length _coords_array))
       (sys::poke (elt _coords_array i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[] _coords_array
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _coords_array (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _coords_array i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(defclass robot_commander::GetCoords
  :super ros::object
  :slots ())

(setf (get robot_commander::GetCoords :md5sum-) "5fda44d5b45a78ce5dc124b63492459c")
(setf (get robot_commander::GetCoords :datatype-) "robot_commander/GetCoords")
(setf (get robot_commander::GetCoords :request) robot_commander::GetCoordsRequest)
(setf (get robot_commander::GetCoords :response) robot_commander::GetCoordsResponse)

(defmethod robot_commander::GetCoordsRequest
  (:response () (instance robot_commander::GetCoordsResponse :init)))

(setf (get robot_commander::GetCoordsRequest :md5sum-) "5fda44d5b45a78ce5dc124b63492459c")
(setf (get robot_commander::GetCoordsRequest :datatype-) "robot_commander/GetCoordsRequest")
(setf (get robot_commander::GetCoordsRequest :definition-)
      "float32[] top_left
float32[] bottom_right
---
float32[] coords_array
")

(setf (get robot_commander::GetCoordsResponse :md5sum-) "5fda44d5b45a78ce5dc124b63492459c")
(setf (get robot_commander::GetCoordsResponse :datatype-) "robot_commander/GetCoordsResponse")
(setf (get robot_commander::GetCoordsResponse :definition-)
      "float32[] top_left
float32[] bottom_right
---
float32[] coords_array
")



(provide :robot_commander/GetCoords "5fda44d5b45a78ce5dc124b63492459c")


