# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "robot_commander: 0 messages, 1 services")

set(MSG_I_FLAGS "-Igeometry_msgs:/opt/ros/kinetic/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(robot_commander_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/cc/ee106a/fl21/class/ee106a-aet/ros_workspaces/final_project/src/robot_commander/srv/GetCoords.srv" NAME_WE)
add_custom_target(_robot_commander_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "robot_commander" "/home/cc/ee106a/fl21/class/ee106a-aet/ros_workspaces/final_project/src/robot_commander/srv/GetCoords.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(robot_commander
  "/home/cc/ee106a/fl21/class/ee106a-aet/ros_workspaces/final_project/src/robot_commander/srv/GetCoords.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_commander
)

### Generating Module File
_generate_module_cpp(robot_commander
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_commander
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(robot_commander_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(robot_commander_generate_messages robot_commander_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/cc/ee106a/fl21/class/ee106a-aet/ros_workspaces/final_project/src/robot_commander/srv/GetCoords.srv" NAME_WE)
add_dependencies(robot_commander_generate_messages_cpp _robot_commander_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(robot_commander_gencpp)
add_dependencies(robot_commander_gencpp robot_commander_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS robot_commander_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(robot_commander
  "/home/cc/ee106a/fl21/class/ee106a-aet/ros_workspaces/final_project/src/robot_commander/srv/GetCoords.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_commander
)

### Generating Module File
_generate_module_eus(robot_commander
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_commander
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(robot_commander_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(robot_commander_generate_messages robot_commander_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/cc/ee106a/fl21/class/ee106a-aet/ros_workspaces/final_project/src/robot_commander/srv/GetCoords.srv" NAME_WE)
add_dependencies(robot_commander_generate_messages_eus _robot_commander_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(robot_commander_geneus)
add_dependencies(robot_commander_geneus robot_commander_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS robot_commander_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(robot_commander
  "/home/cc/ee106a/fl21/class/ee106a-aet/ros_workspaces/final_project/src/robot_commander/srv/GetCoords.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_commander
)

### Generating Module File
_generate_module_lisp(robot_commander
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_commander
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(robot_commander_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(robot_commander_generate_messages robot_commander_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/cc/ee106a/fl21/class/ee106a-aet/ros_workspaces/final_project/src/robot_commander/srv/GetCoords.srv" NAME_WE)
add_dependencies(robot_commander_generate_messages_lisp _robot_commander_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(robot_commander_genlisp)
add_dependencies(robot_commander_genlisp robot_commander_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS robot_commander_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(robot_commander
  "/home/cc/ee106a/fl21/class/ee106a-aet/ros_workspaces/final_project/src/robot_commander/srv/GetCoords.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_commander
)

### Generating Module File
_generate_module_nodejs(robot_commander
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_commander
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(robot_commander_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(robot_commander_generate_messages robot_commander_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/cc/ee106a/fl21/class/ee106a-aet/ros_workspaces/final_project/src/robot_commander/srv/GetCoords.srv" NAME_WE)
add_dependencies(robot_commander_generate_messages_nodejs _robot_commander_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(robot_commander_gennodejs)
add_dependencies(robot_commander_gennodejs robot_commander_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS robot_commander_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(robot_commander
  "/home/cc/ee106a/fl21/class/ee106a-aet/ros_workspaces/final_project/src/robot_commander/srv/GetCoords.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_commander
)

### Generating Module File
_generate_module_py(robot_commander
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_commander
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(robot_commander_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(robot_commander_generate_messages robot_commander_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/cc/ee106a/fl21/class/ee106a-aet/ros_workspaces/final_project/src/robot_commander/srv/GetCoords.srv" NAME_WE)
add_dependencies(robot_commander_generate_messages_py _robot_commander_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(robot_commander_genpy)
add_dependencies(robot_commander_genpy robot_commander_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS robot_commander_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_commander)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/robot_commander
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(robot_commander_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_commander)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/robot_commander
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(robot_commander_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_commander)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/robot_commander
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(robot_commander_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_commander)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/robot_commander
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(robot_commander_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_commander)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_commander\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/robot_commander
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(robot_commander_generate_messages_py geometry_msgs_generate_messages_py)
endif()
