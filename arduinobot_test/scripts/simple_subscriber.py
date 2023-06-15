#!/usr/bin/env python3

import rospy
from std_msgs.msg import String


def msgCallback(msg: String):
    rospy.loginfo("I heard %s", msg.data)


def main():
    rospy.init_node("listener", anonymous=True)
    rospy.Subscriber("chatter", String, msgCallback)
    rospy.spin()


if __name__ == "__main__":
    main()
