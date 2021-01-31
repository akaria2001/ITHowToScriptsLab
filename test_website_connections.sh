#!/bin/sh
for f in `lxc list | grep -i CentOS7-web | awk '{print $2}'` ; do curl $f ; done
