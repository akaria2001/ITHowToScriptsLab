#!/bin/sh

printf "Checking DNS queries work\\nn";

for f in `cat /usr/local/bin/inventory.txt` ; do nslookup $f ; done | grep -v 192.168.182.11

printf "Checking DNS reverse queries work - note we do not have a 13!!!\n";

for f in `seq 11 20` ; do nslookup 192.168.182.$f ; done
