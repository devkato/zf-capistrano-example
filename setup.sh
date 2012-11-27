#!/bin/sh

# ----------------------------------------------------------------------
# Install PHP & Zend Framework
# ----------------------------------------------------------------------

#  install development packages
#sudo yum -y groupinstall "Additional Development" "Development tools"
sudo yum -y groupinstall "Development tools"
sudo yum -y install 'openssl-devel' 'zlib-devel' 'pcre-devel' 'readline-devel'

# register the repository of Zend Framework
cat <<EOS > /etc/yum.repos.d/zend.repo
[Zend]
name=Zend Server
baseurl=http://repos.zend.com/zend-server/rpm/\$basearch
enabled=1
gpgcheck=1
gpgkey=http://repos.zend.com/zend.key

[Zend_noarch]
name=Zend Server - noarch
baseurl=http://repos.zend.com/zend-server/rpm/noarch
enabled=1
gpgcheck=1
gpgkey=http://repos.zend.com/zend.key
EOS

yum -y install zend-server-php-5.3
yum -y install tree


# ----------------------------------------------------------------------
# Create User Account
# ----------------------------------------------------------------------
useradd geek
echo 'geekgeek' | passwd geek --stdin
mkdir /home/geek/.ssh
chown geek. /home/geek/.ssh
chmod 600 /home/geek/.ssh

mkdir /deploy
chown geek /deploy


# ----------------------------------------------------------------------
# Install Java & Jenkins
# ----------------------------------------------------------------------
yum -y install java-1.6.0-openjdk java-1.6.0-openjdk-devel
wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key
yum -y install jenkins-1.491-1.1
service jenkins start


# ----------------------------------------------------------------------
# Install pear modules
# ----------------------------------------------------------------------
/usr/local/zend/bin/pear config-set auto_discover 1
/usr/local/zend/bin/pear install pear.phpunit.de/PHPUnit
/usr/local/zend/bin/pecl install xdebug
echo "extension=xdebug.so" >> /usr/local/zend/etc/php.ini
/usr/local/zend/bin/pear install phpunit/phpcpd


# ----------------------------------------------------------------------
# create deploy dir
# ----------------------------------------------------------------------
mkdir /deploy/
chown -R geek. /deploy/


# ----------------------------------------------------------------------
# Apache configuration for zend project
# ----------------------------------------------------------------------
cat <<EOS > /usr/local/zend/etc/sites.d/zend-default-vhost-80.conf
  DocumentRoot /deploy/geek_app/current/public
  <Directory "/deploy/geek_app/current/public">
    Allow from all
    AllowOverride All
  </Directory>
EOS

chkconfig httpd on
service httpd start

