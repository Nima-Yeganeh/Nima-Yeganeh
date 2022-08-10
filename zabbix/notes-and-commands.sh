## CentOS

sudo yum install openssh-clients
nmtui
sudo yum install openssh-clients
systemctl start sshd
sudo cat /etc/sysconfig/selinux

yum -y install httpd
systemctl status httpd.service
systemctl start httpd.service
systemctl status httpd.service
systemctl enable httpd

yum -y install epel-release
yum install http://rpms.remirepo.net/enterprise/remi-release-9.rpm
yum install http://rpms.remirepo.net/enterprise/remi-release-8.rpm
yum-config-manager --disable remi-php54
yum install yum-utils
yum-config-manager --disable remi-php54
yum-config-manager --enable remi-php72
yum install php php-pear php-cgi php-common php-mbstring php-snmp php-gd php-pecl-mysql php-xml php-mysql php-gettext php-bcmath

setenforce 0 && sed -i 's/^SELINUX=.*/SELINUX=permissive/g' /etc/selinux/config
rpm -Uvh https://repo.zabbix.com/zabbix/5.5/rhel/8/x86_64/zabbix-release-5.5-1.el8.noarch.rpm
dnf clean all
dnf -y install zabbix-server-mysql zabbix-web-mysql zabbix-apache-conf zabbix-sql-scripts zabbix-agent
dnf -y install mariadb-server && systemctl start mariadb && systemctl enable mariadb
mysql_secure_installation
mysql -uroot -p'password' -e "create database zabbix character set utf8 collate utf8_bin;"
mysql -uroot -p'password' -e "grant all privileges on zabbix.* to zabbix@localhost identified by 'password';"
mysql -uroot -p'password' zabbix -e "set global innodb_strict_mode='OFF';"

zcat /usr/share/doc/zabbix-sql-scripts/mysql/create.sql.gz | mysql -uzabbix -p'password' zabbix
mysql -uroot -p'password' zabbix -e "set global innodb_strict_mode='ON';"
mysql -uroot -p'password' zabbix -e "set global innodb_strict_mode='ON';"

cat /etc/zabbix/zabbix_server.conf
systemctl restart zabbix-server zabbix-agent
systemctl enable zabbix-server zabbix-agent

firewall-cmd --add-service={http,https} --permanent
firewall-cmd --add-port={10051/tcp,10050/tcp} --permanent
firewall-cmd --reload
cat /etc/php-fpm.d/zabbix.conf

systemctl restart httpd php-fpm
systemctl enable httpd php-fpm
nmtui
reboot

systemctl restart zabbix-server
systemctl restart httpd
systemctl status zabbix-server
cat /etc/php-fpm.d/zabbix.conf
cat /etc/zabbix/zabbix_server.conf
systemctl restart zabbix-server
systemctl status zabbix-server

cat /var/log/zabbix/zabbix_server.log
curl -LsS -O https://downloads.mariadb.com/MariaDB/mariadb_repo_setup
sudo bash mariadb_repo_setup --mariadb-server-version=10.5

sudo yum makecache
sudo yum repolist
sudo dnf module reset mariadb -y
sudo yum install MariaDB-server MariaDB-client MariaDB-backup
sudo yum install MariaDB-server MariaDB-client MariaDB-backup --allowerasing
sudo yum install MariaDB-server MariaDB-client MariaDB-backup --allowerasing
rpm -qi  MariaDB-server
sudo systemctl start mariadb
sudo systemctl enable mariadb

systemctl restart zabbix-server
systemctl start zabbix-server
cat /etc/zabbix/zabbix_server.conf
systemctl restart zabbix-server
systemctl status zabbix-server
rpm -ql zabbix-web | grep example.conf
cat /var/log/httpd/error_log
sudo dnf install httpd
sudo firewall-cmd --permanent --add-service=https
sudo firewall-cmd --reload
sudo systemctl start httpd
sudo systemctl status httpd

yum remove zabbix zabbix-release zabbix-server zabbix-server-mysql zabbix-web zabbix-web-mysql onapp-zabbix
mv /etc/httpd/conf.d/onapp-zabbix.conf /etc/httpd/conf.d/onapp-zabbix.conf.rpmsave
service httpd restart
mysql -u root -h <MYSQL_HOST> -e "drop database zabbix;"
mysql -u root -h  -e "drop database zabbix;"
mysql -u root -h <127.0.0.1> -e "drop database zabbix;"
mysql -u root -h 127.0.0.1 -e "drop database zabbix;"
mysql -u root -p 'password' -h 127.0.0.1 -e "drop database zabbix;"
mysql -uroot -p'password' -e "create database zabbix character set utf8 collate utf8_bin;"
mysql -uroot -p'password' -e "grant all privileges on zabbix.* to zabbix@localhost identified by 'password';"
mysql -uroot -p'password' zabbix -e "set global innodb_strict_mode='OFF';"

