FROM ros:melodic

RUN apt-get update && apt-get install -y \
  git \
  python-catkin-tools \
  bash-completion \
  ros-melodic-rviz \
  ros-melodic-costmap-queue \
  ros-melodic-dwb-critics \
  python-websocket \
  ros-melodic-robot-localization \
  ros-melodic-fake-localization \
  ros-melodic-sbpl-lattice-planner \
  ros-melodic-nav-core-adapter \
  ros-melodic-controller-manager \
  ros-melodic-nav-core2 \
  ros-melodic-base-local-planner \
  ros-melodic-map-server \
  ros-melodic-dwb-local-planner \
  ros-melodic-dwb-plugins \
  ros-melodic-diff-drive-controller \
  ros-melodic-nav-2d-utils \
  ros-melodic-position-controllers \
  ros-melodic-joint-state-controller \
  ros-melodic-joint-state-publisher \
  ros-melodic-robot-state-publisher \
  ros-melodic-move-base-msgs \
  ros-melodic-gazebo-ros \
  ros-melodic-move-base \
  ros-melodic-nav-grid-iterators \
  ros-melodic-gazebo-ros-control \
  ros-melodic-nav-2d-msgs \
  ros-melodic-amcl \
  ros-melodic-xacro \
  ros-melodic-hector-mapping \
  ros-melodic-rqt-robot-steering \
  # Additional, not installed by rosdep
  ros-melodic-robot-pose-ekf \
  ros-melodic-gazebo-plugins \
  && rm -rf /var/lib/apt/lists/*

SHELL ["/bin/bash", "-c"]

RUN mkdir -p /opt/workspace/src/

COPY ./custom_mir_robot/ /opt/workspace/src/custom_mir_robot

RUN source /opt/ros/melodic/setup.bash \
  && cd /opt/workspace/src \
  && catkin init \
  && git clone -b melodic https://github.com/dfki-ric/mir_robot.git \
  && git clone https://github.com/uos/rospy_message_converter.git \
  && cd /opt/workspace/ \
  && catkin build