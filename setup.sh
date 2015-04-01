#!/bin/bash

# add epel repository
rpm -Uvh http://ftp.jaist.ac.jp/pub/Linux/Fedora/epel/6/i386/epel-release-6-8.noarch.rpm
# add remi repository
rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm

# install common
yum -y install vim

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

# extension
yum -y install --enablerepo=remi,remi-php55 php-mcrypt php-intl

# mysql
yum -y remove mysql*
yum -y install --enablerepo=remi mysql mysql-server mysql-devel
yum -y --enablerepo=remi,remi-php55 install php-pdo php-mysql
service mysqld start

# composer
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

# cakephp
cp -f /vagrant/httpd.conf /etc/httpd/conf/.
mysql < /vagrant/database.sql
cd /var/www
rm -rf html
/usr/local/bin/composer create-project --no-interaction --prefer-dist cakephp/app html
cp -f /vagrant/app.php /var/www/html/config/.
chown -R vagrant: /var/www/html
service httpd restart
