sudo apt update
sudo apt full-upgrade
cd /media
ls -anp
sudo apt-get install build-essential gcc make perl dkms
reboot
ip a
ip addr | grep inet
ps
route -n
sudo apt update && sudo apt install terminator
ping -c 1 8.8.8.8
ls -l /etc/
df
df -h
df -hi
type df
type rm
type apt
type cd
type alias
type umask
ifconfig
sudo apt install net-tools
sudo dnf install net-tools
man -k ifconfig
man -k uname
man -k "copy files"
apropos ifconfig
apropos uname

cat /etc/passwd
ls /var/log/
ls -l /etc/passwd

wget http://google.com
ping google.com

bg %1
cat .
echo $HISTFILESIZE
history
echo $HISTSIZE

ip address show
cat .bash_history
echo $HISTCONTROL

HISTCONTROL=ignorespace
HISTCONTROL=ignoedups
HISTCONTROL=ignoreboth

echo "HISTCONTROL=ignoreboth" >> .bashrc

HISTTIMEFORMAT="%d/%m/%y %T"
echo "HISTTIMEFORMAT="%d/%m/%y %T"" >> .bashrc
sudo su
id
exit

sudo su -
sudo groupadd myadmin
sudo useradd john
sudo -v
sudo -k
sudo passwd root
su
id
ls /
ls /bin
ls /proc
ls /boot
ls /root
ls /dev
ls /sbin
ls /etc
ls /srv
ls /home
ls /sys
ls /lib
ls /tmp
ls /media
ls /usr
ls /mnt
ls /opt
ls /var

ls /var/cache
ls /var/lib
ls /var/log
ls /var/mail
ls /var/tmp
ls /var/spool

ls /usr/bin
ls /usr/include
ls /usr/lib
ls /usr/local
ls /usr/sbin
ls /usr/src

which ifconfig
which fdisk

ls /home

ls -l /dev/sda1
ls /
ls /etc/ssh

cat /proc/cpuinfo
cat /proc/meminfo
cat /var/log/auth.log

pwd
cat /etc/passwd

sudo tail /var/log/boot.log

cat /etc/hosts
ls /etc/cron.daily/

sudo apt install tree
tree

tree /etc/
tree -f /etc/
ls -ld /etc/
ls -lh /etc/
ls -la

sudo du -sh /etc/
ls -l -X /home/

ls --hide=*.conf /etc/
ls -lR /etc/

type ls
ls --color=auto

stat /etc/passwd

touch linux.txt
touch -a linux.txt
stat linux.txt
touch -m linux.txt

date
touch -m -t 201801011530.45 linux.txt

touch -d '2018-01-01 15:30:45' linux.txt

ls -lu
ls -lc
ls -l --full-time /etc/
ls -ltur

file linux.txt
cat -n /etc/passwd

cat file1 file2 > newfile

less /var/log/dmesg
tail /etc/passwd

tail -n 2 /etc/group
tail -n +20 file
tail -f /var/log/auth.log

head /etc/passwd

head -7 /etc/group
watch ls

watch -n 3 -d ls -l
touch abc.txt

watch -n 1 -d ifconfig

stat file1 file2
mkdir dir1 dir2 dir3

ls /tmp/
mkdir -p first/second/third

tree

cp file1 file2
cp -v file1 file2
cp -i file1 file2
cp -r folder1 filder2
cp -p file1 file2

rm file
rm -f file

rm -rf folder
echo *.txt

shred -vu -n 100 passwd
ls -lSh /etc | head

ls -lSh /etc/ | head -n20 | tail -n1
cat -n /var/log/auth.log | grep -a "authentication failure" | wc -l

wc /etc/passwd
wc -l /etc/group
wc -w file
wc -c file

who | wc -l
ls -l > ls.txt

ifconfig >> output
tty

ifconfig > /dev/pts/0
echo "How are you?" > /dev/pts/0

tail -n3 /etc/shadow 2> error.txt

tail -n2 /etc/passwd /etc/shadow > output 2> error

ifconfig | grep ether
ifconfig | grep ether | cut -d"" -f10
cut -d":" -f1 /etc/passwd

ifconfig | grep ether | tee mac.txt
who | tee -a mac.txt

uname -a | tee -a file1 file2

sudo apt install mlocate
sudo updatedb
ls /var/lib/mlocate
locate -S
locate passwords
locate -b filename
locate -b '\name'

locate -b '\shadow'

locate -b -r '^shadow\.[0-9]'

which pwd ifconfig find grep firefox

find . -name filename
find . -name "*file*"

find . -name filename -delete
find /etc/ -type d -maxdepth 2 -perm 755

