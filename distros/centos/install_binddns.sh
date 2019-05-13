echo ""
echo "################################"
echo "     Installing bind dns        "
echo "################################"
echo ""

# Install Packages
yum -y install bind bind-utils haveged

# Configure Bind9 DNS
cp /etc/named.conf /etc/named.conf_bak
cat /dev/null > /etc/named.conf

# Create named.conf
cat >/etc/named.conf<<EOF
//
// named.conf
//
// Provided by Red Hat bind package to configure the ISC BIND named(8) DNS
// server as a caching only nameserver (as a localhost DNS resolver only).
//
// See /usr/share/doc/bind*/sample/ for example named configuration files.
//
options {
        listen-on port 53 { any; };
        listen-on-v6 port 53 { any; };
        directory       "/var/named";
        dump-file       "/var/named/data/cache_dump.db";
        statistics-file "/var/named/data/named_stats.txt";
        memstatistics-file "/var/named/data/named_mem_stats.txt";
        allow-query     { any; };
				allow-recursion {"none";};
        recursion no;
};
logging {
        channel default_debug {
                file "data/named.run";
                severity dynamic;
        };
};
zone "." IN {
        type hint;
        file "named.ca";
};
include "/etc/named.conf.local";
EOF

#
touch /etc/named.conf.local

echo ""
systemctl enable named.service
echo "named service enabled!"
systemctl start named.service
echo "named service started!"
systemctl enable haveged.service
echo "havged service enabled!"
systemctl start haveged.service
echo "haveged service started!"
