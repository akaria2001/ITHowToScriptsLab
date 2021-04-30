#!/bin/sh
printf "Powering down Jumpstations\n"
ansible jumpstations -a "systemctl poweroff"
sleep 10
ansible production -a "systemctl poweroff"
sleep 60
printf "Powering down this Red Hat Ansible server in 10 seconds\n"
sleep 10
systemctl poweroff
