# Script Name: Demo Installation Script
# Author: Simon Lee
# Date: May 2019

# Clear Screen
if [ -f /usr/bin/clear]; then
  /usr/bin/clear
else
  clear
fi

# Check User Privileges
# https://askubuntu.com/questions/15853/how-can-a-script-check-if-its-being-run-as-root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
elif [[ $EUID -eq 0 ]]; then
   echo -e "Session Running as \e[36mROOT\e[0m"
fi

#!/bin/bash
echo "#############################################"
echo "#                                           #"
echo "#        GitHub : Demo Repository           #"
echo "#   Query Operating System Configuration    #"
echo "#                                           #"
echo "#############################################"

# Check Network Connectivity
echo "Checking Network Connectivity"
if ! ping -q -c 3 www.ispconfig.org > /dev/null 2>&1; then
	echo -e "${red}Error: Could not reach www.ispconfig.org, please check your internet connection and run this script again.${NC}" >&2
	exit 1;
fi

echo -e "[${green}DONE${NC}]\n"

# Check for already installed ISPConfig version
if [ -f /usr/local/ispconfig/interface/lib/config.inc.php ]; then
	echo -e "${red}Error: ISPConfig is already installed, cannot go on.${NC}" >&2
	exit 1
fi

# Those lines are for logging purposes
exec > >(tee -i /var/log/ispconfig_setup.log)
exec 2>&1

# Check Operating System Type
. /etc/os-release

# Docker Container
if [ -f /.dockerenv ]; then
# https://unix.stackexchange.com/questions/432816/grab-id-of-os-from-etc-os-release
echo ""
echo "Running in a Docker Container"

echo ""
echo "Launching... Docker Setup Script"
/bin/bash ./distros/docker/docker_setup.sh
fi

# Debian/Ubuntu 
if [ $ID = 'ubuntu' ];then
echo ""
echo "Launching... Ubuntu Setup Script"
/bin/bash ./distros/ubuntu/ubuntu_setup.sh
fi

# CentOS/RHEL
if [ $ID = 'centos' ];then
echo ""
echo "Launching... CentOS Setup Script"
/bin/bash ./distros/centos/centos_setup.sh
fi
