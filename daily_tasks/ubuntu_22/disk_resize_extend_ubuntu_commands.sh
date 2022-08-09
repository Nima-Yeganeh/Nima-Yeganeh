# Checking and verification
sudo df -h
sudo vgdisplay
sudo fdisk -l
sudo fdisk -l | grep dev
sudo lvdisplay
sudo lvs

# Option 1 >> Best one
sudo lsblk
sudo parted /dev/sda resizepart 3 100%
sudo partx -u /dev/sda
sudo pvresize /dev/sda3
sudo lvextend -r /dev/mapper/vgubuntu-root /dev/sda3
sudo df -h
sudo vgs
sudo lvs

