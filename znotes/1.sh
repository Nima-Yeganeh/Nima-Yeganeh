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

#!/bin/bash
DROPPED_IPS="1.2.3.1 1.2.3.2 1.2.3.3"
for ip in $DROPPED_IPS
do
  echo "Dropping packets from $ip"
  iptables -I INPUT -s $ip -j DROP
done

#!/bin/bash
for ip in $(cat ips_to_block.txt)
do
  echo "Dropping packets from $ip"
  sudo iptables -I INPUT -s $ip -j DROP
done
sudo iptables --list | grep DROP

#!/bin/bash
i=0
while [[ $i -lt 10 ]]
do
  echo "i: $i"
  ((i++))
done

#!/bin/bash
a=1
b=2
c=$((a+b))
echo $c
let d=a+b
echo $d

#!/bin/bash
while [ 1 -eq 1 ]
do
  echo "Infinite loop, press cntrl+c to exit..."
  sleep 1
done

#!/bin/bash
while true
do
  echo "Infinite loop, press cntrl+c to exit..."
  sleep 1
done

#!/bin/bash
#process_monitoring_test_by_name
while :
do
  output="$(pgrep -l $1)"
  if [[ -n "$output" ]]
  then
    echo "$1 >> running"
  else
    echo "$1 >> not running"
  fi
  sleep 3
done

#!/bin/bash
#get_service_pid
systemctl status $1 | grep PID

#!/bin/bash
while true; do echo "infinite loop!"; sleep 1; done

#!/bin/bash
echo -n "pet?"
read PET
case "$PET" in
  dog)
    echo "dog!"
    ;;
  cat|Cat)
    echo "cat!"
    ;;
  fish|"African Turtle")
    echo "fish!"
    ;;
  *)
    echo "unknown!"
esac

#!/bin/bash
if [[ $# -ne 2 ]]
then
  echo "run >> with 2 args >> sig + pid"
fi
case "$1" in
  1)
    kill -SIGHUP $2
    ;;
  2)
    kill -SIGINT $2
    ;;
  15)
    kill -15 $2
    ;;
  *)
    echo "not done!"
    ;;
esac

#!/bin/bash
function print_it () {
  echo "print func"
}
display_it () {
  echo "display func"
}
print_it
display_it

#!/bin/bash
create_files () {
  echo "file >> $1"
  touch $1
  chmod 400 $1
  echo "file >> $2"
  touch $2
  chmod 600 $2
  return 10
}
create_files aa.txt bb.txt
echo $?

#!/bin/bash
function lines_in_file () {
  grep -c "$1" "$2"
}
n=$(lines_in_file "usb" "/var/log/dmesg")
echo $n

#!/bin/bash
var1="AA"
var2="BB"
function func1() {
  echo "func1 >> var1=$var1 and var2=$var2"
}
func1

#!/bin/bash
var1="AA"
var2="BB"
function func1() {
  var1="XX"
  local var2="YY"
  echo "func1 >> var1=$var1 and var2=$var2"
}
func1
echo "after calling func1 >> var1=$var1 and var2=$var2"

#!/bin/bash
PS3="Your country:"
select COUNTRY in Germany France USA "United Kingdom"
do
  echo "COUNTRY is $COUNTRY"
  echo "REPLY is $REPLY"
done

#!/bin/bash
PS3="Your country:"
select COUNTRY in Germany France USA "United Kingdom" Quit
do
  case $REPLY in
    1)
      echo "german"
      ;;
    2)
      echo "french"
      ;;
    3)
      echo "american"
      ;;
    4)
      echo "british"
      ;;
    5)
      echo "quit"
      break
      ;;
    *)
      echo "invalid"
      ;;
  esac
done

#!/bin/bash
#system_admin_script_test
PS3="your choice:"
select ITEM in "add_user" "list_proc" "kill_proc" "install_prog" "quit"
do
if [[ $REPLY -eq 1 ]]
then
  read -p "username: " username
  output="$(grep -w $username /etc/passwd)"
  if [[ -n "$output" ]]
  then
    echo "$username >> exist err"
  else
    sudo useradd -m -d /bin/bash "$username"
    if [[ $? -eq 0 ]]
    then
      echo "$username >> added >> done!"
      tail -n 1 /etc/passwd
    else
      echo "user add >> err"
    fi
  fi
elif [[ $REPLY -eq 2 ]]
then
  echo "proc >> listing"
  sleep 1
  ps -ef | more
elif [[ $REPLY -eq 3 ]]
then
  read -p "proc id to kill: " process
  pkill $process
