## ROS2 nightly Dev Container for VSCode

### Setup

Clone this repo using `--recurse-submodules` if there are any on the selected branch that you want to include.

Open this repo as a "folder in container" using the Remote - Containers extension (ms-vscode-remote.remote-containers) for VSCode.

You currently need to run the script `install_connext.bash` to install the apt packages for connext before building any ros messages.

Autocomplete, go to definition (etc..) for the ros2 python packages should work out of the box :)

### TODO

* Make sure debugging for Python works
* Add support for c++ intellisense, debugging and so on
