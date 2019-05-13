#!/bin/bash
echo ""
echo "################################"
echo " Installing httpd, php packages "
echo "################################"
echo ""
yum -y install httpd mod_ssl mariadb-server php php-common

echo ""
echo "Configuring httpd Service"
echo ""
# https://www.howtoforge.com/tutorial/perfect-server-centos-7-apache-mysql-php-pureftpd-postfix-dovecot-and-ispconfig/
echo "RequestHeader unset Proxy early" >> /etc/httpd/conf/httpd.conf
systemctl enable httpd
echo "httpd service enabled!"
systemctl start httpd
echo "httpd service started!"