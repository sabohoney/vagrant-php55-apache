# vagrant-php55-apache

Vagrant files to install PHP5.5 and Apache for CentOS6.4

php packages are installed via remi repository.

## How to use

## add box

you have to get a CentOS6.4 box
see http://www.vagrantbox.es/

```
vagrant box add centos6.4 URL
```



## vagrant up

```
git clone https://github.com/DQNEO/vagrant-php55-apache
cd vagrant-php55-apache
vagrant up
```

## See if it is installed

access http://10.10.10.10/ by your browser on the host machine.

or simply `php -v` on the guest machine

