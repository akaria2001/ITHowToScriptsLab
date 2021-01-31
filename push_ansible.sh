#!/bin/sh
clear
printf "Ansible is now going to start its work\n";
printf "Ansible will copy the configuration files to /srv\n";
cp -auv /usr/local/bin/srv_files/* /srv/.
generate_ansible_configuration.sh
printf "Ansible will now push out configuration to the Containers\n";
printf "Firewalld to be installed on all containers\n";
printf "Apache to be installed on Web Server containers\n";
printf "MariaDB to be installed on DB Server containers\n";
printf "Emacs-nox to be installed on all containers\n";
printf "Net-SNMP to be installed on all containers\n";
printf "Which to be installed on all containers\n";
ansible-playbook /usr/local/bin/verify-firewalld.yml
ansible-playbook /usr/local/bin/verify-apache.yml
ansible-playbook /usr/local/bin/verify-mariadb.yml
ansible-playbook /usr/local/bin/verify-snmpd.yml
ansible-playbook /usr/local/bin/verify-packages.yml


