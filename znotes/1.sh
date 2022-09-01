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
