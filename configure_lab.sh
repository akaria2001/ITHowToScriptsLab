#!/bin/sh
clear
sleep 1
printf "Creating Lab Users\n\n";
/usr/local/bin/create_lab_users.sh
printf "Displaying Lab Users\n\n";
/usr/local/bin/show_lab_users.sh
ansible-playbook /usr/local/bin/verify-packages.yml
ansible-playbook /usr/local/bin/verify-copy-dns-check.yml

