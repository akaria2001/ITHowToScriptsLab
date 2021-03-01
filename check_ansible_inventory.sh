#!/bin/sh
# Amit Karia www.it-howto.co.uk
clear
printf "Checking Ansible Inventory\n"
printf "Checking all hosts\n";
ansible all --list-hosts

printf "Checking Web Server hosts\n";
ansible webservers --list-hosts

printf "Checking DB Server hosts\n";
ansible dbservers --list-hosts

printf "Checking App Server hosts\n";
ansible appservers --list-hosts

printf "Please check SSH Trusts to these are setup\n\n";

sleep 7;
