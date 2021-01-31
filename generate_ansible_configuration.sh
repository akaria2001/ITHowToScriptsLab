#!/bin/sh

cat /usr/local/bin/ansible.hosts.seed 2>&1 | tee /etc/ansible/hosts

printf "[appservers]\n"  | tee -a /etc/ansible/hosts
lxc list | grep -i CentOS7-app | awk '{print $2}' | tee -a /etc/ansible/hosts
printf "\n";

printf "[dbservers]\n"  | tee -a /etc/ansible/hosts
lxc list | grep -i CentOS7-dbs | awk '{print $2}' | tee -a /etc/ansible/hosts
printf "\n";

printf "[webservers]\n"  | tee -a /etc/ansible/hosts
lxc list | grep -i CentOS7-web | awk '{print $2}' | tee -a /etc/ansible/hosts
printf "\n";
