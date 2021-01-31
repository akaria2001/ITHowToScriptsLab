#!/bin/sh
for f in `lxc list | grep -i Cent | awk '{print $2}'` ; do snmpget -v2c -c Liverpool1 $f .1.3.6.1.2.1.1.5.0 ; done
