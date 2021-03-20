#!/bin/sh
yum install make -y
yum install gcc -y
yum install kernel-headers -y
yum install "kernel-devel-uname-r == $(uname -r)" -y
yum install epel-release -y
yum install dialog -y
yum install emacs-nox -y
yum install net-tools -y
yum install net-snmp -y
yum install net-snmp-utils -y
yum install ansible -y
yum install bzip -y
