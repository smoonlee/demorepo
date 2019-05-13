# Script Name: Demo Installation Script
# Author: Simon Lee
# Date: May 2019

# Clear Screen
if [ -f /usr/bin/clear]; then
  /usr/bin/clear
else
  clear
fi

#!/bin/bash
echo "#############################################"
echo "#                                           #"
echo "#        GitHub : Demo Repository           #"
echo "#   Query Operating System Configuration    #"
echo "#                                           #"
echo "#############################################"

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
