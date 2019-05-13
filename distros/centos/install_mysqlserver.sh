#!/bin/bash
echo ""
echo "################################"
echo "   Adding MariaDb 10.4 Repo     "
echo "################################"
echo ""

cat >/etc/yum.repos.d/MariaDB.repo<<EOF 
[mariadb]
name = MariaDB
baseurl = http://yum.mariadb.org/10.4/centos7-amd64
gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
gpgcheck=1
EOF

yum -y update

echo ""
echo "Configuring MariaDB Server Service"
echo ""
systemctl enable mariadb
echo "mariadb service enabled!"
systemctl start mariadb
echo "mariadb service started!"

# THIS RAND PASSWORD DOES NOT CURRENTLY PASS BACK THOUGH TO MASTER SCRIPT .\centos_setup.sh?!
MySQLPwd=$(openssl rand -base64 25)

SECURE_MYSQL=$(expect -c "
spawn mysql_secure_installation
expect \"Enter current password for root (enter for none):\"
send \"$MySQLPwd\r\"
expect \"Change the root password?\"
send \"n\r\"
expect \"Remove anonymous users?\"
send \"y\r\"
expect \"Disallow root login remotely?\"
send \"y\r\"
expect \"Remove test database and access to it?\"
send \"y\r\"
expect \"Reload privilege tables now?\"
send \"y\r\"
expect eof
")
echo "mysql_secure_installation completed!"
