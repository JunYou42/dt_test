
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

class QuadDynamicModel{

private:
    ros::NodeHandle nh_;
    boost::thread *spin_thread;
    bool stop_thread=false;

    mavros_msgs::State  current_state;
    mavros_msgs::ESCStatus  current_esc;
    mavros_msgs::ESCStatusItem current_esc_item[4];
    geometry_msgs::Pose current_pose;
    geometry_msgs::Twist current_velocity;
    Vector3f   current_wind = Vector3f(0.0f, 0.0f, 0.0f) ;

    ros::Subscriber pose_sub;
    ros::Subscriber vel_sub;
    ros::Subscriber wind_sub;
    ros::Subscriber state_sub;
    ros::Subscriber esc_sub;

    
    //constant model parameter:
    const float m = 1.02; // mass of quadrotor 
    const float R = 0.13/2;  // radius of rotor 
    const float l = 0.14;  // arm length
    static constexpr int NB = 3; // number of blade
    const float g = 9.81; // gravaty acceleration [m/s^2]
    const float rho = 1.225f; // air density [kg/m^3]
    Matrix3f J = Matrix3f::Identity();// inertia matrix
    Matrix3f J_inv;
	    //_Im1 = 100.0f * inv(static_cast<typeof _I>(100.0f * _I));
	Vector3f G = Vector3f(0.0f, 0.0f, - m * g); // gravity applied on quadrotor
    
    Vector3f r[4]= {
        Vector3f(l, 0, 0),
        Vector3f(0, l, 0),
        Vector3f(-l, 0, 0),
        Vector3f(0, -l, 0)
    }; // 


    //time varying model parameter:
	Matrix3f _R_ICB;          // paper body to inertial frame transformation
	Matrix3f _R_IRB;          // mavros body to inertial frame transformation
    
	Vector3f _v = Vector3f(0.0f, 0.0f, 0.0f); // velocity in inertial frame
    Quaternionf _quat; 
    float _p = 0.0f, _y = 0.0f, _r = 0.0f;
	Vector3f _Omega;// angular velocity in body frame 
	
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
	Vector3f _Omega_dot; // angular acceleration in inertial frame

	Vector3f _Fe_computed;	// resultant force in inertial frame
	Vector3f _Me_computed;	// resultant moment
	Vector3f _D_computed;	// aerodynamic drag in inertial frame

public:
    void spinThread()
    {
        while(!stop_thread)
        {
            ros::spinOnce();
        }
    }

    QuadDynamicModel() 
    {
        // update the ROS topics
        state_sub = nh_.subscribe<mavros_msgs::State>("mavros/state", 10, &QuadDynamicModel::stateCallBack, this);
        esc_sub = nh_.subscribe<mavros_msgs::ESCStatus>("mavros/esc_status", 10, &QuadDynamicModel::escCallBack, this);
        pose_sub = nh_.subscribe("/physical_entity/local_position/pose",10, &QuadDynamicModel::poseCallBack,this);
        vel_sub = nh_.subscribe("/physical_entity/local_position/velocity",10, &QuadDynamicModel::velCallBack,this);
        wind_sub = nh_.subscribe("/weather/wind",10, &QuadDynamicModel::windCallBack,this);

       

        // check connection
        ros::Rate rate(20.0);
        while(ros::ok() && !current_state.connected){
             
        
            ros::spinOnce();
            rate.sleep();
        }

        stop_thread = false;
        spin_thread = new boost::thread(&QuadDynamicModel::spinThread,this);

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
        // ROS_INFO_STREAM("[QuadModel][poseCallBack] Get pose data.");

    }

    void velCallBack(const geometry_msgs::Twist::ConstPtr& msg ){
        current_velocity = *msg;
        // ROS_INFO_STREAM("[velCallBack] Get pose data.");

    }
    void escCallBack(const mavros_msgs::ESCStatus::ConstPtr& msg ){
        current_esc = *msg;
        for (int i=0; i<4; i++){
            current_esc_item[i] = msg->esc_status[i];
        }
        // ROS_INFO_STREAM("[escCallBack] Get pose data.");

    }

    void windCallBack(const dt_test_pkg::Wind::ConstPtr& msg){
        current_wind = Vector3f(msg->wind_x,
                                msg->wind_y,
                                msg->wind_z);
        // ROS_INFO_STREAM("[windCallBack] Get wind data.");

    }

