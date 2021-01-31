#!/bin/sh
cat /usr/local/bin/hosts.seed | sudo tee /etc/hosts
lxc list | grep -i CentOS | awk '{print $6"  "$2"  "$2}' 2>&1 | sudo tee -a /etc/hosts
