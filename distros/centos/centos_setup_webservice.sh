echo ""
echo "################################"
echo "   Adding PHP-7.3 Remi Repo     "
echo "################################"
echo ""
wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
wget http://rpms.remirepo.net/enterprise/remi-release-7.rpm
rpm -Uvh remi-release-7.rpm epel-release-latest-7.noarch.rpm
yum-config-manager --enable remi-php73
yum -y update

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
echo "################################"
echo " Installing httpd, php packages "
echo "################################"
echo ""
yum -y install ntp httpd mod_ssl mariadb-server php php-common
yum -y --enablerepo=remi install phpmyadmin

echo ""
echo "Configuring httpd Service"
echo ""
# https://www.howtoforge.com/tutorial/perfect-server-centos-7-apache-mysql-php-pureftpd-postfix-dovecot-and-ispconfig/
echo "RequestHeader unset Proxy early" >> /etc/httpd/conf/httpd.conf
systemctl enable httpd
echo "httpd service enabled!"
systemctl start httpd
echo "httpd service started!"

echo ""
echo "Configuring MariaDB Server Service"
echo ""
systemctl enable mariadb
echo "mariadb service enabled!"
systemctl start mariadb
echo "mariadb service started!"

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
