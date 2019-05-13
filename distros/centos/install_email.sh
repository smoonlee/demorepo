yum -y install dovecot dovecot-mysql dovecot-pigeonhole

touch /etc/dovecot/dovecot-sql.conf
ln -s /etc/dovecot/dovecot-sql.conf /etc/dovecot-sql.conf
ln -s /etc/dovecot/dovecot.conf /etc/dovecot.conf

systemctl enable dovecot
systemctl start dovecot

yum -y install postfix

systemctl stop sendmail.service
systemctl disable sendmail.service
systemctl enable postfix.service
systemctl restart postfix.service

yum -y install getmail

