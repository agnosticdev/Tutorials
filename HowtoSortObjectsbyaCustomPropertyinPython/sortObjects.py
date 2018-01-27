#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
import os, sys
from datetime import datetime, date

# Custom object to hold article date and time
class customObject():

	def __init__(self, title, date):
		self.title = title
		self.date = datetime.strptime(date, "%B %d, %Y")


def main():

	obj3 = customObject("TLS 1.3 - Better, Stronger, Faster", "January 6, 2018")
	obj4 = customObject("User Interface Testing with Swift and XCTest", "December 10, 2017")
	obj2 = customObject("How to Use Python List Comprehensions", "December 2, 2017")
	obj1 = customObject("Attending WWDC 2017 - Predictions Answered", "June 13, 2017")
	obj5 = customObject("Swift Network Testing - Automate XCTest with Python", "November 26, 2017")

	print("---------------------------------------------------------------")

	# Display the dates and titles
	print("Unsorted Date from obj1: " +str(obj1.date) + " with title: " +obj1.title)
	print("Unsorted Date from obj2: " +str(obj2.date) + " with title: " +obj2.title)
	print("Unsorted Date from obj3: " +str(obj3.date) + " with title: " +obj3.title)
	print("Unsorted Date from obj4: " +str(obj4.date) + " with title: " +obj4.title)
	print("Unsorted Date from obj5: " +str(obj5.date) + " with title: " +obj5.title +"\n")

	customObjects = [obj1, obj2, obj3, obj4, obj5]

	# One line sort function method using an inline lambda function lambda x: x.date
	# The value for the key param needs to be a value that identifies the sorting property on the object
	customObjects.sort(key=lambda x: x.date, reverse=True)

	for obj in customObjects:
		print("Sorted Date from obj: " +str(obj.date) + " with title: " +obj.title)

if __name__ == '__main__':
	main()