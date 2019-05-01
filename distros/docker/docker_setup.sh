#!/bin/bash

# Clear Screen
if [ -f /usr/bin/clear]; then
  /usr/bin/clear
else
  clear
fi

echo "#############################################"
echo "#                                           #"
echo "#        GitHub : Demo Repository           #"
echo "#   Docker Initial Package & Repo Updates   #"
echo "#                                           #"
echo "#############################################"

# Print Operating Sytem Type
. /etc/os-release
if [ $ID = 'ubuntu' ]; then
echo ""
echo "Operating System: $PRETTY_NAME"
echo ""
apt update && apt upgrade -y
apt -y install apt-utils

elif [ $ID = 'centos' ]; then
echo "Operating System: $PRETTY_NAME"
echo ""
yum update -y
yum -y install yum-utils
fi
