#!/bin/bash

VAL=`grep GRUB_TIMEOUT /etc/default/grub|awk -F= '{print $2}'`
if [ $VAL -eq 30 ]
then
	echo "Grub Default Update..PASS"
else
	echo "Grub Default Update..FAIL"
fi


VAL1=`grep "set timeout=" /boot/grub2/grub.cfg|head -1|awk -F= '{print $2}'`
if [ $VAL1 -eq 30 ]
then
	echo "Grub.cfg Update..PASS"
else
	echo "Grub.cfg Update..FAIL"
fi

journalctl -b 0|grep "BOOT_IMAGE"|grep -q single
if [ $? -eq 0 ]
then 
	echo "Single User boot..PASS"
else
	echo "Single User boot..FAIL"
fi

