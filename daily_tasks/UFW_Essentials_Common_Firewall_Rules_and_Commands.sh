# UFW Essentials: Common Firewall Rules and Commands
# UFW (uncomplicated firewall) is a firewall configuration tool that runs on top of iptables, included by default within Ubuntu distributions. It provides a streamlined interface for configuring common firewall use cases via the command line.
sudo ufw status

# If you got a Status: inactive message when running ufw status, it means the firewall is not yet enabled on the system. You’ll need to run a command to enable it.
# By default, when enabled UFW will block external access to all ports on a server. In practice, that means if you are connected to a server via SSH and enable ufw before allowing access via the SSH port, you’ll be disconnected.
sudo ufw enable
sudo ufw status
sudo ufw disable

sudo ufw deny from 1.0.1.100
sudo ufw deny from 1.0.1.0/24
sudo ufw deny in on eth0 from 1.0.1.100

# The in parameter tells ufw to apply the rule only for incoming connections, and the on eth0 parameter specifies that the rule applies only for the eth0 interface. This might be useful if you have a system with several network interfaces (including virtual ones) and you need to block external access to some of these interfaces, but not all.

sudo ufw allow from 1.0.1.101
sudo ufw status

sudo ufw delete allow from 2.0.1.101
sudo ufw status numbered
sudo ufw delete 1

# Upon installation, applications that rely on network communications will typically set up a UFW profile that you can use to allow connection from external addresses. This is often the same as running ufw allow from, with the advantage of providing a shortcut that abstracts the specific port numbers a service uses and provides a user-friendly nomenclature to referenced services.
sudo ufw app list

# To enable a UFW application profile, run ufw allow followed by the name of the application profile you want to enable, which you can obtain with a sudo ufw app list command. In the following example, we’re enabling the OpenSSH profile, which will allow all incoming SSH connections on the default SSH port.
sudo ufw allow “OpenSSH”
sudo ufw status
sudo ufw allow "Nginx HTTPS"
sudo ufw delete allow "Nginx Full"
sudo ufw allow OpenSSH
sudo ufw allow 22
sudo ufw allow from 2.0.1.103 proto tcp to any port 22
sudo ufw allow from 2.0.1.0/24 proto tcp to any port 22
sudo ufw allow from 2.0.1.103 to any port 873
sudo ufw allow from 2.0.1.0/24 to any port 873
sudo ufw app list | grep Nginx
sudo ufw allow "Nginx Full"
sudo ufw app list | grep Apache
sudo ufw allow http
sudo ufw allow 80
sudo ufw allow https
sudo ufw allow 443
sudo ufw allow proto tcp from any to any port 80,443
sudo ufw allow from 2.0.1.103 to any port 3306
sudo ufw allow from 2.0.1.103 to any port 5432
sudo ufw deny out 25

man ufw
