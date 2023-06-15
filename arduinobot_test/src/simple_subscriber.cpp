#include <ros/ros.h>
#include <std_msgs/String.h>

void msgCallback(const std_msgs::String::ConstPtr msg)
{
    ROS_INFO("I heard %s", msg->data.c_str());
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "listener");
    ros::NodeHandle nh;
    ros::Subscriber sub = nh.subscribe<std_msgs::String>("chatter", 10, msgCallback);
    ros::spin();
}
