#!/bin/bash

# epelレポジトリを追加
rpm -Uvh http://ftp.jaist.ac.jp/pub/Linux/Fedora/epel/6/i386/epel-release-6-8.noarch.rpm
# remiレポジトリを追加
rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm

# php5.5をインストール(Apacheも芋づる式についてくる)
yum -y install --enablerepo=remi-php55 php php-mbstring

# Apacheを起動
service httpd start

# index.phpを追加
echo '<?php echo "PHP version " . PHP_VERSION . PHP_EOL;' > /var/www/html/index.php

# 環境確認のためにinfo.phpファイルを作成
echo '<?php phpinfo();' > /var/www/html/info.php

# iptablesを停止
service iptables stop
