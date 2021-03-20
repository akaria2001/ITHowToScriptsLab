#!/bin/bash
#
# LAB Setup Script for Linux Servers
# Amit Karia - www.it-howto.co.uk

INPUT=/tmp/menu.sh.$$

#
# Purpose - display output using msgbox
#  $1 -> set msgbox height
#  $2 -> set msgbox width
#  $3 -> set msgbox title
#
function display_output(){
        local h=${1-30}                 # box height default 10
        local w=${2-70}                 # box width default 41
        local t=${3-Output}     # box title
        dialog --backtitle "LAB Linux Server Setup" --title "${t}" --clear --msgbox "$(<$OUTPUT)" ${h} ${w}
}
#
# Purpose - Configure GUI
#
function configure_gui(){
    systemctl set-default runlevel5.target
    display_output 6 60 "GUI has been enabled"
}

#
# Purpose - Configure CLI
#
function configure_cli(){
    systemctl set-default runlevel3.target
    display_output 6 60 "CLI has been enabled"
}

#
# Purpose - Configure Network Settings
#
function configure_ntu(){
    display_output 6 60 "Configure Network Settings"
    nmtui
}

#
# Purpose - Display Containers Lab
#
function configure_display(){
    display_output 6 60 "Display CentOS7 LXC Container Lab"
    time /usr/local/bin/display_lab.sh
}

#
# Purpose - Configure Start Up Lab Farm
#
function configure_startup(){
    display_output 6 60 "Start Up Lab Farm"
    /usr/local/bin/StartupFarm.sh
}

#
# Purpose - Configure Shutdown Lab Farm
#
function configure_shutdown(){
    display_output 6 60 "Shutdown Lab Farm"
    /usr/local/bin/ShutdownFarm.sh
}

#
# Purpose - Configure Spin Up Lab
#
function configure_spinup(){
    display_output 6 60 "Spin Up Lab"
    /usr/local/bin/spinUpCentOS7Lab.sh
}

#
# Purpose - Configure Destroy Lab
#
function configure_destroy(){
    display_output 6 60 "Destroy Lab"
    /usr/local/bin/destroyLab.sh
}

#
# Purpose - Generate Self Signed SSL Certificate
#
function configure_selfsigned(){
    display_output 6 60 "Generate Self Signed SSL Certificate"
    /usr/local/bin/gen_cert.sh
}

#
# Purpose - Generate SSL Trusts to containers for Ansible
#
function configure_genssltrust(){
    display_output 6 70 "Generate SSL Trusts to containers for Ansible"
    /usr/local/bin/generate_ssl_trust.sh
}

#
# Purpose - Test SSL Trusts to containers for Ansible
#
function configure_testssltrust(){
    display_output 6 70 "Test SSL Trusts to containers for Ansible"
    /usr/local/bin/test_ssl_trust.sh
}


#
# Purpose - Check Ansible Inventory
#
function configure_ansible_inventory(){
    display_output 6 70 "Check Ansible Inventory"
    /usr/local/bin/check_ansible_inventory.sh 
}


#
# Purpose - Check Container Setup
#
function configure_ansible_check(){
    display_output 6 70 "Check Ansible Container Setup"
    /usr/local/bin/ansible_checks.sh
}

#
# Purpose - Update OS
#
function configure_update_os(){
    display_output 6 70 "Update Container OS"
    /usr/local/bin/update_os_ansible.sh
}

#
# Purpose - Reboot OS
#
function configure_reboot_os(){
    display_output 6 70 "Reboot OS"
    /usr/local/bin/reboot_os.sh
}

#
# Purpose - Shutdown OS
#
function configure_shutdown_os(){
    display_output 6 70 "Shutdown OS"
    /usr/local/bin/shutdown_os.sh
}

#
# set infinite loop
#
while true
do

### display main menu ###
dialog --clear  --help-button --backtitle "LAB Linux Server Setup" \
--title "[ M A I N - M E N U ]" \
--menu "You can use the UP/DOWN arrow keys, the first \n\
letter of the choice as a hot key, or the \n\
number keys 1-9 to choose an option.\n\
Choose the TASK" 32 75 16 \
GUI "Use GUI" \
CLI "Use CLI" \
NTU "Configure network settings" \
DISPLAY_LAB "Display CentOS7 Container Lab" \
START_FARM "Startup LAB Farm" \
STOP_FARM "Shutdown LAB Farm" \
SPINUP "Spinup Lab" \
DESTROY "Destroy Lab" \
GEN_SSL_CERT "Generate Self Signed SSL Certificate" \
GEN_SSL_TRUST "Generate SSL Trusts to containers for Ansible" \
TEST_SSL_TRUST "Test SSL Trusts to containers for Ansible" \
DISPLAY_ANSIBLE "Display Ansible Inventory" \
CHECK_ANSIBLE "Display Ansible Configuration on containers" \
UPDATE_OS "Update Container OS using Yum" \
REBOOT_OS "Reboot OS" \
SHUTDOWN_OS "Shutdown OS" \
Exit "Exit to the shell" 2>"${INPUT}"

menuitem=$(<"${INPUT}")

menuitem=$(<"${INPUT}")

# make decsion
case $menuitem in
    GUI) configure_gui;;
    CLI) configure_cli;;
    NTU) configure_ntu;;
    DISPLAY_LAB) configure_display;;
    START_FARM) configure_startup;;
    STOP_FARM) configure_shutdown;;
    SPINUP) configure_spinup;;
    DESTROY) configure_destroy;;
    GEN_SSL_CERT) configure_selfsigned;;
    GEN_SSL_TRUST) configure_genssltrust;;
    TEST_SSL_TRUST) configure_testssltrust;;
    DISPLAY_ANSIBLE) configure_ansible_inventory;;
    CHECK_ANSIBLE) configure_ansible_check;;
    UPDATE_OS) configure_update_os;;
    REBOOT_OS) configure_reboot_os;;
    SHUTDOWN_OS) configure_shutdown_os;;
    Exit) echo "Bye"; break;;
esac

done

clear

printf "Cleanup old menu items from /tmp directory\n\n"
rm -rfv /tmp/menu.sh.{1..30000}
rm -rfv /tmp/menu.sh.{30000..60000}
sleep 2

clear
