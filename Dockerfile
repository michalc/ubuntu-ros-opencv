FROM dorowu/ubuntu-desktop-lxde-vnc:bionic-lxqt

RUN \
	apt-get update && \
	apt-get install -y \
		dirmngr && \
	sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list' && \
	apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654 && \
	apt-get update && \
	apt-get install -y \
		ros-melodic-desktop-full \
		python-opencv \
		python-scipy && \
	rm -rf /var/lib/apt/lists/*

RUN \
	echo "source /opt/ros/melodic/setup.bash" >> /root/.bashrc && \
	rosdep init && \
	rosdep update
