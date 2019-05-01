#!/bin/bash
echo "#############################################"
echo "#                                           #"
echo "#        GitHub : Demo Repository           #"
echo "#      Docker Inital Setup Script 2019      #"
echo "#                                           #"
echo "#############################################"

# Print Operating Sytem Type
. /etc/os-release
if [ $ID = 'ubuntu' ]; then
echo $VERSION
echo "I'm Ubuntu"
elif [ $ID = 'centos' ]; then
echo $VERSION
echo "I'm CENTOS/RHEL"
fi
