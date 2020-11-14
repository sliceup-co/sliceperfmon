#!/bin/bash

cpu=$(top -b -n 1 | grep load | sed 's/^.*age://g' | sed 's/,.*//g' | sed 's/ //g')
memtotal=$(free | grep Mem | sed 's/Mem://g' | sed 's/^[t ]*//g' | sed 's/ .*//g' | sed 's/ //g')
memused=$(free | grep Mem | sed 's/Mem://g' | sed 's/^[t ]*//g' | sed 's/^[0-9]*//g' | sed 's/^[t ]*//g' | sed 's/ .*//g')

memper=$(echo "$memused/$memtotal*100" | bc -l)

mempercent=$(printf "%0.2f\n" $memper)

day=$(date +%b%d_%H%M_%S)
file=$(echo "top_$day _CPU%_ $cpu _MEM%_ $mempercent" | sed 's/ //g')

echo "$day,$cpu,$mempercent" >> /opt/sliceup/stats/statrecord.stat

top -b -n 1 | head -n 17 > /opt/sliceup/stats/$file

echo " " >> /opt/sliceup/stats/$file
echo "MEMORY" >> /opt/sliceup/stats/$file
echo " " >> /opt/sliceup/stats/$file

top -b -o %MEM -n 1 | head -n 17 >> /opt/sliceup/stats/$file


sleep 60
