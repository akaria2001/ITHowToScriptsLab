#!/bin/sh
printf "Removing Jumpbook machine user accounts\n";
ansible-playbook verify-user-remove-jmp.yml
printf "Removing Production Server user accounts\n";
ansible-playbook verify-user-remove-prod.yml


