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
echo $PRETTY_NAME
apt update && apt upgrade -y

elif [ $ID = 'centos' ]; then
echo $PRETTY_NAME
echo ""
yum update -y
fi
