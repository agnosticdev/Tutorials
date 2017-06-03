# -*- coding: utf-8 -*-
#
import sys

string = "Hello Agnosticdev, I love Tutorials"
substring = "Agnosticdev"

# Straight forward approach for Python 2.7 and Python 3.6
# Executes the conditional statement when the substring is found
if substring in string:
	print ("Your substring was found!")



# Alternative Approach

# Use the find method in Python 2.7 or Python 3.6
if string.find(substring) is not -1:
	print("Python found the substring!")
else:
	print("Python did NOT find the substring!")