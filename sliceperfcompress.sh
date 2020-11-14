#!/bin/bash


#check if Gig or more. If more than a Gig remove tar files"

size=$(du -hc -d 0 /opt/sliceup/stats | grep total | grep G | sed 's/[[:blank:]]//g')


if [ -n "$size" ]; then

	rm -f /opt/sliceup/stats/*.gz
	rm -f /opt/sliceup/stats/*.stat
fi


#compress Log files every day

day=$(date +%b%d_%H%M_%S)
gzfile=$(echo "$day.tar.gz")

tar -vczf /opt/sliceup/stats/$gzfile /opt/sliceup/stats/top*.*
rm -f /opt/sliceup/stats/top*.*

sleep 86400
