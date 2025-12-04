#!/bin/bash
#
LOG=$1

errors=$(grep -c -i "error" $LOG)
warning=$(grep -c -i "warning" $LOG)
info=$(grep -c -i "info" $LOG)

echo "Errors :$errors"
echo "Warnings :$warning "
echo "Info :$info"

