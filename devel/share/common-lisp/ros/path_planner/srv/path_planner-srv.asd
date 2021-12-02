
(cl:in-package :asdf)

(defsystem "path_planner-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "GetPoints" :depends-on ("_package_GetPoints"))
    (:file "_package_GetPoints" :depends-on ("_package"))
  ))