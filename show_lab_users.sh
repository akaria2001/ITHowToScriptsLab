#!/bin/sh
# Amit Karia www.it-howto.co.uk
clear
printf "Checking user accounts on all hosts\n";
for f in `cat /usr/local/bin/inventory.txt` ; do printf "\nChecking host $f\n\n" ; ssh $f "cat /etc/passwd | grep -v /bin/false | grep -v /sbin/nologin" ; printf "\n\nchecking wheel group on $f\n\n" ; ssh $f "grep -i wheel /etc/group" ; done