find /var/ -type f -size 100k -ls
find /var/ -type f -mtime 0 -ls

sudo find /etc/ -type f -not -group root -ls

sudo find /etc/ -type f -mtime 0 -exec cat {} \;

sudo find /etc/ -mtime -7 -type f -exec cp {} /root/backup \;

grep user /etc/ssh/ssh_config
grep -i "SSH" /etc/ssh/ssh_config

grep body /etc/passwd
grep -w body /etc/passwd

grep -R 127.0.0.1 /etc/
grep -c error /var/log/syslog

grep error /var/log/syslog | wc -l

dmesg | grep error

sudo netstat -tupan
sudo netstat -tupan | grpe 53

ls -RF /etc/ | grep /
ls -RF /etc/ | grep -v / | grep -v "^$"

ls -RF /etc/ | grep -v / | grep -v "^$" | sort -r

ls -l /dev/mem
strings /dev/mem

diff -B file1 file2

sudo apt install vim

vim -d file1 file2
vimdiff file1 file2

sudo tar -czvf etc.tar.gz /etc/
ls -anp

sudo tar -czvf archive.tar.gz /etc/passwd /etc/group /var/log/dmesg /etc/ssh

date +%F

tar -xvf file.tar.xz
gzip
gunzip

ln file1 file2
ls -li

find . -inum INODE_NUM
ln -s /etc/passwd ./passwd
ls -l
ps aux
ln hardlink softlink

less /etc/passwd
less /etc/shadow

tail -n3 /etc/group

sudo useradd -m -d /home/james -c "C++ Developer" -s /bin/bash -G sudo,adm,mail james

cat /etc/passwd

sudo useradd -e 2020-12-31 u2
sudo chage -l james
sudo chage -l u2

cat /etc/group
cat /etc/gshadow

sudo usermod -g daemon james
sudo groupadd developers
sudo groupadd managers

sudo usermod -G developers,managers james

groups james
sudo usermod -aG sudo james
groups james

sudo userdel u1

sudo useradd -m -s /bin/bash toor
grep toor /etc/passwd
sudo passwd toor

su toor
id
whoami

sudo usermod -aG sudo toor
cat /etc/groups

sudo apt install openssh-server
systemctl status ssh

who -H
who -aH

uptime
last
last reboot

ls -anp
chmod u-r file.txt
chmod u-w file.txt
chmod 000 file.txt
stat /etc/passwd

# rws = 4 + 2 + 1 = 7
# rw- = 4 + 2 + 0 = 6
# r-- = 4 + 0 + 0 = 4
# rw-rw-r-- = 664

stat Desktop/
stat /etc/

ls -anp
chmod u+rwx user.txt
chmod u-x,g+w,o-rwx user.txt

chmod ug-r,u+x,o-rwx user.txt
chmod a+r,a-wx user.txt
chmod ug=rw,o= user.txt

chmod --reference=i.txt user.txt
ls -ld folder/

find /home/ -type f
find /home/ -type f -exec chmod 640 {} \;

find /home/ -type d -exec chmod 750 {} \;

lscpu
chown toor file
groups toor

find /usr/bin/ -perm -4000 -ls

which cat

sudo su
groupadd prog
useradd -s /bin/bash pr1
useradd -s /bin/bash pr2
usermod -aG prog pr1
usermod -aG prog pr2
groups pr1
groups pr2
chown pr1:prog /prog/
chmod 770 /prog/
stat /prog/

lsattr file
chattr --help
chattr +a file
chattr +A file
chattr +i file

ps -ef
pstree
top
id
ps
ps -ef | wc -l
ps aux | less
ps aux --sort=%mem | less

ps -f -u root
pgrep sshd
pgrep python
pgrep -l systemd
pgrep -u root sshd
pstree | less

top -d1 -n3 -b > topproc.txt
sudo apt update && sudo apt install htop

kill -l
pgrep -l gedit
kill -2 PROC_NUM

pidof firefox
kill -INT PROC_IDs
kill -SIGINT $(pidof firefox)

sudo systemctl status ssh
tail -f /var/log/auth.log

cat /var/run/sshd.pid
pgrep -l sshd
killall APP

sleep 123&
sleep 321&
killall -15 sleep

pkill slee

ifconfig > output.txt 2> err.txt
ping -c 1 google.com > /dev/null 2>&1

jobs
jobs -l

slep 10 &
jobs
fg %1
bg %1

sudo apt install net-tools
ifconfig -a
ip address show

ip a sh
ip -4 addr
ip -6 addr

ifconfig eth0
ip addr show dev enp0s3

route
route -n
ip route sh

systemd-resolve --status

