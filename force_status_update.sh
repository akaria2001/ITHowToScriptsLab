#!/bin/sh
# www.it-howto.co.uk
ansible-playbook verify-files-remove.yml
ansible-playbook verify-restart-rhsmcertd.yml
