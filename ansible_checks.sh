#!/bin/sh
# Amit Karia www.it-howto.co.uk
ansible appservers -m shell -a 'netstat -apn | grep ^tcp'
ansible dbservers -m shell -a 'netstat -apn | grep ^tcp'
ansible webservers -m shell -a 'netstat -apn | grep ^tcp'
sleep 10;
