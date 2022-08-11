# Initial Server Setup with Ubuntu 20
# If you are not already connected to your server, log in now as the root user using the following command (substitute the highlighted portion of the command with your server’s public IP address):
ssh root@your_server_ip

# Once you are logged in as root, you’ll be able to add the new user account. In the future, we’ll log in with this new account instead of root.
# This example creates a new user called sammy, but you should replace that with a username that you like:
sudo adduser sammy

# To avoid having to log out of our normal user and log back in as the root account, we can set up what is known as superuser or root privileges for our normal account. This will allow our normal user to run commands with administrative privileges by putting the word sudo before the command.
# To add these privileges to our new user, we need to add the user to the sudo group. By default, on Ubuntu 20.04, users who are members of the sudo group are allowed to use the sudo command.
# As root, run this command to add your new user to the sudo group (substitute the highlighted username with your new user):
sudo usermod -aG sudo sammy

# Applications can register their profiles with UFW upon installation. These profiles allow UFW to manage these applications by name. OpenSSH, the service allowing us to connect to our server now, has a profile registered with UFW.
# You can see this by typing:
sudo ufw app list
sudo ufw allow OpenSSH
sudo ufw enable
sudo ufw status

# If you logged in to your root account using a password, then password authentication is enabled for SSH. You can SSH to your new user account by opening up a new terminal session and using SSH with your new username:
ssh sammy@your_server_ip
ssh sammy@127.0.0.1
whoami

# If you logged in to your root account using SSH keys, then password authentication is disabled for SSH. You will need to add a copy of your local public key to the new user’s ~/.ssh/authorized_keys file to log in successfully.
# Since your public key is already in the root account’s ~/.ssh/authorized_keys file on the server, we can copy that file and directory structure to our new user account in our existing session.
# The simplest way to copy the files with the correct ownership and permissions is with the rsync command. This will copy the root user’s .ssh directory, preserve the permissions, and modify the file owners, all in a single command. Make sure to change the highlighted portions of the command below to match your regular user’s name:
# The rsync command treats sources and destinations that end with a trailing slash differently than those without a trailing slash. When using rsync below, be sure that the source directory (~/.ssh) does not include a trailing slash (check to make sure you are not using ~/.ssh/).
# If you accidentally add a trailing slash to the command, rsync will copy the contents of the root account’s ~/.ssh directory to the sudo user’s home directory instead of copying the entire ~/.ssh directory structure. The files will be in the wrong location and SSH will not be able to find and use them.
sudo rsync --archive --chown=sammy:sammy ~/.ssh /home/sammy
