#!/bin/bash
#
source=$1
dest="/tmp/backups"

mkdir -p $dest

if [ -d "$source" ]; then
	filename=$(basename $source)
	tar -czf $dest/${filename}_$(date +%F).tar.gz $source
	echo "Back up created $dest"
else
	echo "Directory not found"
fi

