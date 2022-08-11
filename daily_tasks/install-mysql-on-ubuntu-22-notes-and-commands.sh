# install-mysql-on-ubuntu-22
# MySQL is an open-source database management system, commonly installed as part of the popular LAMP (Linux, Apache, MySQL, PHP/Python/Perl) stack. It implements the relational model and uses Structured Query Language (better known as SQL) to manage its data.

sudo apt update
sudo apt install mysql-server
sudo systemctl start mysql.service

sudo mysql
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
exit

mysql -u root -p
ALTER USER 'root'@'localhost' IDENTIFIED WITH auth_socket;

sudo mysql_secure_installation

CREATE USER 'username'@'host' IDENTIFIED WITH authentication_plugin BY 'password';

CREATE USER 'sammy'@'localhost' IDENTIFIED BY 'password';
CREATE USER 'sammy'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
ALTER USER 'sammy'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
GRANT PRIVILEGE ON database.table TO 'username'@'host';

GRANT CREATE, ALTER, DROP, INSERT, UPDATE, DELETE, SELECT, REFERENCES, RELOAD on *.* TO 'sammy'@'localhost' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'sammy'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;

systemctl status mysql.service
sudo mysqladmin -p -u sammy version

