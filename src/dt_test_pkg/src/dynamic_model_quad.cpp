
#include<iostream>
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
#include <geometry_msgs/PoseStamped.h>
#include <geometry_msgs/Pose.h>
// LOCAL
#include <dt_test_pkg/Wind.h>

using namespace Eigen;

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
    const float m = 1.0f; // mass of quadrotor
    const float R = 1.0f;  // radius of rotor
    static constexpr int NB = 4; // number of blade
    const float g = 9.8; // gravaty acceleration
    const float rho = 1.225f; // gravaty acceleration
    const Matrix3f J = Matrix3f::Ones();// inertia matrix

    Matrix3f J_inv = J.inverse();
	    //_Im1 = 100.0f * inv(static_cast<typeof _I>(100.0f * _I));
	Vector3f G = Vector3f(0.0f, 0.0f, - m * g); // gravity applied on quadrotor
    
    Vector3f r[4]= {
        Vector3f(0, 0, 1),
        Vector3f(0, 0, 1),
        Vector3f(0, 0, 1),
        Vector3f(0, 0, 1)
    }; 

    //time varying model parameter:
	Eigen::Matrix3f       _R_IB{};          // body to inertial transformation
    
	Vector3f _v = Vector3f(0.0f, 0.0f, 0.0f); // velocity in inertial frame
    geometry_msgs::Quaternion _quat; //Quaternionf _quat(1, 0, 0, 0);
    float _p =0.0f, _q =0.0f, _r = 0.0f;
	Vector3f _Omega = Vector3f(_p, _q, _r); // angular velocity in inertial frame 
	
    float _u[4] = {0.0f, 0.0f, 0.0f, 0.0f};
	float _omega[4] = {0.0f, 0.0f, 0.0f, 0.0f};// angular velocity of motor

	Vector3f _d[4] = {
        Vector3f(0, 0, 1),
        Vector3f(0, 0, 1),
        Vector3f(0, 0, 1),
        Vector3f(0, 0, 1)
    }; // direction of j-th rotor in body frame
    
    // coefficients
    float _C_T;
    float _C_Q;
    float _C_D;


    /* paramters computed */
	float _T[4];           // thrust force generated in body frame [N]
	float  _Q[4];           // torque generated in body frame [N]
	Vector3f _v_dot = Vector3f(0.0f, 0.0f, 0.0f); // acceleration in inertial frame
	Vector3f _Omega_dot = Vector3f(_p, _q, _r); // angular acceleration in inertial frame

	Eigen::Vector3f _Fe_computed;	// resultant force in inertial frame
	Eigen::Vector3f _Me_computed;	// resultant moment
	Eigen::Vector3f _D_computed;	// aerodynamic drag in inertial frame

public:
    QuadDynamicModel() 
    {
        // update the ROS topics
        state_sub = nh_.subscribe<mavros_msgs::State>("mavros/state", 10, &QuadDynamicModel::stateCallBack, this);
        pose_sub = nh_.subscribe("/physical_entity/local_position/pose",10, &QuadDynamicModel::poseCallBack,this);
        wind_sub = nh_.subscribe("/weather/wind",10, &QuadDynamicModel::windCallBack,this);

        // update dynamic mdoel
        updateModelParameters();
        updateForceandMoment();
        newtonEulerMotionEquation();
        

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

    void updateModelParameters(){
        // read parameter
        _quat.x = 1.0f;
        _quat.y = 1.0f;
        _quat.z = 1.0f;
        _quat.w = 1.0f;

        // update coefficients
    
    }

    void updateForceandMoment(){
        // Drag
        Vector3f _relative_velocity = _v - current_wind;
        _D_computed = - _C_D * _relative_velocity.norm() * _relative_velocity;

        // resultant Thrust
        Vector3f _sum_thrust;
        for (int i=0; i<3; i++){
            _T[i] = _C_T * rho * M_PI * pow(R, 4) * pow(_omega[i],2);
        }
        _sum_thrust = _T[0] * _d[0] + _T[1] * _d[1] + _T[2] * _d[2] + _T[3] * _d[3];
        _Fe_computed = G + _D_computed + _R_IB * _sum_thrust;

        // resultant Torque
        Vector3f _thrust_moment = Vector3f(0.0f, 0.0f, 0.0f) ;
        Vector3f _reaction_torque = Vector3f(0.0f, 0.0f, 0.0f) ;
        for (int i=0; i<3; i++){
            _thrust_moment = _thrust_moment + r[i].cross(_T[i] * _d[i]);
            _reaction_torque = _reaction_torque + pow((-1), (i+1)) * _Q[i] * _d[i];
        }

        _Me_computed = _thrust_moment + _reaction_torque;// _TODO_ missing damper

    }

    void newtonEulerMotionEquation(){

	    _v_dot = _Fe_computed/ m;   // conservation of linear momentum
	    _Omega_dot = J_inv * (_Me_computed - _Omega.cross(J * _Omega)); // conservation of angular momentum

    }

	Eigen::Vector3f getFe() const { return _Fe_computed; }
	Eigen::Vector3f getMe() const { return _Me_computed; }
	Eigen::Vector3f getDrag() const { return _D_computed; }
	Eigen::Vector3f getAccLinear() const { return _v_dot; }
	Eigen::Vector3f getAccAngular() const { return _Omega_dot; }

    
};