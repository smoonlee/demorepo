#!/bin/bash
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
echo "##########################################"
echo "#      Installing php, phpmyadmin        #"
echo "#     mod_php, mod_fcgi/PHP, PHP-FPM     #"
echo "##########################################"
echo ""

yum -y install php php-devel php-gd php-imap php-ldap php-mysql php-odbc php-pear php-xml php-xmlrpc php-pecl-apc php-mbstring php-mcrypt php-mssql php-snmp php-soap php-tidy curl curl-devel perl-libwww-perl ImageMagick libxml2 libxml2-devel mod_fcgid php-cli httpd-devel php-fpm php-intl php-imagick php-pspell
yum -y --enablerepo=remi install phpmyadmin

echo ""
echo "Configuring PHP-FPM Services"
echo ""
systemctl enable php-fpm.service
echo "php-fpm service enabled!"
systemctl start php-fpm.service
echo "php-fpm service started!"
systemctl restart httpd.service
echo "httpd service restarted!"
