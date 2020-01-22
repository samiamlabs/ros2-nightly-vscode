FROM osrf/ros2:nightly

# install utility packages
RUN apt-get update && apt-get install -y \
  curl \
  wget \
  vim \
  less \
  ranger \
  tmux \
  htop \
  tig \
  gdb \
  && rm -rf /var/likb/apt/lists/*

ENV ROS2_INSTALL /opt/ros/$ROS_DISTRO

ENV OVERLAY_WS /opt/overlay_ws
RUN mkdir -p $OVERLAY_WS/src

COPY . $OVERLAY_WS/src

# NOTE[sam]: this will not build without connext, which is not easily installed with apt-get in dockerfile
# build package source
# ARG CMAKE_BUILD_TYPE=Debug
# WORKDIR $OVERLAY_WS
# RUN . $ROS2_INSTALL/setup.sh && \
#      colcon build \
#       --symlink-install \
#       --merge-install \
#       --cmake-args \
#         -DCMAKE_BUILD_TYPE=$CMAKE_BUILD_TYPE

RUN echo "source $ROS2_INSTALL/setup.bash" >> $HOME/.bashrc
RUN echo "source $OVERLAY_WS/install/setup.bash" >> $HOME/.bashrc

# source overlay workspace from entrypoint if available
COPY ros_entrypoint.sh /
