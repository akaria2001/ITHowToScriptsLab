#!/bin/sh
# www.it-howto.co.uk
ansible-playbook verify-files-remove.yml
ansible all -a "systemctl restart rhsmcertd.service"
