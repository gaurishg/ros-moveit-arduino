FROM osrf/ros:noetic-desktop-full

RUN apt-get update
RUN echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
RUN apt-get install -y vim cmake wget curl unzip tar python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential

RUN rosdep init && rosdep update

RUN apt-get install -y terminator ros-noetic-ros-controllers ros-noetic-gazebo-ros-control ros-noetic-moveit ros-noetic-rosserial ros-noetic-rosserial-arduino ros-noetic-roboticsgroup-upatras-gazebo-plugins ros-noetic-actionlib-tools

RUN apt-get install -y python3-pip

RUN python3 -m pip install flask flask-ask-sdk ask-sdk pre-commit

RUN mkdir tmp/ngrok-download && cd /tmp/ngrok-download && wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz && tar xvzf ngrok-v3-stable-linux-amd64.tgz -C /usr/local/bin

# RUN curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc | sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null && echo "deb https://ngrok-agent.s3.amazonaws.com focal main" | tee /etc/apt/sources.list.d/ngrok.list && apt-get update && apt-get -y install ngrok

WORKDIR /root/arduinobot_ws/
RUN mkdir src
RUN catkin_make
RUN echo "source /root/arduinobot_ws/devel/setup.bash" >> ~/.bashrc

WORKDIR /root/arduinobot_ws/src
