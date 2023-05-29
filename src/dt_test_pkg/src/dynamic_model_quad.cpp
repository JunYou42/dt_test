#include <Eigen/Eigen>
#include <cmath>
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

using namespace Eigen

class QuadDynamicModel{

private:
    ros::NodeHandle nh_;
    boost::thread *spin_thread;
    bool stop_thread=false;

    mavros_msgs::State  current_state;
    geometry_msgs::Pose current_pose;
    Vector3f   current_wind;

    ros::Subscriber pose_sub;
    ros::Subscriber wind_sub;
    ros::Subscriber state_sub;

    
    //constant model parameter:
    const float MASS; // mass of quadrotor
    const float R;  // radius of rotor
    const float NB; // number of blade
    

    //aerodynamic model variable:
	Eigen::Matrix3d       _R_IB{};          // body to inertial transformation
    
    Vector3f _p_I = Vector3f(0.0f, 0.0f, 0.0f);
	Vector3f _v_I = Vector3f(0.0f, 0.0f, 0.0f);
	Vector3f _q = Quaternion(1.0f, 0.0f, 0.0f, 0.0f);
	Vector3f _w_B = Vector3f(0.0f, 0.0f, 0.0f);
	float _u[0] = _u[1] = _u[2] = _u[3] = 0.0f;

    /* paramters computed */
	Eigen::Vector3f    _T[NB] {};           // thrust force in body frame [N]

	Eigen::Vector3f _Fe_computed;	// aerodynamic force in inertial frame
	Eigen::Vector3f _Me_computed;	// aerodynamic moment
	Eigen::Vector3f _D_computed;	// aerodynamic drag in inertial frame
	Eigen::Vector3f _acc_linear_computed;	
	Eigen::Vector3f _acc_angular_computed;	

public:
    QuadDynamicModel() 
    {
        // update the ROS topics
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
        current_wind = Vector3f(msg->wind_x,
                                msg->wind_y,
                                msg->wind_z);
        // ROS_INFO_STREAM("[windCallBack] Get wind data.");

    }


	Eigen::Vector3f getFe() const { return _Fe_computed; }
	Eigen::Vector3f getMe() const { return _Me_computed; }
	Eigen::Vector3f getDrag() const { return _D_computed; }
	Eigen::Vector3f getAccLinear() const { return _acc_linear_computed; }
	Eigen::Vector3f getAccAngular() const { return _acc_angular_computed; }

    
};