zcat /usr/share/doc/zabbix-sql-scripts/mysql/create.sql.gz | mysql -uzabbix -p'password' zabbix
mysql -uroot -p'password' zabbix -e "set global innodb_strict_mode='ON';"
rpm -Uvh https://repo.zabbix.com/zabbix/5.5/rhel/8/x86_64/zabbix-release-5.5-1.el8.noarch.rpm
dnf clean all
dnf -y install zabbix-server-mysql zabbix-web-mysql zabbix-apache-conf zabbix-sql-scripts zabbix-agent
nano /etc/zabbix/zabbix_server.conf
systemctl restart zabbix-server zabbix-agent
systemctl enable zabbix-server zabbix-agent
systemctl status zabbix-server
systemctl restart httpd
reboot

systemctl restart httpd
systemctl status zabbix-server
systemctl status httpd
nano /etc/zabbix/zabbix_server.conf
systemctl restart zabbix-server zabbix-agent
nmtui
reboot

systemctl restart httpd
systemctl enable httpd
systemctl restart zabbix-server zabbix-agent
systemctl restart zabbix-server
systemctl enable zabbix-server
systemctl restart zabbix-server
reboot

cat /etc/zabbix/zabbix_server.conf | more
cat /etc/resolv.conf

dnf --disablerepo '*' --enablerepo=extras swap centos-linux-repos centos-stream-repos
dnf distro-sync
dnf update

dnf update --skip-broken --nobest

systemctl stop zabbix-server
systemctl stop mysql
systemctl start mysql
systemctl start zabbix-server

cat /etc/zabbix/zabbix_server.conf
vi /etc/zabbix/zabbix_server.conf

StartPollers=100
StartPollersUnreachable=50
StartPingers=50
StartTrappers=10
StartDiscoverers=15
StartPreprocessors=15
StartHTTPPollers=5
StartAlerters=5
StartTimers=2
StartEscalators=2
CacheSize=128M
HistoryCacheSize=64M
HistoryIndexCacheSize=32M
TrendCacheSize=32M
ValueCacheSize=256M

nano /etc/my.cnf.d/10_my_tweaks.cnf
vi /etc/my.cnf.d/10_my_tweaks.cnf

[mysqld]
max_connections = 404
innodb_buffer_pool_size = 800M
innodb-log-file-size = 128M
innodb-log-buffer-size = 128M
innodb-file-per-table = 1
innodb_buffer_pool_instances = 8
innodb_old_blocks_time = 1000
innodb_stats_on_metadata = off
innodb-flush-method = O_DIRECT
innodb-log-files-in-group = 2
innodb-flush-log-at-trx-commit = 2
tmp-table-size = 96M
max-heap-table-size = 96M
open_files_limit = 65535
max_connect_errors = 1000000
connect_timeout = 60
wait_timeout = 28800

chown mysql:mysql /etc/my.cnf.d/10_my_tweaks.cnf
chmod 644 /etc/my.cnf.d/10_my_tweaks.cnf

systemctl stop zabbix-server
systemctl stop mysql
systemctl start mysql
systemctl start zabbix-server

setsebool -P httpd_can_connect_zabbix 1
setsebool -P zabbix_can_network on
setsebool -P daemons_enable_cluster_mode on
setenforce 1 && sed -i 's/^SELINUX=.*/SELINUX=enforcing/g' /etc/selinux/config

sestatus

dnf upgrade 'zabbix-*'
systemctl restart zabbix-server

sudo dnf makecache --refresh
sudo dnf -y install js-jquery

https://bestmonitoringtools.com/how-to-install-zabbix-server-on-centos-or-rhel/
setenforce 0 && sed -i 's/^SELINUX=.*/SELINUX=permissive/g' /etc/selinux/config
rpm -Uvh https://repo.zabbix.com/zabbix/6.2/rhel/8/x86_64/zabbix-release-6.2-1.el8.noarch.rpm
dnf clean all
dnf -y install zabbix-server-mysql zabbix-web-mysql zabbix-apache-conf zabbix-sql-scripts zabbix-selinux-policy zabbix-agent
curl -LsS -O https://downloads.mariadb.com/MariaDB/mariadb_repo_setup
sudo bash mariadb_repo_setup --mariadb-server-version=10.6
dnf -y install mariadb-server && systemctl start mariadb && systemctl enable mariadb

mariadb-secure-installation

sudo mysql -uroot -p'password' -e "create database zabbix character set utf8mb4 collate utf8mb4_bin;"
sudo mysql -uroot -p'password' -e "grant all privileges on zabbix.* to zabbix@localhost identified by 'password';"
sudo zcat /usr/share/doc/zabbix-sql-scripts/mysql/server.sql.gz | mysql -uzabbix -p'password' zabbix
sudo vi /etc/zabbix/zabbix_server.conf
DBPassword=password
systemctl restart zabbix-server zabbix-agent
systemctl enable zabbix-server zabbix-agent
firewall-cmd --add-service={http,https} --permanent
firewall-cmd --add-port={10051/tcp,10050/tcp} --permanent
firewall-cmd --reload
systemctl restart httpd php-fpm
systemctl enable httpd php-fpm

