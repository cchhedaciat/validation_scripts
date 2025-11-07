#!/bin/bash

grep -q rhgb /proc/cmdline
if [ $? -ne 0 ]
then 
	echo "Disable Graphical Boot..PASS"
else
	echo "Disable Graphical Boot..FAIL"
fi

