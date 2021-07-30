#! /bin/bash

if [ -f /etc/sysconfig/rhn/systemid ] ; then
	SAT_URL=$(grep ^serverURL= /etc/sysconfig/rhn/up2date |awk -F/ '{print $3}')
	echo $SAT_URL
elif [ -f /etc/rhsm/rhsm.conf ] ; then
	SAT_URL=$(grep ^hostname /etc/rhsm/rhsm.conf |awk -F= '{print $2}' | sed 's/ //g')
	echo $SAT_URL
else
	echo "Not found"
fi