sudo su
ifconfig eth0 down
ifconfig eth0 up
ifconfig

ip link set eth0 down
ip link show dev eth0
ip link set eth0 up

ifconfig eth0 192.168.0.1/24 up
ifconfig | grep 192.168.0.1
ip addr del 192.168.0.1/24 dev eth0
ip addr add 192.168.0.1/24 dev eth0

route -n
ip route show

route del default gw 192.168.0.254
route add def gw 192.168.0.254
ip route del default
ip route add default via 192.168.0.254
ip route show

ifconfig eth0 down
ifconfig eth0 hw ether NEWMAC
ifconfig eth0 up
ip link set dev eth0 addres NEWMAC
ip link show dev eth0

ls /etc/netplan/

sudo su
id
systemctl stop NetworkManager
systemctl is-enabled NetworkManager

vi /etc/netplan/01-netconfig.yaml
network:
  version: 2
  renderer: networkd
  ethernets:
    eth0:
      dhcp4: false
      addresses:
        - 192.168.0.1/24
      gateway4: "192.168.0.254"
      nameservers:
        addresses:
          - "8.8.8.8"
          - "8.8.4.4"

netplan apply
route -n

ping google.com -n
ping -i 0.4 -c 4 google.com
ping -q -c 4 google.com
ping -t 1 -c 3 -n google.com
ping -t 2 -c 3 -n google.com

sudo apt install openssh-server openssh-client

sudo dnf install openssh-server openssh-client

systemctl status sshd
systemctl status ssh

ps -ef | grep ssh
ssh -p 22 -l user 192.168.0.1

cat /etc/ssh/ssh_config
systemctl restart ssh

ls -anp
cat .ssh/known_hosts

sudo dnf install telnet
sudo apt install telnet

telnet 192.168.0.1 22

sudo dnf install nmap
nmap -p 22 192.168.0.1
nmap -p 22 192.168.0.1 -Pn

sudo iptables -vnL
ufw status verbose
sudo ufw enable
sudo ufw disable
ufw app list
ufw allow ssh
ssh -v root@192.168.0.1
ssh -vv root@192.168.0.1

tail -f /var/log/auth.log
tail -f /var/log/secure

vi /etc/ssh/sshd_config
Port 22
PermitRootLogin no
AllowUsers student toor u1

iptables -A INPUT -p tcp --dport 22 -s 192.168.0.2 -j ACCEPT
iptables -A INPUT -p tcp --dport 22 -j DROP

ls -anp
ip addr show > ip.txt
scp -P 22 ip.txt user@192.168.0.1:/home/

scp -r mydir/ root@192.168.0.1:/home/
scp user@192.168.0.1:/etc/passwd .

sudo rsync -av /etc/ /home/etc-backup/
sudo rsync -aq /etc/ /home/etc-backup/
sudo rsync -av --delete /etc/ /home/etc-backup/

vi exclude_files
*.png

rsync -av --exclude-from='./exclude_files' myproj/ backup/

rsync -av --exclude='*.png' proj1/ proj2/

sudo rsync -av -e ssh /etc/ user@192.168.0.1:/home/bak1/

sudo rsync -av -e 'ssh -p 22' --delete /etc/ user@192.168.0.1:/home/bak1/

sudo apt install wget
wget -c -P URL_LINK

sudo netstat -tupan
sudo lsof -iTCP -sTCP:LISTEN -nP
ss -tupan
sudo nmap 192.168.0.1
nmap -p 80

dpkg --info file.deb
sudo dpkg -i file.deb
dpkg --get-selections

dpkg-query -l
dpkg-query -l | grep ssh
dpkg -L openssh-server

dpkg -L coreutils | less
sudo dpkg -r google-chrome-stable

sudo apt install apache2
systemctl status nginx
sudo apt install gparted vlc
apt list --upgradable
sudo apt full-upgrade -y

sudo apt autoremove

apt list | wc -l
apt search "transparent proxy"
apt list --installed

sudo apt update && sudo apt install build-essential
sudo dnf group install "Development Tools"

gcc --version
g++ --version

vi hello.c
#include <stdio.h>
int main(){
    printf("Hello!\n");
    return 0;
}

gcc hello.c -o hello
./hello

md5sum file.tar.gz
tar -xzvf file.tar.gz
cd src
./configure --help
./configure --prefix=/opt/proftpd
make

which crontab
ls -l /etc/crontab
ls /var/spool/cron/
crontab -l
crontab -e

crontab -e -u user
@yearly /root/ytask.sh
@monthly /root/mtask.sh
@weekly /root/wtask.sh
@daily /root/dtask.sh
@hourly /root/htask.sh
@reboot /root/firewall.sh

