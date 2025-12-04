#!/bin/bash

SERVICES=("nginx" "docker" "shh")
#creating an array

LOGFILE="/tmp/service_status.log"
#storing location of result

echo "Service check -$(date)"> $LOGFILE
#print date 
#
for s in "${SERVICES[@]}"; do
	service $s status > /dev/null 2>&1
	#check if service is active or not
	#2>&1 send error and o/p to black hole
	#
	if [ $? -eq 0 ]; then
		echo "$s : Running" | tee -a $LOGFILE
	else
		echo "$s : NOT Running" | tee -a $LOGFILE
	fi
done

