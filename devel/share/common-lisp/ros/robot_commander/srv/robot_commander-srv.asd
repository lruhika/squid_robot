
(cl:in-package :asdf)

(defsystem "robot_commander-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "GetCoords" :depends-on ("_package_GetCoords"))
    (:file "_package_GetCoords" :depends-on ("_package"))
  ))