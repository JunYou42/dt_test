# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "dt_test_pkg: 1 messages, 1 services")

set(MSG_I_FLAGS "-Idt_test_pkg:/home/roku/workspace_jun/dt_test/src/dt_test_pkg/msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/noetic/share/sensor_msgs/cmake/../msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(dt_test_pkg_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/roku/workspace_jun/dt_test/src/dt_test_pkg/msg/Wind.msg" NAME_WE)
add_custom_target(_dt_test_pkg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "dt_test_pkg" "/home/roku/workspace_jun/dt_test/src/dt_test_pkg/msg/Wind.msg" ""
)

get_filename_component(_filename "/home/roku/workspace_jun/dt_test/src/dt_test_pkg/srv/ControlEval.srv" NAME_WE)
add_custom_target(_dt_test_pkg_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "dt_test_pkg" "/home/roku/workspace_jun/dt_test/src/dt_test_pkg/srv/ControlEval.srv" "geometry_msgs/Point:geometry_msgs/Quaternion:geometry_msgs/Pose"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(dt_test_pkg
  "/home/roku/workspace_jun/dt_test/src/dt_test_pkg/msg/Wind.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/dt_test_pkg
)

### Generating Services
_generate_srv_cpp(dt_test_pkg
  "/home/roku/workspace_jun/dt_test/src/dt_test_pkg/srv/ControlEval.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/dt_test_pkg
)

### Generating Module File
_generate_module_cpp(dt_test_pkg
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/dt_test_pkg
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(dt_test_pkg_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(dt_test_pkg_generate_messages dt_test_pkg_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/roku/workspace_jun/dt_test/src/dt_test_pkg/msg/Wind.msg" NAME_WE)
add_dependencies(dt_test_pkg_generate_messages_cpp _dt_test_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/roku/workspace_jun/dt_test/src/dt_test_pkg/srv/ControlEval.srv" NAME_WE)
add_dependencies(dt_test_pkg_generate_messages_cpp _dt_test_pkg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(dt_test_pkg_gencpp)
add_dependencies(dt_test_pkg_gencpp dt_test_pkg_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS dt_test_pkg_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(dt_test_pkg
  "/home/roku/workspace_jun/dt_test/src/dt_test_pkg/msg/Wind.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/dt_test_pkg
)

### Generating Services
_generate_srv_eus(dt_test_pkg
  "/home/roku/workspace_jun/dt_test/src/dt_test_pkg/srv/ControlEval.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/dt_test_pkg
)

### Generating Module File
_generate_module_eus(dt_test_pkg
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/dt_test_pkg
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(dt_test_pkg_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(dt_test_pkg_generate_messages dt_test_pkg_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/roku/workspace_jun/dt_test/src/dt_test_pkg/msg/Wind.msg" NAME_WE)
add_dependencies(dt_test_pkg_generate_messages_eus _dt_test_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/roku/workspace_jun/dt_test/src/dt_test_pkg/srv/ControlEval.srv" NAME_WE)
add_dependencies(dt_test_pkg_generate_messages_eus _dt_test_pkg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(dt_test_pkg_geneus)
add_dependencies(dt_test_pkg_geneus dt_test_pkg_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS dt_test_pkg_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(dt_test_pkg
  "/home/roku/workspace_jun/dt_test/src/dt_test_pkg/msg/Wind.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/dt_test_pkg
)

### Generating Services
_generate_srv_lisp(dt_test_pkg
  "/home/roku/workspace_jun/dt_test/src/dt_test_pkg/srv/ControlEval.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/dt_test_pkg
)

### Generating Module File
_generate_module_lisp(dt_test_pkg
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/dt_test_pkg
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(dt_test_pkg_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(dt_test_pkg_generate_messages dt_test_pkg_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/roku/workspace_jun/dt_test/src/dt_test_pkg/msg/Wind.msg" NAME_WE)
add_dependencies(dt_test_pkg_generate_messages_lisp _dt_test_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/roku/workspace_jun/dt_test/src/dt_test_pkg/srv/ControlEval.srv" NAME_WE)
add_dependencies(dt_test_pkg_generate_messages_lisp _dt_test_pkg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(dt_test_pkg_genlisp)
add_dependencies(dt_test_pkg_genlisp dt_test_pkg_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS dt_test_pkg_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(dt_test_pkg
  "/home/roku/workspace_jun/dt_test/src/dt_test_pkg/msg/Wind.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/dt_test_pkg
)

### Generating Services
_generate_srv_nodejs(dt_test_pkg
  "/home/roku/workspace_jun/dt_test/src/dt_test_pkg/srv/ControlEval.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/dt_test_pkg
)

### Generating Module File
_generate_module_nodejs(dt_test_pkg
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/dt_test_pkg
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(dt_test_pkg_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(dt_test_pkg_generate_messages dt_test_pkg_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/roku/workspace_jun/dt_test/src/dt_test_pkg/msg/Wind.msg" NAME_WE)
add_dependencies(dt_test_pkg_generate_messages_nodejs _dt_test_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/roku/workspace_jun/dt_test/src/dt_test_pkg/srv/ControlEval.srv" NAME_WE)
add_dependencies(dt_test_pkg_generate_messages_nodejs _dt_test_pkg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(dt_test_pkg_gennodejs)
add_dependencies(dt_test_pkg_gennodejs dt_test_pkg_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS dt_test_pkg_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(dt_test_pkg
  "/home/roku/workspace_jun/dt_test/src/dt_test_pkg/msg/Wind.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/dt_test_pkg
)

### Generating Services
_generate_srv_py(dt_test_pkg
  "/home/roku/workspace_jun/dt_test/src/dt_test_pkg/srv/ControlEval.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/dt_test_pkg
)

### Generating Module File
_generate_module_py(dt_test_pkg
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/dt_test_pkg
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(dt_test_pkg_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(dt_test_pkg_generate_messages dt_test_pkg_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/roku/workspace_jun/dt_test/src/dt_test_pkg/msg/Wind.msg" NAME_WE)
add_dependencies(dt_test_pkg_generate_messages_py _dt_test_pkg_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/roku/workspace_jun/dt_test/src/dt_test_pkg/srv/ControlEval.srv" NAME_WE)
add_dependencies(dt_test_pkg_generate_messages_py _dt_test_pkg_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(dt_test_pkg_genpy)
add_dependencies(dt_test_pkg_genpy dt_test_pkg_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS dt_test_pkg_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/dt_test_pkg)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/dt_test_pkg
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(dt_test_pkg_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(dt_test_pkg_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(dt_test_pkg_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/dt_test_pkg)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/dt_test_pkg
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(dt_test_pkg_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(dt_test_pkg_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(dt_test_pkg_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/dt_test_pkg)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/dt_test_pkg
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(dt_test_pkg_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(dt_test_pkg_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(dt_test_pkg_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/dt_test_pkg)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/dt_test_pkg
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(dt_test_pkg_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(dt_test_pkg_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(dt_test_pkg_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/dt_test_pkg)
  install(CODE "execute_process(COMMAND \"/usr/local/anaconda/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/dt_test_pkg\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/dt_test_pkg
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(dt_test_pkg_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(dt_test_pkg_generate_messages_py sensor_msgs_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(dt_test_pkg_generate_messages_py std_msgs_generate_messages_py)
endif()
