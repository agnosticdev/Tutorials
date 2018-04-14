# -*- coding: utf-8 -*-
#
# Python example of a function to use along side a unit test.
#

import os, sys


def keyword_occurrences_any(keywords_list, logfile_str):

	occurrences = 0
	logfile_lines = logfile_str.split('\n')

	for line in logfile_lines:
		if any(key in line for key in keywords_list):
			occurrences += 1

	return occurrences

def keyword_occurrences_for(keywords_list, logfile_str):

	occurrences = 0
	logfile_lines = logfile_str.split('\n')

	for line in logfile_lines:
		line_split = line.split(" ")
		for word in line_split:
			if word in keywords_list:
				occurrences += 1

	return occurrences


log_file = """
		   systemd[1]: Starting python Network Manager Script Dispatcher Service...
		   systemd[1]: Started Network Manager Script Dispatcher Service.
		   nm-dispatcher: req:1 'dhcp4-change' [enp4s0]: new request (1 scripts)
		   nm-dispatcher: req:1 'dhcp4-change' [enp4s0]: start running ordered scripts...
		   systemd[1]: Starting Clean python session files...
		   systemd[1]: Started Clean python session files.
		   CRON[8283]: (agnosticdev) CMD (cd / && run-parts --report /etc/cron.hourly)
		   """
keywords = ['python', 'error', 'Network', 'failure']
matches = keyword_occurrences_any(keywords, log_file)

print("{0} matches found in the log file".format(matches))

matches = keyword_occurrences_for(keywords, log_file)

print("{0} matches found in the log file".format(matches))