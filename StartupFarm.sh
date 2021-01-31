#!/bin/bash
for f in `cat /usr/local/bin/inventory.txt` ; do lxc start $f ; done
lxc list
sleep 2
/usr/local/bin/display_lab.sh
sleep 2
