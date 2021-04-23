#!/bin/sh
printf "Creating Jumpbook machine user accounts\n";
ansible-playbook verify-user-create-jmp.yml
printf "Creating Production Server user accounts\n";
ansible-playbook verify-user-create-prod.yml


