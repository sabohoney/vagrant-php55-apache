#!/bin/bash

# add epel repository
rpm -Uvh http://ftp.jaist.ac.jp/pub/Linux/Fedora/epel/6/i386/epel-release-6-8.noarch.rpm
# add remi repository
rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm

# install php5.5 and apache
yum -y install --enablerepo=remi-php55 php php-mbstring httpd

# start apache
service httpd start

# add index.php to document root
echo '<?php echo "PHP version " . PHP_VERSION . PHP_EOL;' > /var/www/html/index.php

# add info.php to see the environment
echo '<?php phpinfo();' > /var/www/html/info.php

# stop iptables
service iptables stop
