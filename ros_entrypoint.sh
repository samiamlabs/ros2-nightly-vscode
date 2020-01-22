#!/bin/bash
set -e

# setup ros2 environment
source "$ROS2_INSTALL/setup.sh"

file="$OVERLAY_WS/install/setup.sh"
if [ -f "$file" ]
then
  source "$file"
fi

exec "$@"