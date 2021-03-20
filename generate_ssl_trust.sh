#!/bin/sh
# Script to generate SSH trusts

clear
sleep 1

# Get list of hosts we will be querying via SSH trusts
HOSTS=$(cat /usr/local/bin/inventory.txt | grep -v ^#)

# Check each host
for LINE in $HOSTS; do

HOST=$(echo $LINE | awk -F, '{print $1}')
USER="root"

# Check host is up, if down ignore otherwise check SSL trust
    if ping -c 1 $HOST > /dev/null 2>&1; then
	ssh-copy-id -o StrictHostKeyChecking=no $USER\@$HOST
    fi
done

sleep 2
printf "Now checking SSH trusts\n";
/usr/local/bin/test_ssl_trust.sh
sleep 2