systemctl restart zabbix-server zabbix-agent httpd php-fpm
systemctl enable zabbix-server zabbix-agent httpd php-fpm

sudo dnf install epel-release -y
dnf module list php

sudo dnf module disable php:remi-7.2

sudo dnf module enable php:remi-7.4

sudo dnf install php php-cli php-common
sudo dnf remove php php-cli php-common

sudo systemctl start php-fpm
sudo systemctl enable php-fpm

dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm

dnf install https://rpms.remirepo.net/enterprise/remi-release-8.rpm

dnf install php php-cli php-common

systemctl restart httpd php-fpm
systemctl enable httpd php-fpm

systemctl restart zabbix-server zabbix-agent httpd php-fpm
systemctl enable zabbix-server zabbix-agent httpd php-fpm

sudo vi /etc/zabbix/zabbix_server.conf

StartPollers=100
StartPollersUnreachable=50
StartPingers=50
StartTrappers=10
StartDiscoverers=15
StartPreprocessors=15
StartHTTPPollers=5
StartAlerters=5
StartTimers=2
StartEscalators=2
CacheSize=128M
HistoryCacheSize=64M
HistoryIndexCacheSize=32M
TrendCacheSize=32M
ValueCacheSize=256M

sudo vi /etc/my.cnf.d/10_my_tweaks.cnf

[mysqld]
max_connections = 404
max_connections = 1500
innodb_buffer_pool_size = 800M
innodb-log-file-size = 128M
innodb-log-buffer-size = 128M
innodb-file-per-table = 1
innodb_buffer_pool_instances = 8
innodb_old_blocks_time = 1000
innodb_stats_on_metadata = off
innodb-flush-method = O_DIRECT
innodb-log-files-in-group = 2
innodb-flush-log-at-trx-commit = 2
tmp-table-size = 96M
max-heap-table-size = 96M
open_files_limit = 65535
max_connect_errors = 1000000
connect_timeout = 120
wait_timeout = 28800

chown mysql:mysql /etc/my.cnf.d/10_my_tweaks.cnf
chmod 644 /etc/my.cnf.d/10_my_tweaks.cnf

egrep "^Start.+=[0-9]" /etc/zabbix/zabbix_server.conf | awk -F "=" '{s+=$2} END {print s+150}'

systemctl stop zabbix-server
systemctl stop mysql
systemctl start mysql
systemctl start zabbix-server

setsebool -P httpd_can_connect_zabbix 1
setsebool -P zabbix_can_network on
setsebool -P daemons_enable_cluster_mode on

setenforce 1 && sed -i 's/^SELINUX=.*/SELINUX=enforcing/g' /etc/selinux/config
sestatus

dnf upgrade 'zabbix-*'
systemctl restart zabbix-server

mysqldump -u root -p zabbix > zabbix.bak

setenforce 0 && sed -i 's/^SELINUX=.*/SELINUX=permissive/g' /etc/selinux/config

lvdisplay -v
vgdisplay -v
ls -al /home
umount /home
df -h
vi /etc/fstab
lvremove /dev/mapper/cs-home
lvextend -l 100%FREE /dev/mapper/cs-root
lvextend -l 100%FREE /dev/cs/root
xfs_growfs -d /dev/mapper/cs-root
resize2fs /root
lvextend -l 100%FREE /dev/mapper/centos_tron-root

sudo mysql -uroot -p'password' -e "GRANT ALL PRIVILEGES ON zabbix.* TO 'zabbix'@'%' IDENTIFIED BY 'password' WITH GRANT OPTION;"
sudo mysql -uroot -p'password' -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'password' WITH GRANT OPTION;"
sudo mysql -uroot -p'password' -e "FLUSH PRIVILEGES;"
systemctl stop zabbix-server
systemctl stop mysql
systemctl start mysql
systemctl start zabbix-server

sudo service zabbix-server restart
sudo service zabbix-agent restart
sudo systemctl restart zabbix-server zabbix-agent httpd
sudo systemctl enable zabbix-server zabbix-agent httpd


setenforce 0 && sed -i 's/^SELINUX=.*/SELINUX=permissive/g' /etc/selinux/config
setsebool -P httpd_can_connect_zabbix 1
setsebool -P zabbix_can_network on
setsebool -P daemons_enable_cluster_mode on

wget 'http://mirror.centos.org/centos/8-stream/BaseOS/x86_64/os/Packages/centos-gpg-keys-8-3.el8.noarch.rpm'
sudo rpm -i 'centos-gpg-keys-8-3.el8.noarch.rpm'
dnf --disablerepo '*' --enablerepo=extras swap centos-linux-repos centos-stream-repos
dnf --disablerepo '*' --enablerepo=extras swap centos-linux-repos centos-stream-repos
sudo dnf distro-sync
