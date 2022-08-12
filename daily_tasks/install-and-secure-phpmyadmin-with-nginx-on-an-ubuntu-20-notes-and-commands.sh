# install-and-secure-phpmyadmin-with-nginx-on-ubuntu-20

# When developing a website or web application, many users need the functionality of a database system like MySQL. However, interacting with the system solely from the MySQL command-line client requires familiarity with Structured Query Language — more commonly referred to as SQL — which can present a major hurdle for some users.

# phpMyAdmin was created to allow users to interact with MySQL through an intuitive web interface, running alongside a PHP development environment. This guide will walk you through installing phpMyAdmin on top of an Nginx server.

# Note: phpMyAdmin runs on a database server, handles database credentials, and allows users to execute SQL statements on the database. Combined with the fact that it’s a widely-deployed PHP application, this means that phpMyAdmin is frequently targeted for attack. If you install and configure phpMyAdmin without taking the proper steps to secure it from malicious actors, you run the risk of your data being lost or stolen.

# In addition to installing the application, this tutorial will go over several measures you can take to harden your phpMyAdmin installation’s security. It will also explain each measure in detail so that you can make informed decisions and protect your system.

sudo apt update
sudo apt install phpmyadmin
sudo mysql
mysql -u root -p
sudo ln -s /usr/share/phpmyadmin /var/www/your_domain/phpmyadmin

# https://server_domain_or_IP/phpmyadmin

cd /var/www/your_domain/
ls -l
sudo mv phpmyadmin hiddenlink
ls -l

# https://server_domain_or_IP/hiddenlink

sudo nano /etc/phpmyadmin/conf.d/pma_secure.php

<?php

# PhpMyAdmin Settings
# This should be set to a random string of at least 32 chars
$cfg['blowfish_secret'] = 'CHANGE_THIS_TO_A_STRING_OF_32_RANDOM_CHARACTERS';

$i=0;
$i++;

$cfg['Servers'][$i]['auth_type'] = 'cookie';
$cfg['Servers'][$i]['AllowNoPassword'] = false;
$cfg['Servers'][$i]['AllowRoot'] = false;

?>

sudo apt install pwgen

openssl passwd
sudo nano /etc/nginx/pma_pass

sammy:9YHV.p60.Cg6I

sudo nano /etc/nginx/sites-available/your_domain

server {
        . . .

        location / {
                try_files $uri $uri/ =404;
        }

        location ^~ /hiddenlink {

        }

        . . .
}

server {
        . . .
        location / {
                try_files $uri $uri/ =404;
        }

        location ^~ /hiddenlink {
                auth_basic "Admin Login";
                auth_basic_user_file /etc/nginx/pma_pass;
        }
        . . .
}

server {
        . . .

        location / {
                try_files $uri $uri/ =404;
        }

        location ^~ /hiddenlink/ {
                auth_basic "Admin Login";
                auth_basic_user_file /etc/nginx/pma_pass;

                location ~ \.php$ {
                        include snippets/fastcgi-php.conf;
                        fastcgi_pass unix:/var/run/php/php7.4-fpm.sock;
                }
        }
    . . .
}

sudo nginx -t
sudo systemctl reload nginx

curl https://ipinfo.io/ip

sudo nano /etc/nginx/sites-available/your_domain

server {
        . . .

        location ^~ /hiddenlink/ {
                satisfy all; #requires both conditions
        
                allow 2.0.1.0; #allow your IP
                allow 127.0.0.1; #allow localhost via SSH tunnels
                deny all; #deny all other sources

                auth_basic "Admin Login";
                auth_basic_user_file /etc/nginx/pma_pass;

                location ~ \.php$ {
                        include snippets/fastcgi-php.conf;
                        fastcgi_pass unix:/var/run/php/php7.4-fpm.sock;
                }
        }

        . . .
}

sudo nginx -t
sudo systemctl reload nginx

# SSH tunneling works as a way of redirecting network traffic through encrypted channels. By running an ssh command similar to what you would use to log into a server, you can create a secure “tunnel” between your local machine and that server. After establishing a tunnel, all traffic coming in on a given local port can be redirected through the encrypted tunnel, using the remote server as a proxy before reaching out to the internet. This is similar to what happens when you use a virtual private network (VPN), but SSH tunnels generally require less configuration to set up.

# You can use SSH tunneling to proxy your requests to the remote web server running phpMyAdmin. By creating a tunnel between your local machine and the server where phpMyAdmin is installed, you can redirect local requests to the remote web server. More importantly, traffic will be encrypted and requests will reach Nginx as if they’re coming from localhost. This way, no matter what IP address you’re connecting from, you’ll be able to securely access phpMyAdmin’s interface.

# Because the traffic between your local machine and the remote web server will be encrypted, this is a safe alternative for situations where you can’t have an SSL/TLS certificate installed on the web server running phpMyAdmin.

# From your local machine, run this command whenever you need access to phpMyAdmin:

ssh user@server_domain_or_IP -L 8000:localhost:80 -L 8443:localhost:443 -N

# user: the Ubuntu user profile to connect to on the server where phpMyAdmin is running
# server_domain_or_IP: SSH host where phpMyAdmin is running
# -L 8000:localhost:80 redirects HTTP traffic on port 8000
# -L 8443:localhost:443 redirects HTTPS traffic on port 8443
# -N: prevents the execution of remote commands

sudo ufw status

sudo ufw allow http
sudo ufw allow 80
sudo ufw allow https
sudo ufw allow 443
sudo ufw status