elif [[ $REPLY -eq 4 ]]
then
  read -p "prog to install: " app
  sudo apt update && sudo apt install $app
elif [[ $REPLY -eq 5 ]]
then
  echo "quit"
  sleep 1
  exit
else
  echo "invalid"
fi
done

ssh-keygen -t rsa -b 2048 -C 'comment'
ls .ssh/
cat .ssh/id_rsa
cat .ssh/id_rsa.pub
ssh-copy-id root@SERVER_IP

cat .ssh/authorized_keys
vi /etc/ssh/sshd_config
# change PasswordAuthentication from Yes to No
systemctl restart ssh

systemctl status docker
sudo usermod -aG docker user
docker --version
docker container ls
docker image ls

docker run hello-world
docker search debian
docker search mongo
docker container run redis
docker container run httpd
docker container create -p 80:80 httpd
docker container create -p 8081:80 httpd
docker ps -a
docker rm -f myhttpdsite1 myhttpdsite2
docker container run -d -p 8081:80 --name myhttpdsite1 httpd
docker container run -d -p 8082:80 --name myhttpdsite2 httpd
docker ps
docker container run -it centos
docker container run -d -p 8080:80 --name mysite nginx

docker ps
docker container ls -a -f status=exited -q
docker container run -d -P --name mywebsite nginx
docker ps
docker container stop ID
docker continaer rm -f ID
docker system prune -a

docker container run --name=c1 centos
docker container run --name=c2 -it centos

docker container exec -it ID bash
docker container port mysite
ip a
docker container logs mysite
docker container top mysite
docker container inspect mysite
docker container inspect mysite | grep -i ipaddr

docker container run -it --name=c2 centos
docker commit -m "done" -a "name" ID docker_id/my_centos:latest
docker image tag nginx docker_id/nginx:custom
docker login
docker image push docker_id/my_centos:latest

sudo ls /var/lib/docker/overlay2
docker container ps -s

docker image build -t mynginx:1.0 .
docker container run -d -P mynginx:1.0

docker volume create mysite
docker volume ls
docker volume inspect mysite
docker container run -d --name mywebapp -p 80:80 -v mysite:/usr/share/nginx/html nginx

sudo cp /etc/passwd /var/lib/docker/volumes/mysite/_data/index.html

grub-mkpasswd-pbkdf2
ls /boot/grub/grub.cfg
ls /etc/grub.d/
cat /etc/login.defs

sudo apt install libpam-pwquality
sudo passwd --status user
sudo chage -l user
sudo usermod --expiredate 1 user
sudo usermod --expiredate 1970-01-02 user
sudo usermod --expiredate "" tux

ulimit -u
ulimit -a
$0 && $0 &

cat /etc/security/limits.conf

# project-rainbowcrack.com >> table
# download LM/NTLM/MD5 rainbow tables

sudo apt install john
unshadow /etc/passwd /etc/shadow > unshadowed.txt
john -single unshadowed.txt
john --show unshadowed.txt
john --wordlist=/usr/share/john/password.lst --rules unshadowed.txt
john -restore

apt install aide
aide -v
aide --help
cat /etc/aide/aide.conf
aideinit

apt install rkhunter
rkhunter --propupd
rkhunter --check
apt install chkrootkit
chkrootkit

apt install clamav clamav-daemon
systemctl status clamav-freshclam
systemctl status clamav-daomon
ls /var/lib/clamav
freshclam --version

systemctl start clamav-daemon
tail /var/log/clamav/clamav.log
clamdscan --fdpass /root

apt install clamtk
apt install cryptsetup

fdisk -l
dd if=/dev/urandom of=/dev/sdb status=progress
cryptosetup -y -v luksFormat /dev/sdb

cryptosetup luksOpen /dev/sdb secretdata

apt install steghide
steghide embed -cf img.jpg ef file.txt
steghide extract -sf img.jpg
sha256sum img.jpg

apt install nmap
nmap 192.168.0.1
sudo nmap -sS 192.168.0.1
nmap -sT 192.168.0.1
nmap -p 80,443 -sV 192.168.0.1
nmap -sn 192.168.0.0/24

nmap -p 22 -sV 192.168.0.1 -D 192.168.0.2,192.168.0.3,192.168.0.4

nmap -p 80 -iL hosts.txt

apt install wireshark

dig -t ns google.com
apt install bind9 bind9utils bind9-doc

cat /etc/default/named
dig -t a @localhost google.com

cat /etc/bind/named.conf.default-zones
vi
forwarders {
  8.8.8.8;
  4.2.2.4;
}

