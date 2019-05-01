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

# Docker Container
DockerContainer=/.dockerenv
if [ -f $DockerContainer ]; then
# https://unix.stackexchange.com/questions/432816/grab-id-of-os-from-etc-os-release
echo ""
echo "Running in a Docker Container"

echo ""
echo "Launching... Docker Setup Script"
/bin/bash ./distros/docker/docker_setup.sh

# Debian/Ubuntu 

# CentOS/RHEL
