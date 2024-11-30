FROM ros:foxy

RUN apt-get update && apt-get install -y \
	ros-${ROS_DISTRO}-demo-nodes-cpp \
	ros-${ROS_DISTRO}-demo-nodes-py  \
	ros-${ROS_DISTRO}-joy		 \
	ros-${ROS_DISTRO}-teleop-twist-joy\
	vim && \
	rm -rf /var/lib/apt/lists/*

WORKDIR /root
COPY ros2_ws ros2_ws
#SHELL ["/bin/bash","-c"]
RUN . /opt/ros/foxy/setup.sh && \
	cd ros2_ws && \
	colcon build
RUN echo  "source ~/ros2_ws/install/setup.bash" >> ~/.bashrc && \
	chmod +x /root/ros2_ws/install/setup.bash

# expose ports, so this container can be reached
EXPOSE 7000-8000

# entry point to source package
COPY entrypoint.bash entrypoint.bash
RUN chmod +x entrypoint.bash
ENTRYPOINT ["./entrypoint.bash"]
# launch ros package
CMD ["ros2","launch","bigomni_teleop","bigomni_joy_teleop.py"]
