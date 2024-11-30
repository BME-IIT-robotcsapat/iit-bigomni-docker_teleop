#!/bin/bash
# Start docker container 
# 	interactively
# 	remove files after container stops
# 	with full access to host network (make ROS2 discovery easy)
# 	grant access to joystick (if not working, check which event<x> it is (NOT js<x>)
sudo docker run -it --rm --network host --device /dev/input/event6 iit_bigomni_teleop:foxy
