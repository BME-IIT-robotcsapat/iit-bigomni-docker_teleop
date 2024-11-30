# Introduction

This is a docker image for teleoperating the big omnidirectional robot of IIT department. Currently only joystick is supported.

This is required, because the robot runs on ROS2 Foxy. With this image, teleoperation can be performed from any ubuntu version.

# Installation

1. Update system
   ```bash
   sudo apt update && sudo apt upgrade
   ```
3. Install docker and git
4. ```bash
   sudo apt install -y docker.io git
   ```
5. Prepare workspace
   ```bash
   mkdir -p ~/iit-bigomni-docker_teleop_ws/ros2_ws/src
   cd ~/iit-bigomni-docker_teleop_ws
   ```
6. Clone this and teleop repository
   ```bash
   git clone https://github.com/BME-IIT-robotcsapat/iit-bigomni-docker_teleop
   git clone https://github.com/BME-IIT-robotcsapat/iit-bigomni-teleop ./ros2_ws/src
   ```
7. Make build and run scripts executable
   ```bash
   chmod +x ./build_image.bash
   chmod +x ./run_container.bash
   ```

# Usage
1. Connect to desired network
2. Build docker image (only required once, or if git repos are updated)
   ```bash
   ./build_image.bash
   ```
3. Run docker container
   ```bash
   ./run_container.bash
   ```

For details, analyze the script files.

The script expects the joystick on the `/dev/input/event6` location, if ROS2 cannot connect to it, check in file system and modify script file accordingly.

If teleop package is updated, clone/pull changes with git and rebuild the docker image.
