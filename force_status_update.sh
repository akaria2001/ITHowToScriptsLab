#!/bin/sh
# www.it-howto.co.uk
ansible-playbook /usr/local/bin/verify-files-remove.yml
ansible-playbook /usr/local/bin/verify-restart-rhsmcertd.yml