# url >> crontab-generator.org

mount
mount -l -t ext4
ls -l /dev/sdb
fdisk -l
lsblk
sudo apt install gparted
df -h

dd if=/dev/sdb of=/home/user/backup-usb.img status=progress

dd if=/home/user/file.iso of=/dev/sdb bs=4M status=progress

lshw
lshw -json
lshw -C cpu
lscpu -J
dmidecode -t memory | grep -i size
free -m
lspci | grep -i wireless
lspci | grep -i vga
lsusb
lsusb -v
lshw -C disk
lshw -C disk -short
lsblk
hdparm -i /dev/sda
hdparm -t --direct /dev/sda

iw list
ls /proc/
cat /proc/meminfo
cat /proc/partitions
cat /proc/version

uname -r
apt install acpi
systemd --version

systemd-analyze
systemd-analyze blame

sudo su
apt update && apt install nginx
systemctl status nginx.service
systemctl reload-or-restart nginx
systemctl is-enabled nginx

alias
unalias now

vi .bashrc
alias now="date +%F\ %T"

alias root="sudo su"
alias ports="netstat -tupan"
alias lt="ls -hSF --size -1"

echo $0
echo $PATH
which -a bash
ls -li /bin/bash /usr/bin/bash
which python3

vi test.sh
#!/usr/bin/python3
import sys
print(sys.version)
./test.sh

vi test.sh
:set num

os="linux"
age=30
echo "$os $age"
distro="test"
unset distro
echo $HOME
echo $USER

declare -r logdir="/var/log"
ls $logdir
env | grep USER
env | grep SHELL
printenv HOME
printenv SHELL PWD LC_TIME

abc="test"
set | grep abc

cat /home/.bashrc

export PATH=$PATH:/home/scripts
export MYVAR=123

cat /etc/environment

read name
echo $name
read -p "ip?" ip
echo $ip
ping -c 1 $ip

vi test.sh
#!/bin/bash
read -p "Enter IP: " ip
iptables -I INPUT -s $ip -j DROP

chmod +x test.sh
./test.sh

vi arguments.sh
#!/bin/bash
echo "\$0 is $0"
echo "\$1 is $1"
echo "\$2 is $2"
echo "\$3 is $3"
echo "\$* is $*"
echo "\$# is $#"

#!/bin/bash
if [[ -f "$1" ]]
then
  echo "file"
  sleep 1
  cat $1
elif [[ -d "$1" ]]
then
  echo "file"
  sleep 1
  ls -l $1
else
  echo "$1"
fi

vi test.sh
#!/bin/bash
read -p "num?" age
if [[ $age -lt 18 ]]
then
  echo ""
elif [[ $age -eq 18 ]]
then
  echo ""
else
  echo ""
fi

#!/bin/bash
read -p "num?" age
if [[ $age -lt 18 ]] && [[ $age -ge 0 ]]
then
  echo ""
elif [[ $age -eq 18 ]]
then
  echo ""
elif [[ $age -gt 18 ]] && [[ $age -le 100 ]]
then
  echo ""
else
  echo ""
fi

vi test.sh
#!/bin/bash
if [[ $# -eq 1 ]]
then
  if [[ -f "$1" ]]
  then
    cat $1
  elif [[ -d "$1" ]]
  then
    ls -l $1
  else
    echo "$1 >> not file or dir"
  fi
else
  echo "argument?"
fi

output="$(ps -ef | grep bash)"
echo "$output"

date +%F
date +%F_%H%M

sudo tar -czvf etc.tar.gz /etc/

vi test.sh
#!/bin/bash
read -p str1
read -p str2
if [ "$str1" = "$str2" ]
then
  echo ""
else
  echo ""
fi

if [[ "$str1" == "$str2" ]]
then
  echo ""
else
  echo ""
fi

if [[ "$str1" != "$str2" ]]; then
echo ""
fi

if [[ "$str1" == *"linux"* ]]
then
  echo ""
else
  echo ""
fi

if [[ -z "$str1" ]]
then
  echo "zero length"
else
fi

if [[ -n "$str1" ]]
then
  echo "not zero"
else
fi

#!/bin/bash
output="$(ping -c 3 $1)"
echo "$output"
if [[ "$output" == *"100% packet loss"* ]]
then
  echo "not working"
else
  echo "ok"
fi

#!/bin/bash
for os in Ubuntu CentOS Slackware Kali
do
  echo $os
done

#!/bin/bash
for file in *.txt
do
  echo "file>> $file"
  cat $file
done

#!/bin/bash
for ((i=0;i<=50;i++))
do
  echo "i = $i"
done
