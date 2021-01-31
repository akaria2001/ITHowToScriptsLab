#!/bin/sh
# Script to check status of SSH trusts

clear;
sleep 1;

# Get list of hosts we will be querying via SSH trusts
HOSTS=$(cat /usr/local/bin/inventory.txt | grep -v ^#)

# Check each host
for LINE in $HOSTS; do

HOST=$(echo $LINE | awk -F, '{print $1}')
USER="root"

# Check host is up, if down ignore otherwise check SSL trust
    if ping -c 1 $HOST > /dev/null 2>&1; then
        if slogin $USER\@$HOST 'cat /etc/hosts' >> /dev/null ; then
            printf "SSL Trust for $HOST was successful\n";
        else
            printf "SSL Trust for $HOST failed\n";
	fi
    fi
done

sleep 2
