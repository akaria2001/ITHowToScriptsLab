#!/bin/sh
generate_ansible_configuration.sh
printf "Ansible will now push out configuration to the Containers\n";
printf "Apache to be installed on Web Server containers\n";
printf "MariaDB to be installed on DB Server containers\n";
printf "Emacs-nox to be installed on all containers\n";
ansible webservers -m yum -a 'name=httpd  state=present update_cache=true'
ansible webservers -m shell -a 'systemctl enable --now httpd'
ansible dbservers -m yum -a 'name=mariadb-server  state=present update_cache=true'
ansible dbservers -m shell -a 'systemctl enable --now mariadb'
ansible all -m yum -a 'name=emacs-nox  state=present update_cache=true'
/usr/local/bin/ansible_checks.sh
