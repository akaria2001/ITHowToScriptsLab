#!/bin/sh
# Amit Karia www.it-howto.co.uk
clear
printf "Checking Ansible Inventory\n"
printf "Checking all hosts\n";
ansible all --list-hosts
printf "Checking all Jumpstations\n";
ansible jumpstations --list-hosts
printf "Checking all Production Servers\n";
ansible production --list-hosts