systemctl reload-or-restart bind9
dig @localhost -t a google.com

apt instlal apache2
ufw status
ufw allow 'Apache Full'

curl -4 ident.me
apt install certbot python3-certbot-apache

certbot -d domain.local

apt install apache2-utils

# exploit-db.com

sudo apt install php php-mysql libapache2-mod-php
systemctl restart apache2
php -v

vi test.php
<?php
phpinfo();
?>

sudo apt install mysql-server
systemctl status mysql
mysql_secure_installation

apt install phpmyadmin php-mbstring php-zip php-gd php-json php-curl

sudo apt install ansible
vi hosts
[servers]
vps1 ansible_host=192.168.0.2
vps2 ansible_host=192.168.0.3
vps3 ansible_host=192.168.0.4

ansible -i ./hosts --list-hosts all
ansible -i ./hosts vps1 -m ping -u user -k
sudo apt install sshpass
cat /etc/ansible/ansible.cfg
host_key_checking = False
ansible -i ./hosts servers -m ping -u user -k
ansible -i ./hosts servers -m setup -u user -k

vi hosts
[servers]
vps1 ansible_host=192.168.0.2
vps2 ansible_host=192.168.0.3
vps3 ansible_host=192.168.0.4
[servers:vars]
ansible_user=user
ansible_ssh_pass=ansible1234
ansible_become_pass=ansible123456
ansible_port=22

ansible -i ./hosts servers -m ping
ansible -i ./hosts servers -m shell -a "df -h" -u user -k

ansible -i ./hosts servers -m shell -a "lsmem"

ansible -i ./hosts servers -m shell -a "ip addr show dev eth0 | grep ether"
shell -a "ip addr show dev eth0 | grep ether | cut -d' ' -f6"
shell -a "ip addr show dev eth0 | grep ether | cut -d' ' -f6" | grep -v ">>"

vi backup.sh
#!/bin/bash
tar -czf /root/etc-$(date +%F).tar.gz /etc

ansible -i ./hosts servers -m script -a "./backup.sh" --become -K

ansible -i hosts -m apt -a "name=nmap state=present update_cache=true" -u user -k --become -K

nmap -p 80 -sV google.com

ansible -i hosts servers -m apt -a "name=nmap state=absent purge=yes update_cache=true" --become

ansible -i hosts servers -m apt -a "upgrade=full" --become

ansible -i ./hosts servers -m apt -a "name=nginx state=present update_cache=true" --become
ansible -i ./hosts servers -m service -a "name=nginx state=started" --become
ansible -i ./hosts servers -m service -a "name=nginx enabled=yes" --become

ansible -i ./hosts servers -m group -a "name=developers state=present" -become
# check >> tail -n 3 /etc/group
ansible -i ./hosts servers -m group -a "name=developers state=absent" -become

ansible -i ./hosts servers -m user -a "name=john state=present groups=developers create_home=yes comment=\"new user\"" --become
# check >> tail -n 3 /etc/passwd
ansible -i ./hosts servers -m user -a "name=john state=present groups=developers create_home=yes comment=\"new user\" shell=/bin/bash generate_ssh_key=yes ssh_key_bits=2048" --become

ansible -i ./hosts servers -m user -a "name=john state=present groups=developers,sudo,adm create_home=yes comment=\"new user\" shell=/bin/bash generate_ssh_key=yes ssh_key_bits=2048" --become
# check >> groups john

# ipfs.io/ipfs/HASH
scp -P 2299 ipfs.txt root@ip:/var/www/html/

# dist.ipfs.io
wget IPFS_LINUX_LINK
tar -xzvf file.tar.gz
cd go-ipfs
sudo ./install.sh
ipfs --version
sudo ipfs init
sudo ipfs id
sudo ipfs daemon
sudo ipfs swarm peers
sudo ipfs cat /ipfs/HASH > /home/file.ext
# localhost:5001/ipfs/webui
# github.com/ipfs/
sudo ipfs daemon
sudo ipfs add -r dir/
sudo ipfs ls HASH
sudo ipfs add file.txt
sudo ipfs pin ls --type=all

# puttygen.ext
# save file >> sshkey.pub and sshprivatekey.ppk

ssh-keygen -b 2048 -t rsa -C "linux user key"
cat /home/user/.ssh/id_rsa
cat /home/user/.ssh/id_rsa.pub

ls -anp home/user/.ssh/

vi /home/user/.ssh/authorized_keys
# copy public key
ssh -v IP
