#!/usr/bin/env python3

import rospy
from std_msgs.msg import String


def main():
    rospy.init_node("simple_publisher_py", anonymous=True)
    pub = rospy.Publisher("chatter", String, queue_size=10)
    rate = rospy.Rate(10)
    counter: int = 0

    while not rospy.is_shutdown():
        pub.publish(f"Hello World {counter}")
        rate.sleep()
        counter += 1


if __name__ == "__main__":
    main()
