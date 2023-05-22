#!/bin/python3
import rospy
from dt_test_pkg.srv import ControlEval,ControlEvalRequest,ControlEvalResponse

def control_eval():
    rospy.init_node('control_evaluation_server') # create server node
    s = rospy.Service('control_evaluation', ControlEval, handle)

def handle(req):
    print("[Service: control_evaluation] Service starts.")

    current_pose = req.current_pose
    target_pose = req.target_pose
    limit_time = req.limit_time


    #_TODO_
    #_TODO_
    #_TODO_


    result = 1

    print("[Service: control_evaluation] Service ends.")
    return ControlEvalResponse(result)


def main():
    control_eval()
    try:
        rospy.spin()
    except KeyboardInterrupt:
        print("Shutting down")


if __name__ == '__main__':
    main()