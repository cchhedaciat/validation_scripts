#!/bin/bash

# The lab needs to be updated to either remove rhgb from the boot menu OR update #10 to include --update-bls-cmdline
grep -q rhgb /proc/cmdline
if [ $? -ne 0 ]
then 
	echo "Disable Graphical Boot..PASS"
else
	echo "Disable Graphical Boot..FAIL"
fi

