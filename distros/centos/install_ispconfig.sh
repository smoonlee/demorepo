cd /tmp 
wget -O ispconfig.tar.gz https://git.ispconfig.org/ispconfig/ispconfig3/repository/archive.tar.gz?ref=stable-3.1
tar xfz ispconfig.tar.gz
cd ispconfig3*/install/

php -q install.php

