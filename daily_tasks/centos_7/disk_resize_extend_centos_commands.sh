df -h
sudo vgdisplay
sudo fdisk -l
sudo lvdisplay
sudo lvextend -rl +100%FREE /dev/cl/root
sudo lvs
sudo lvextend -L +100%FREE /dev/centos/root
sudo resize2fs /dev/centos/root
sudo lvextend -rl +100%FREE /dev/centos/root

sudo lsblk
sudo parted --pretend-input-tty /dev/nvme0n1 resizepart 2 100%
sudo parted /dev/nvme0n1 resizepart 2 100%
sudo partx -u /dev/nvme0n1
sudo pvresize /dev/nvme0n1p2
sudo lvextend -r /dev/centos/root /dev/nvme0n1p2
sudo df -h
sudo vgs
sudo lvs