    void updateModelParameters(){
        // read parameter
        J << 0.0051, 0, 0,
            0, 0.0051, 0,
            0, 0, 0.0096;
        J_inv = J.inverse(); 
        
        _quat.x() = current_pose.orientation.x;
        _quat.y()  =  current_pose.orientation.y;
        _quat.z()  = current_pose.orientation.z;
        _quat.w()  = current_pose.orientation.w;
        _R_IRB = _quat.toRotationMatrix();
        AngleAxisf _rotation(M_PI/4, Vector3f::UnitZ());
        Matrix3f _R_RB_CB = _rotation.toRotationMatrix();
        _R_ICB = _R_IRB * _R_RB_CB;

        _v = Vector3f(current_velocity.linear.x,
            current_velocity.linear.y,
            current_velocity.linear.z); // inertial frame ??

        _r = current_velocity.angular.x;
        _p = current_velocity.angular.y;
        _y = current_velocity.angular.z;
        _Omega = Vector3f(_r, _p, _y); // body frame

        for (int i=0; i<4; i++){
            _u[i] = current_esc_item[i].rpm;
            _omega[i] = 2 * M_PI * _u[i]/60;
        }

        // update coefficients  // _TODO_
        _C_T = 2.49e-6/( rho * M_PI * pow(R, 4)); 
        _C_Q = 4.62e-8/( rho * M_PI * pow(R, 5));
        _C_D = 0.0285; // D= - _C_D * v_rel^2
    }

    void updateForceandMoment(){
        // Drag
        Vector3f _relative_velocity = _v - current_wind;
        _D_computed = - _C_D * _relative_velocity.norm() * _relative_velocity;

        // resultant Thrust -- inertial frame
        Vector3f _sum_thrust;
        for (int i=0; i<4; i++){
            _T[i] = _C_T * rho * M_PI * pow(R, 4) * pow(_omega[i],2);
        }
        _sum_thrust = _T[0] * _d[0] + _T[1] * _d[1] + _T[2] * _d[2] + _T[3] * _d[3];
        _Fe_computed = G + _D_computed + _R_ICB * _sum_thrust;

        // resultant Torque -- body frame
        Vector3f _thrust_moment = Vector3f(0.0f, 0.0f, 0.0f) ;
        Vector3f _reaction_torque = Vector3f(0.0f, 0.0f, 0.0f) ;
        for (int i=0; i<4; i++){
            _Q[i] = _C_Q * rho * M_PI * pow(R, 5) * pow(_omega[i],2);
            _thrust_moment = _thrust_moment + r[i].cross(_T[i] * _d[i]);
            _reaction_torque = _reaction_torque + pow((-1), (i+1)) * _Q[i] * _d[i]; // _TODO_ notice direction
        }

        _Me_computed = _thrust_moment + _reaction_torque;// _TODO_ missing damper

        ROS_INFO_STREAM("[QuadModel][updateForceandMoment] Get _D_computed: \n" << _D_computed );
        ROS_INFO_STREAM("[QuadModel][updateForceandMoment] Get _Fe_computed:\n" << _Fe_computed );
        ROS_INFO_STREAM("[QuadModel][updateForceandMoment] Get _Me_computed:\n" << _Me_computed );

    }

    void newtonEulerMotionEquation(){

	    _v_dot = _Fe_computed/ m;   // conservation of linear momentum
	    _Omega_dot = J_inv * (_Me_computed - _Omega.cross(J * _Omega)); // conservation of angular momentum
        ROS_INFO_STREAM("[QuadModel][newtonEulerMotionEquation] Get _v_dot:\n" << _v_dot );
        ROS_INFO_STREAM("[QuadModel][newtonEulerMotionEquation] Get _Omega_dot:\n" << _Omega_dot );

    }

    void printInfo(){
        // ROS_INFO_STREAM("[INFO] Get rotor speed.\n" << _omega[0] << "\n"
        //                                             <<  _omega[1] << "\n"
        //                                             <<  _omega[2] << "\n"
        //                                             <<  _omega[3] << "\n"
        //                                              );

        // ROS_INFO_STREAM("[INFO] Get VELOCITY:\n" << _v);
        // ROS_INFO_STREAM("[INFO] Get OMEGA:\n" << _Omega);
        // ROS_INFO_STREAM("[INFO] Get OMEGA:\n" << _Omega);
        ROS_INFO_STREAM("[INFO] Get THRUST.\n" <<    _T[0] << "\n"
                                                    <<  _T[1] << "\n"
                                                    <<  _T[2] << "\n"
                                                    <<  _T[3] << "\n"
                                                     );
    }    

	Eigen::Vector3f getFe() const { return _Fe_computed; }
	Eigen::Vector3f getMe() const { return _Me_computed; }
	Eigen::Vector3f getDrag() const { return _D_computed; }
	Eigen::Vector3f getAccLinear() const { return _v_dot; }
	Eigen::Vector3f getAccAngular() const { return _Omega_dot; }

    
};