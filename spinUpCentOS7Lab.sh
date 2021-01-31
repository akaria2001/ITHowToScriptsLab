#!/bin/sh
FIRST=1
LAST=2
clear
printf "Spinning up standard Linux containers\n"
for f in `seq $FIRST $LAST`; do lxc launch CentOS7-template CentOS7-app-$f ; done
printf "Spinning up web server Linux containers\n"
for f in `seq $FIRST $LAST`; do lxc launch CentOS7-template CentOS7-web-$f ; done
printf "Spinning up db server Linux containers\n"
for f in `seq $FIRST $LAST`; do lxc launch CentOS7-template CentOS7-dbs-$f ; done
echo "" 2>&1 | tee /usr/local/bin/inventory.txt
sleep 30
lxc list | grep -i CentOS | awk '{print $2}' 2>&1 | tee /usr/local/bin/inventory.txt
cat /usr/local/bin/hosts.seed | tee /etc/hosts
lxc list | grep -i CentOS | awk '{print $6"  "$2"  "$2".local"}' 2>&1 | tee -a /etc/hosts
printf "We now need to generate SSL trusts to the Containers for the purposes of Ansible integration\n";
/usr/local/bin/generate_ssl_trust.sh
clear
sleep 2
/usr/local/bin/push_ansible.sh
printf "Testing SNMP Connectivty to Lab\n";
/usr/local/bin/test_snmp_connections.sh
printf "\n\nTesting Website Connectivty to web server containers\n";
test_website_connections.sh
