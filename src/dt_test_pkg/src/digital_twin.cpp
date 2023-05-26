
#include <dt_test_pkg/ControlEval.h>
#include "dynamic_model_quad.cpp"



class DigitalTwin
{

protected:
    ros::NodeHandle nh_;
    boost::thread *spin_thread;
    bool stop_thread=false;

    mavros_msgs::State  current_state;
    geometry_msgs::Pose current_pose;
    dt_test_pkg::Wind   current_wind;

    ros::Subscriber pose_sub;
    ros::Subscriber wind_sub;
    ros::Subscriber state_sub;

    ros::Publisher control_pub;

    ros::Publisher local_pos_pub = nh_.advertise<geometry_msgs::PoseStamped>
        ("mavros/setpoint_position/local", 10);
    ros::Publisher real_pos_pub = nh_.advertise<geometry_msgs::PoseStamped>
        ("/mavros/local_position/pose", 10);

    ros::ServiceClient arming_client = nh_.serviceClient<mavros_msgs::CommandBool>
        ("mavros/cmd/arming");
    ros::ServiceClient set_mode_client = nh_.serviceClient<mavros_msgs::SetMode>
        ("mavros/set_mode");
            
    QuadDynamicModel _dynamic_model_quad;
    

    
public:
    void spinThread()
    {
        while(!stop_thread)
        {
            ros::spinOnce();
        }
    }

    void stateCallBack(const mavros_msgs::State::ConstPtr& msg){
        current_state = *msg;
    }

    DigitalTwin() 
    {
        // update the info of environmental and digital model
        state_sub = nh_.subscribe<mavros_msgs::State>("mavros/state", 10, &DigitalTwin::stateCallBack, this);
        pose_sub = nh_.subscribe("/physical_entity/local_position/pose",10, &DigitalTwin::poseCallBack,this);
        wind_sub = nh_.subscribe("/weather/wind",10, &DigitalTwin::windCallBack,this);

        // check connection
        ros::Rate rate(20.0);
        while(ros::ok() && !current_state.connected){
            ros::spinOnce();
            rate.sleep();
        }

        stop_thread = false;
        // spin_thread = new boost::thread(&DigitalTwin::spinThread,this);

    }

    ~DigitalTwin()
    {
        ROS_WARN_STREAM("Destroy the object.");
        stop_thread=true;
        sleep(1);
        // spin_thread->join();
    }

    //------------------------ CALLBACK ------------------------//

    void poseCallBack(const geometry_msgs::Pose::ConstPtr& msg ){
        current_pose = *msg;
        // ROS_INFO_STREAM("[poseCallBack] Get pose data.");

    }

    void windCallBack(const dt_test_pkg::Wind::ConstPtr& msg){
        current_wind = *msg;
        // ROS_INFO_STREAM("[windCallBack] Get wind data.");

    }

    //------------------------ main loop ------------------------//

    void offboardSendTargetPose(){
        ROS_INFO_STREAM("[offboardSendTargetPose] Start main task.");
        
        
        ros::Rate rate(20.0); // setpoint frequency must be faster than 20HZ

        geometry_msgs::PoseStamped pose;
        pose.pose.position.x = 0;
        pose.pose.position.y = 0;
        pose.pose.position.z = 1;

        //send a few setpoints before starting
        for(int i = 100; ros::ok() && i > 0; --i){
            local_pos_pub.publish(pose);
            ros::spinOnce();
            rate.sleep();
        }

        mavros_msgs::SetMode offb_set_mode;
        offb_set_mode.request.custom_mode = "OFFBOARD";

        mavros_msgs::CommandBool arm_cmd;
        arm_cmd.request.value = true;

        ros::Time last_request = ros::Time::now();

        while(ros::ok()){
            // check flight mode 
            if( current_state.mode != "OFFBOARD" &&
                (ros::Time::now() - last_request > ros::Duration(5.0))){
                if( set_mode_client.call(offb_set_mode) &&
                    offb_set_mode.response.mode_sent){
                    ROS_INFO("Offboard enabled");
                }
                last_request = ros::Time::now();
            } else {
                if( !current_state.armed &&
                    (ros::Time::now() - last_request > ros::Duration(5.0))){
                    if( arming_client.call(arm_cmd) &&
                        arm_cmd.response.success){
                        ROS_INFO("Vehicle armed");
                    }
                    last_request = ros::Time::now();
                }
            }

            // _ TODO _ WRITE THE CONTROL INPUT HERE
            // _TODO_ WRITE THE CONTROL INPUT HERE
            // _TODO_ WRITE THE CONTROL INPUT HERE
            //OPTION 1
            // if( safeControl(pose.pose) ){

            // }
            //OPTION 2 update controller parameter based on wind, current pose


            local_pos_pub.publish(pose);


            ros::spinOnce();
            rate.sleep();

        }

    }



    //------------------------ Models ------------------------//










    //------------------------ DT Services ------------------------//

    bool safeControl(geometry_msgs::Pose target_pose)
    {
        ROS_INFO_STREAM("[safeControl] Start control evaluation (&optimization).");

        ros::NodeHandle n;
        ros::ServiceClient client_control_evaluation = n.serviceClient<dt_test_pkg::ControlEval>("control_evaluation");// client connnected to service 
        dt_test_pkg::ControlEval control_evaluation_msg;

        // Prepare the input for service
        control_evaluation_msg.request.limit_time = 10;
        control_evaluation_msg.request.current_pose = current_pose;
        control_evaluation_msg.request.target_pose = target_pose;

        // Initialize the result of service
        bool result = false;

        // Evaluate the control input by calling service control_evaluation
        if (client_control_evaluation.call(control_evaluation_msg) )
        {
            ROS_INFO("Service control_evaluation Finished. target_pose is ready for publishing.");   
            result = control_evaluation_msg.response.control_ok;
        }
        else
        {
            ROS_ERROR("Failed to call service control_evaluation. target_pose needed to be adjust.");
        }

        return result;

    }

};






int main(int argc, char **argv)
{
    ros::init(argc, argv, "twin_node");

    DigitalTwin digital_drone;
    ROS_INFO_STREAM("[MAIN] Object of DigitalTwin is built. The digital twin of drone starts updating data.");

    digital_drone.offboardSendTargetPose();
  
    return 0;
}
