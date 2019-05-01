# Script Name: Demo Installation Script
# Author: Simon Lee
# Date: May 2019

#!/bin/bash
# Check Operating System Type

# Docker Container
DockerContainer=/.dockerenv
if [ -f $DockerContainer ]; then
# https://unix.stackexchange.com/questions/432816/grab-id-of-os-from-etc-os-release
echo "Running in a Docker Container"

# Print Operating Sytem Type
. /etc/os-release
echo "Operating System: $VERSION"
fi

# Debian/Ubuntu 

# CentOS/RHEL
