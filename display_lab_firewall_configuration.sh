#!/bin/sh
for f in `lxc list | grep -i CentOS | awk '{print $2}'` ; do printf "Checking container $f\n" ; lxc exec $f -- firewall-cmd --list-all ; done
