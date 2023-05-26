#include <ros/ros.h>
#include <boost/thread/thread.hpp>
#include <boost/date_time.hpp>
#include <boost/algorithm/string.hpp>
#include <mavros_msgs/CommandBool.h>
#include <mavros_msgs/SetMode.h>
#include <mavros_msgs/State.h>
#include <geometry_msgs/PoseStamped.h>
#include <geometry_msgs/Pose.h>
// LOCAL
#include <dt_test_pkg/Wind.h>

class QuadDynamicModel{

private:
    ros::NodeHandle nh_;
    boost::thread *spin_thread;
    bool stop_thread=false;

    mavros_msgs::State  current_state;
    geometry_msgs::Pose current_pose;
    dt_test_pkg::Wind   current_wind;

    ros::Subscriber pose_sub;
    ros::Subscriber wind_sub;
    ros::Subscriber state_sub;

    
    /*
    model parameter:
    - mass
    - inertial matrix
    */


    /* paramters computed */
	matrix::Vector3f _Fe_computed;	// aerodynamic force
	matrix::Vector3f _Me_computed;	// aerodynamic moment
	matrix::Vector3f _D_computed;	// aerodynamic drag
	matrix::Vector3f _acc_linear_computed;	
	matrix::Vector3f _acc_angular_computed;	

public:
    QuadDynamicModel() 
    {
        // update the info
        state_sub = nh_.subscribe<mavros_msgs::State>("mavros/state", 10, &QuadDynamicModel::stateCallBack, this);
        pose_sub = nh_.subscribe("/physical_entity/local_position/pose",10, &QuadDynamicModel::poseCallBack,this);
        wind_sub = nh_.subscribe("/weather/wind",10, &QuadDynamicModel::windCallBack,this);

        // check connection
        ros::Rate rate(20.0);
        while(ros::ok() && !current_state.connected){
            ros::spinOnce();
            rate.sleep();
        }

        stop_thread = false;
        // spin_thread = new boost::thread(&DigitalTwin::spinThread,this);

    }

    ~QuadDynamicModel()
    {
        ROS_WARN_STREAM("Destroy the QuadDynamicModel object.");
        stop_thread=true;
        sleep(1);
        // spin_thread->join();
    }

    void stateCallBack(const mavros_msgs::State::ConstPtr& msg){
        current_state = *msg;
    }

    void poseCallBack(const geometry_msgs::Pose::ConstPtr& msg ){
        current_pose = *msg;
        // ROS_INFO_STREAM("[poseCallBack] Get pose data.");

    }

    void windCallBack(const dt_test_pkg::Wind::ConstPtr& msg){
        current_wind = *msg;
        // ROS_INFO_STREAM("[windCallBack] Get wind data.");

    }


	matrix::Vector3f getFe() const { return _Fe_computed; }
	matrix::Vector3f getMe() const { return _Me_computed; }
	matrix::Vector3f getDrag() const { return _D_computed; }
	matrix::Vector3f getAccLinear() const { return _acc_linear_computed; }
	matrix::Vector3f getAccAngular() const { return _acc_angular_computed; }

    
};