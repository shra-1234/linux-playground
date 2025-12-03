#!/bin/bash
#
cpu=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
echo "CPU Usage: $cpu%"
ram=$(free | grep Mem | awk '{print ($3/$2)*100}')
echo "Ram usage : $ram%"

disk=$(df -h / | grep '/' | awk '{print $5}' |sed 's/%//')
echo "Disk usage : $disk%"

echo "-------------------------------------"
cpu_int=${cpu%.*}
ram_int=${ram%.*}
disk_int=${disk%.*}
if (( cpu_int > 80 )); then
	echo "High cpu usage!!"
fi
if (( ram_int  > 80 )); then
	echo "High ram usage!!"
fi
if (( disk_int > 80 ));then
       echo "High disk storage!!"
fi

	
