
# ==================================
# define some colors for output
# ==================================
COLOR_RED="\033[1;31m"
COLOR_GREEN="\033[1;32m"
COLOR_YELLOW="\033[1;33m"
COLOR_BLUE="\033[1;34m"
COLOR_CYAN="\033[1;36m"
COLOR_WHITE="\033[1;37m"
COLOR_RESET="\033[0m"

echo -e $COLOR_CYAN"*********************************************"$COLOR_RESET
echo -e $COLOR_CYAN"********  Additional ROS packages  **********"$COLOR_RESET
echo -e $COLOR_CYAN"*********************************************"$COLOR_RESET

SLEEP_DURATION=1
ROS_DEPS_FAIL=0


echo -e $COLOR_BLUE"Installing catkin..."$COLOR_RESET
printf 'y\n' | sudo apt-get install ros-$ROS_DISTRO-catkin >> log.txt
if [ $? -eq 0 ]; then
  CATKIN_FAIL=0
  echo -e $COLOR_GREEN"Installed catkin successfully!"$COLOR_RESET
else
  echo -e $COLOR_RED"Failed to install catkin..."$COLOR_RESET
  CATKIN_FAIL=1
  ROS_DEPS_FAIL=1
fi
echo -e $COLOR_CYAN"**************************************"$COLOR_RESET
sleep $SLEEP_DURATION


echo -e $COLOR_BLUE"Installing rviz-visual-tools..."$COLOR_RESET
printf 'y\n' | sudo apt-get install ros-$ROS_DISTRO-rviz-visual-tools >> log.txt
if [ $? -eq 0 ]; then
  RVIZ_VIZUAL_TOOLS_FAIL=0
  echo -e $COLOR_GREEN"Installed rviz-visual-tools successfully!"$COLOR_RESET
else
  echo -e $COLOR_RED"Failed to install rviz-visual-tools..."$COLOR_RESET
  RVIZ_VIZUAL_TOOLS_FAIL=1
  ROS_DEPS_FAIL=1
fi
echo -e $COLOR_CYAN"**************************************"$COLOR_RESET
sleep $SLEEP_DURATION


echo -e $COLOR_BLUE"Installing openni-launch..."$COLOR_RESET
printf 'y\n' | sudo apt-get install ros-$ROS_DISTRO-openni-launch >> log.txt
if [ $? -eq 0 ]; then
  OPENNI_LAUNCH_FAIL=0
  echo -e $COLOR_GREEN"Installed openni-launch successfully!"$COLOR_RESET
else
  echo -e $COLOR_RED"Failed to install openni-launch..."$COLOR_RESET
  OPENNI_LAUNCH_FAIL=1
  ROS_DEPS_FAIL=1
fi
echo -e $COLOR_CYAN"**************************************"$COLOR_RESET
sleep $SLEEP_DURATION


echo -e $COLOR_BLUE"Installing freenect-launch..."$COLOR_RESET
printf 'y\n' | sudo apt-get install ros-$ROS_DISTRO-freenect-launch >> log.txt
if [ $? -eq 0 ]; then
  FREENECT_LAUNCH_FAIL=0
  echo -e $COLOR_GREEN"Installed freenect-launch successfully!"$COLOR_RESET
else
  echo -e $COLOR_RED"Failed to install freenect-launch..."$COLOR_RESET
  FREENECT_LAUNCH_FAIL=1
  ROS_DEPS_FAIL=1
fi
echo -e $COLOR_CYAN"**************************************"$COLOR_RESET
sleep $SLEEP_DURATION


echo -e $COLOR_BLUE"Installing openni2-launch..."$COLOR_RESET
printf 'y\n' | sudo apt-get install ros-$ROS_DISTRO-openni2-launch >> log.txt
if [ $? -eq 0 ]; then
  OPENNI2_LAUNCH_FAIL=0
  echo -e $COLOR_GREEN"Installed openni2-launch successfully!"$COLOR_RESET
else
  echo -e $COLOR_RED"Failed to install openni2-launch..."$COLOR_RESET
  OPENNI2_LAUNCH_FAIL=1
  ROS_DEPS_FAIL=1
fi
echo -e $COLOR_CYAN"**************************************"$COLOR_RESET
sleep $SLEEP_DURATION


echo -e $COLOR_CYAN"**************************************"$COLOR_RESET
echo -e $COLOR_CYAN"**************************************"$COLOR_RESET

if [ $ROS_DEPS_FAIL -eq 1 ]; then
  echo -e $COLOR_RED"Failed to install some packages..."$COLOR_RESET
else
  echo -e $COLOR_GREEN"All ros packages were installed successfully!"$COLOR_RESET
fi

echo -e $COLOR_BLUE"==== Ros packages installation summary ===="$COLOR_RESET
if [ $CATKIN_FAIL -eq 1 ]; then echo -e $COLOR_RED"* catkin (FAIL)"$COLOR_RESET; else echo -e $COLOR_GREEN"* catkin (SUCCESS)"$COLOR_RESET; fi
if [ $RVIZ_VIZUAL_TOOLS_FAIL -eq 1 ]; then echo -e $COLOR_RED"* rviz-visual-tools (FAIL)"$COLOR_RESET; else echo -e $COLOR_GREEN"* rviz-visual-tools (SUCCESS)"$COLOR_RESET; fi
if [ $OPENNI_LAUNCH_FAIL -eq 1 ]; then echo -e $COLOR_RED"* openni-launch (FAIL)"$COLOR_RESET; else echo -e $COLOR_GREEN"* openni-launch (SUCCESS)"$COLOR_RESET; fi
if [ $FREENECT_LAUNCH_FAIL -eq 1 ]; then echo -e $COLOR_RED"* freenect-launch (FAIL)"$COLOR_RESET; else echo -e $COLOR_GREEN"* freenect-launch (SUCCESS)"$COLOR_RESET; fi
if [ $OPENNI2_LAUNCH_FAIL -eq 1 ]; then echo -e $COLOR_RED"* openni2-launch (FAIL)"$COLOR_RESET; else echo -e $COLOR_GREEN"* openni2-launch (SUCCESS)"$COLOR_RESET; fi

sleep 4
