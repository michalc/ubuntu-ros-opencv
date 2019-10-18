# ubuntu-ros-opencv

Docker image with ROS and OpenCV, accessible via a web browser. Not very tested, runs as root: probably insecure.


## Building

```bash
docker build . -t ubuntu-ros-opencv
```


## Running

This maps the current directory to /root/host in the docker container.

```bash
docker run --rm -p 6080:80 -v /dev/shm:/dev/shm -v "$PWD":/root/host --name ubuntu-ros-opencv ubuntu-ros-opencv
```

Then go to http://localhost:6080/ to load up the desktop running in the docker container.


## Executing shell commands in the docker container from the host shell

```bash
docker exec -it ubuntu-ros-opencv bash
source /root/.bashrc
# Any commands
```


source devel/setup.bash
roslaunch ivr_lab spawn.launch
rostopic pub -1 /robot/joint1_position_controller/command std_msgs/Float64 "data: 1.0"

rosrun ivr_lab image_processing.py
