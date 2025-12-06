#!/bin/bash

read -p "Enter the hostname or IP to test : " target
 
echo "=======Network Debug Report===="
echo "Target: $target"
echo "------------------------------"

echo "1. Check DNS resolution..."
host $target 2>/dev/null
if [ $? -ne 0 ]; then
echo "DNS resolution failed"
else
echo " Dns resolution was a success"
fi

echo "------------------------------"
ping -c 3 $target >/dev/null 2>&1
if [ $? -ne 0 ]; then
echo "Ping failed"
else
echo "Ping successful"
fi
echo "------------------------------"
ports=(22 80 443)

echo " Checking ports"
for p in "${ports[@]}"; do
nc -z -w2 $target $p >/dev/null 2>&1
if [ $? -eq 0 ]; then
echo "Port $p is open"
else
echo "Port $p is closed"
fi
done
echo "-------------------------------"
echo "Report completed."
