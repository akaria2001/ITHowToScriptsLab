#!/bin/sh
sudo lxc list | grep -i CentOS | awk '{print $2}' 2>&1 | tee /usr/local/bin/inventory.txt
