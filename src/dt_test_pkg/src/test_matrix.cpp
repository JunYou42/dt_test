
#include <iostream>
#include <Eigen/Eigen>
#include <Eigen/Core>
#include <Eigen/Geometry>
#include <cmath>
#include <ros/ros.h>
#include <boost/thread/thread.hpp>
#include <boost/date_time.hpp>
#include <boost/algorithm/string.hpp>
#include <mavros_msgs/CommandBool.h>
#include <mavros_msgs/SetMode.h>
#include <mavros_msgs/State.h>
#include <mavros_msgs/ESCStatus.h>
#include <mavros_msgs/ESCStatusItem.h>
#include <geometry_msgs/PoseStamped.h>
#include <geometry_msgs/Pose.h>
#include <geometry_msgs/Twist.h>
// LOCAL
#include <dt_test_pkg/Wind.h>

using namespace Eigen;

int main(){

    Vector3f   current_wind = Vector3f(0.0f, 0.0f, 0.0f) ;

    // Quaternionf _quat;
    // _quat.x() = 0;
    // _quat.y()  = 0;
    // _quat.z()  = 0;
    // _quat.w()  = 1;
    // Matrix3f _R_IRB = _quat.toRotationMatrix();

    AngleAxisf _rotation_0(M_PI/2, Vector3f::UnitZ());
    Matrix3f _R_IRB = _rotation_0.toRotationMatrix();




    AngleAxisf _rotation(M_PI/4, Vector3f::UnitZ());
    Matrix3f _R_RB_CB = _rotation.toRotationMatrix();

    Matrix3f _R_ICB = _R_IRB * _R_RB_CB;

    ROS_INFO_STREAM("_R_IRB :\n" << _R_IRB );
    ROS_INFO_STREAM("_R_RB_CB :\n" << _R_RB_CB );
    ROS_INFO_STREAM("_R_ICB :\n" << _R_ICB );


    return 0;
}