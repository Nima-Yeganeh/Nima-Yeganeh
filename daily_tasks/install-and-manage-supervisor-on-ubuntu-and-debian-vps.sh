# install-and-manage-supervisor-on-ubuntu-and-debian-vps

# In many VPS environments, it is often the case that you will have a number of small programs that you want to run persistently, whether these are small shell scripts, Node.js apps, or any large-sized packages.

# Usually, external packages are supplied with a unit file that allows them to be managed by an init system such as systemd, or packaged as docker images which can be managed by a container engine. However, for software that isn’t well-packaged, or for users who would prefer not to interact with a low-level init system on their server, it is helpful to have a lightweight alternative.

# Supervisor is a process manager which provides a singular interface for managing and monitoring a number of long-running programs. In this tutorial, you will install Supervisor on a Linux server and learn how to manage Supervisor configurations for multiple applications.

sudo apt update && sudo apt install supervisor
sudo systemctl status supervisor

# A best practice for working with Supervisor is to write a configuration file for every program it will handle.

# All programs run under Supervisor must be run in a non-daemonising mode (sometimes also called ‘foreground mode’). If, by default, your program automatically returns to the shell after running, then you may need to consult the program’s manual to find the option to enable this mode, or Supervisor will not be able to properly determine the status of the program.

# In order to demonstrate Supervisor’s functionality, we’ll create a shell script that does nothing other than produce some predictable output once a second, but will run continuously in the background until it is manually stopped. Using nano or your favorite text editor, open a file called idle.sh in your home directory:

sudo vi ~/idle.sh

#!/bin/bash
while true
do 
	# Echo current date to stdout
	echo `date`
	# Echo 'error!' to stderr
	echo 'error!' >&2
	sleep 1
done

chmod +x ~/idle.sh

# The per-program configuration files for Supervisor programs are located in the /etc/supervisor/conf.d directory, typically running one program per file and ending in .conf. We’ll create a configuration file for this script, as`/etc/supervisor/conf.d/idle.conf:

sudo vi /etc/supervisor/conf.d/idle.conf

command=/home/ubuntu/idle.sh
autostart=true
autorestart=true
stderr_logfile=/var/log/idle.err.log
stdout_logfile=/var/log/idle.out.log

# The autostart option tells Supervisor that this program should be started when the system boots. Setting this to false will require a manual start following any system shutdown.

# autorestart defines how Supervisor should manage the program in the event that it exits:
# false tells Supervisor not to ever restart the program after it exits.
# true tells Supervisor to always restart the program after it exits.
# unexpected tells Supervisor to only restart the program if it exits with an unexpected error code (by default anything other than codes 0 or 2). To learn more about error codes, look into the errno command.
# The final two lines define the locations of the two main log files for the program. As suggested by the option names, stdout and stderr will be directed to the stdout_logfile and stderr_logfile locations respectively. The specified directories must already exist, as Supervisor will not attempt to create any missing directories.

# Once our configuration file is created and saved, we can inform Supervisor of our new program through the supervisorctl command. First we tell Supervisor to look for any new or changed program configurations in the /etc/supervisor/conf.d directory with:

sudo supervisorctl reread
sudo supervisorctl update
sudo tail /var/log/idle.out.log
sudo supervisorctl

supervisor> help
supervisor> stop idle
supervisor> start idle
supervisor> tail idle
supervisor> tail idle stderr
supervisor> status
supervisor> quit
