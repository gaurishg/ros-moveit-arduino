#include <ros/ros.h>
#include <std_msgs/String.h>
#include <sstream>

int main(int argc, char **argv)
{
    ros::init(argc, argv, "simple_publisher_cpp");
    ros::NodeHandle nh;

    auto pub = nh.advertise<std_msgs::String>("chatter", 10);
    auto rate = ros::Rate(10);

    int counter{};
    while (ros::ok())
    {
        std::stringstream ss;
        ss << "Hello world " << counter++;
        std_msgs::String message;
        message.data = ss.str();
        pub.publish(message);
        rate.sleep();
    }
}
