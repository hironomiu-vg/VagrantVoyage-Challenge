echo "hello world"

yum -y install mysql
yum -y install mysql-server
yum -y install httpd
yum -y install php

chkconfig --level 2345 mysqld on
chkconfig --level 2345 httpd on
service mysqld start
service httpd start

adduser -g apache demouser
chmod 775 /home/demouser
mkdir /home//demouser/public_html
echo "<?php echo 'hello_world'; ?>" > /home/demouser/public_html/index.php

mysql < /vagrant/dbinit.sql

mv /etc/httpd/conf/httpd.conf /etc/httpd/conf/httpd.conf.bak
cp /vagrant/httpd.conf /etc/httpd/conf/httpd.conf

mv /etc/sysconfig/iptables /etc/sysconfig/iptables.bak
cp /vagrant/iptables /etc/sysconfig/iptables

service iptables restart
service httpd restart
