sudo cat /etc/redhat-release
sudo cat /proc/version
sudo ls -anp /etc/yum.repos.d/

cd /etc/yum.repos.d/
sudo mkdir oldrepo
sudo cp CentOS-* oldrepo/
sudo sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
sudo sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
sudo yum update -y
sudo dnf distro-sync

sudo dnf --disablerepo '*' --enablerepo extras swap centos-linux-repos centos-stream-repos
sudo dnf distro-sync

