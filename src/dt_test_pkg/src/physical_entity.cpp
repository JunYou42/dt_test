/*  Copyright @ JUN YOU

    This generates a physical entity node with functions as:
    1. read available sensor updates from different data resource
    2. publish the processed data with ROS topics under /physical_entity

    Done:
    1. topics:
        - /physical_entity/local_position/pose | <geometry_msgs::Pose>
            get pose information from  /mavros/vision_pose/pose, which is a 
            remapped pose data sent by vrpn pkg

*/

#include <ros/ros.h>
#include <geometry_msgs/PoseStamped.h>
#include <geometry_msgs/Pose.h>
#include <geometry_msgs/TwistStamped.h>
#include <geometry_msgs/Twist.h>


//  LOCAL

geometry_msgs::PoseStamped mocap_pose_data;

void poseCallBack(const geometry_msgs::PoseStamped::ConstPtr& msg){
    mocap_pose_data = *msg;
}

geometry_msgs::TwistStamped velocity_data;

void velCallBack(const geometry_msgs::TwistStamped::ConstPtr& msg){
    velocity_data = *msg;
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "physical_entity_node");
    ros::NodeHandle nh;
    ros::Rate rate(20.0);
    

    // _TODO_
    // _TODO_ SUBSCRIBE TO AVAILABLE DATA SOURCE
    // _TODO_
    // ros::Subscriber pose_sub = nh.subscribe<geometry_msgs::PoseStamped>("mavros/vision_pose/pose", 10, poseCallBack);
    ros::Subscriber pose_sub = nh.subscribe<geometry_msgs::PoseStamped>("/mavros/local_position/pose", 10, poseCallBack);
    ros::Publisher pose_pub = nh.advertise<geometry_msgs::Pose>("/physical_entity/local_position/pose", 10);
    
    ros::Subscriber vel_sub = nh.subscribe<geometry_msgs::TwistStamped>("/mavros/local_position/velocity_local", 10, velCallBack);
    ros::Publisher vel_pub = nh.advertise<geometry_msgs::Twist>("/physical_entity/local_position/velocity", 10);

    while(ros::ok()){

        // _TODO_
        // _TODO_ FILTER AND PROCESS DAYA, THEN PUBLISH 
        // _TODO_

        // Publish the pose data
        geometry_msgs::Pose current_pose;
        current_pose.position.x = mocap_pose_data.pose.position.x;
        current_pose.position.y = mocap_pose_data.pose.position.y;
        current_pose.position.z = mocap_pose_data.pose.position.z;
        current_pose.orientation.x = mocap_pose_data.pose.orientation.x;
        current_pose.orientation.y =  mocap_pose_data.pose.orientation.y;
        current_pose.orientation.z = mocap_pose_data.pose.orientation.z;
        current_pose.orientation.w = mocap_pose_data.pose.orientation.w;
        pose_pub.publish(current_pose);

        // Publish the velocity data
        geometry_msgs::Twist current_vel;
        current_vel= velocity_data.twist;
        vel_pub.publish(current_vel);

        ros::spinOnce();
        rate.sleep();

    }

    return 0;
}
