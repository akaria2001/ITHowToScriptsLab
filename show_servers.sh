#!/bin/sh
# Amit Karia www.it-howto.co.uk
clear
printf "Checking Ansible Inventory\n"
printf "Checking all Jumpstations\n";
ansible jumpstations --list-hosts
printf "Checking all Production Servers\n";
ansible production --list-hosts

printf "Checking Lab Connectivity\n"
SERVERS=$(cat /usr/local/bin/inventory.txt)
for HOST in $SERVERS; do
    FAILCOUNT=0
    PASSCOUNT=0
    for count in {1..15}; do
        ping -w 1 -c 1 $HOST > /dev/null 2>&1
        if [[ $? > 0 ]]; then
            FAILCOUNT=$[$FAILCOUNT+1]
        else
            PASSCOUNT=$[$PASSCOUNT+1]
        fi
    done
    
    if [ $FAILCOUNT -gt 11 ]; then
	printf "$HOST\t\t\t ICMP Polls Failed\n"
    else
	printf "$HOST\t\t\t ICMP Polls Succeeded\n"
    fi
done
