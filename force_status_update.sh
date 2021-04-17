#!/bin/sh
ansible all -a "rm -f /var/lib/rhsm/packages/packages.json"
ansible all -a "systemctl restart rhsmcertd.service"
