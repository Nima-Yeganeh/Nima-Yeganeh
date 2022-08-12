# sshfs-to-mount-remote-file-systems-over-ssh
# Transferring files over an SSH connection, by using either SFTP or SCP, is a popular method of moving small amounts of data between servers. In some cases, however, it may be necessary to share entire directories, or entire filesystems, between two remote environments. While this can be accomplished by configuring an SMB or NFS mount, both of these require additional dependencies and can introduce security concerns or other overhead.

# As an alternative, you can install SSHFS to mount a remote directory by using SSH alone. This has the significant advantage of requiring no additional configuration, and inheriting permissions from the SSH user on the remote system. SSHFS is particularly useful when you need to read from a large set of files interactively on an individual basis.

sudo apt update
sudo apt install sshfs

# Note: SSHFS can be installed on Mac or Windows through the use of filesystem libraries called FUSE, which provide interoperability with Linux environments. They will use identical concepts and connection details to this tutorial, but may require you to use different configuration interfaces or install third-party libraries. This tutorial will cover SSHFS on Linux only, but you should be able to adapt these steps to Mac or Windows FUSE implementations.

sudo mkdir /mnt/droplet
sudo sshfs -o allow_other,default_permissions sammy@your_other_server:~/ /mnt/droplet
sudo sshfs -o allow_other,default_permissions nima@127.0.0.1:~/droplet /mnt/droplet
sudo sshfs -o allow_other,default_permissions nima@127.0.0.1:/home/nima/droplet /mnt/droplet

ls -anp /mnt/droplet/

sudo touch droplet/testfile2.txt
ls -anp /mnt/droplet/ | grep testfile

# -o precedes miscellaneous mount options (this is the same as when running the mount command normally for non-SSH disk mounts). In this case, you are using allow_other to allow other users to have access to this mount (so that it behaves like a normal disk mount, as sshfs prevents this by default), and default_permissions (so that it otherwise uses regular filesystem permissions).
# sammy@your_other_server:~/ provides the full path to the remote directory, including the remote username, sammy, the remote server, your_other_server, and the path, in this case ~/ for the remote user’s home directory. This uses the same syntax as SSH or SCP.
# /mnt/droplet is the path to the local directory being used as a mount point.

# Note: If you need to mount a remote directory using SSHFS without requiring sudo permissions, you can create a user group called fuse on your local machine, by using sudo groupadd fuse, and then adding your local user to that group, by using sudo usermod -a -G fuse sammy.

ls /mnt/droplet

sudo umount /mnt/droplet

# As with other types of disk and network mounts, you can configure a permanent mount using SSHFS. To do this, you’ll need to add a configuration entry to a file named /etc/fstab, which handles Linux filesystem mounts at startup.

sudo nano /etc/fstab
sudo vi /etc/fstab

sammy@your_other_server:~/ /mnt/droplet fuse.sshfs noauto,x-systemd.automount,_netdev,reconnect,identityfile=/home/sammy/.ssh/id_rsa,allow_other,default_permissions 0 0

# sammy@your_other_server:~/ is the remote path again, just as before.
# /mnt/droplet is the local path again.
# fuse.sshfs specifies the driver being used to mount this remote directory.
# noauto,x-systemd.automount,_netdev,reconnect are a set of options that work together to ensure that permanent mounts to network drives behave gracefully in case the network connection drops from the local machine or the remote machine.
# identityfile=/home/sammy/.ssh/id_rsa specifies a path to a local SSH key so that the remote directory can be mounted automatically. Note that this example assumes that both your local and your remote username are sammy – this refers to the local path. It is necessary to specify this because /etc/fstab effectively runs as root, and would not otherwise know which username’s SSH configurations to check for a key that is trusted by the remote server.
# allow_other,default_permissions use the same permissions from the mount command above.
# 0 0 signifies that the remote filesystem should never be dumped or validated by the local machine in case of errors. These options may be different when mounting a local disk.

