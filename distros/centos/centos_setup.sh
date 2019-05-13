#!/bin/bash
red='\e[0;31m'

echo "Checking SELinux Status"
if [ "$(getenforce)" == "Enforcing" ]; then 
echo -e "\n${red}Error Detected..."
echo "SELinux is currently: Enforcing"
sed -i "s/SELINUX=enforcing/SELINUX=Permissive/" /etc/selinux/config
Sleep 1
echo "SELinux has been configured to: Permissive"
echo "Reboot Required... Please then re-run setup.sh!"
echo "Press Enter to Reboot Server"
read DUMMY
reboot
elif [ "$(getenforce)" == "Permissive" ]; then
echo "SELinux Correctly Configured!"
fi

echo ""
echo "################################"
echo "  Disabling firewalld Service   "
echo "################################"
echo ""
systemctl stop firewalld.service
systemctl disable firewalld.service

echo ""
echo "################################"
echo " Updating Local System Packages "
echo "################################"
echo ""
yum -y update
yum -y install yum-utils wget expect

bash /tmp/smoonlee-demorepo-1e58d2e/distros/centos/centos_setup_webservice.sh
bash /tmp/smoonlee-demorepo-1e58d2e/distros/centos/centos_setup_mailservice.sh

echo "Root Admin Account:"
echo " Username: Root"
echo "Password: $MySQLPwd"

