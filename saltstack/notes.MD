salt '*' cmd.run 'uptime; lsblk'
# Master to Minions

# https://docs.saltproject.io/en/getstarted/fundamentals/install.html

# ON THE SALT MASTER
# Run these commands on the system that you want to use as the central management point:
curl -L https://bootstrap.saltstack.com -o install_salt.sh
sudo sh install_salt.sh -M
# (note the -M option for "install Salt master")

# ON EACH SALT MINION
# Run these commands on each system that you want to manage using Salt.
curl -L https://bootstrap.saltstack.com -o install_salt.sh
sudo sh install_salt.sh

# SALT HOSTNAME
# Salt minions attempt to contact the Salt master using the salt hostname. If you don't have DNS in your environment, or if the Salt master hostname is something other than salt, you can add the IP address of your Salt master server to the /etc/salt/minion configuration file by changing the master setting.
# The bootstrap script supports passing the Salt master IP address directly using the -A option.
cat /etc/salt/minion

systemctl restart salt-minion
ip a

cat /etc/salt/master
# interface: 1.1.1.1 (example)
salt-key -L
salt-key -A
salt-key --accept=IP
salt '*' test.ping
salt '*' cmd.run 'uptime'

sudo sh install_salt.sh -M -N
pip install salt-ssh

cat /etc/salt/roster
vi /etc/salt/roster
# Example
ID1:
  host: 192.168.0.1
  user: root
  sudo: true
ID2:
  host: 192.168.0.2
  user: root
  sudo: true

salt-ssh '*' cmd.run 'hostname'
