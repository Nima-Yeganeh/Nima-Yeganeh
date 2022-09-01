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

