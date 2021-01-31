#!/bin/sh
clear
printf "We will now go ahead and destroy the LXC Container Lab\n"
lxc list | grep -i CentOS | awk '{print $2}' 2>&1 | tee inventory.txt
cat /usr/local/bin/hosts.seed | tee /etc/hosts
lxc list | grep -i CentOS | awk '{print $6"  "$2"  "$2}' 2>&1 | tee -a /etc/hosts
#for f in `cat /usr/local/bin/inventory.txt` ; do lxc stop $f ; done
for f in `cat /usr/local/bin/inventory.txt` ; do lxc delete --force $f ; done
lxc list | grep -i CentOS | awk '{print $2}' 2>&1 | tee /usr/local/bin/inventory.txt
cat /usr/local/bin/hosts.seed | tee /etc/hosts
