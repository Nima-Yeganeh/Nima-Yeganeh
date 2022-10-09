# Linux Notes

cat /etc/os-release

NAME="CentOS Linux"
VERSION="7 (Core)"
ID="centos"
ID_LIKE="rhel fedora"
VERSION_ID="7"
PRETTY_NAME="CentOS Linux 7 (Core)"
ANSI_COLOR="0;31"
CPE_NAME="cpe:/o:centos:centos:7"
HOME_URL="https://www.centos.org/"
BUG_REPORT_URL="https://bugs.centos.org/"
CENTOS_MANTISBT_PROJECT="CentOS-7"
CENTOS_MANTISBT_PROJECT_VERSION="7"
REDHAT_SUPPORT_PRODUCT="centos"
REDHAT_SUPPORT_PRODUCT_VERSION="7"

hostnamectl

   Static hostname: ftp.raha
         Icon name: computer-vm
           Chassis: vm
        Machine ID: 92a792120157402eb25c3c1581eadf3c
           Boot ID: 85ba0e0eb1d046df86f40c5cc69b3e83
    Virtualization: vmware
  Operating System: CentOS Linux 7 (Core)
       CPE OS Name: cpe:/o:centos:centos:7
            Kernel: Linux 3.10.0-1160.62.1.el7.x86_64
      Architecture: x86-64

uname -srm

Linux 3.10.0-1160.62.1.el7.x86_64 x86_64

Cd
Ls
Man
Cat
Mkdir
Chmod
Rmdir
Touch
Locate
Clear
Rm
Mv
Curl
Echo
Free
Groups
Head
Tail
History
Password
Ping
Alias
Zip
Dd
Chown
Sudo
Cal
Bc
Change
Df
Name

mkdir testfolder
chmod -R 7 test.txt
rmdir mydirectory
touch mytestfile.txt
locate -i *result*final**total*
clear
rm mytestfile.txt
curl https://github.com/torvalds/linux
free -h
groups scott
head 
history
sudo passwd jeff
ping 8.8.8.8
alias rm='rm -i'
alias
zip newfile.zip name.txt
dd if = /dev/hda of = ~/hdadisk.img
sudo chown root myfile1.txt
sudo apt-get update
cal -y
x='echo "20+7" | bc'
chage -h
df
uname -a

find . –type d -empty
find . -type f -empty
find ./ -type f –size 0
find <Path_To_Old_Files> -type f -mtime +30 | xargs rm -f
find <Path_To_Old_Files> -mtime +30 -exec rm -f {} \;
find <Path_To_Old_Files> -mtime +30 -delete;

ls --color=auto
alias ls="ls --color=auto"
unalias ls
pwd
cp -r dir_to_copy/ new_copy_dir/
rm -rf dir_with_content_to_remove/
mkdir -p movies/2004/
touch -m old_file
chmod +x script

shutdown now
shutdown 20:40
shutdown -c

htop
unzip images.zip
ps
which python
which brave
less large_text_file.txt
tail long.txt
tail -n 4 long.txt
head long.txt

head -n 5 long.txt
grep "linux" long.txt
grep -c "linux" long.txt
whoami
echo $USER
whatis python
wc long.txt
wc -w long.txt
neofetch

find [flags] [path] -name [expression]
find ./ -name "long.txt" # ./long.txt 
find ./ -type f -name "*.py"

top -n 10
top -u admin
sort
uniq
top -u tecmint
top -n 1 -b > top-output.txt

pwd
cd
tar
tail
ls
cp
mv
mkdir
touch
find
df
du
tail
diff
tar
kill
top
history
useradd
userdel

ls -l filename
cd /var/log
grep ‘failed’ transaction.log
sudo shutdown 2
sudo shutdown –r 2
passwd admin
mv first.txt second.txt
cp second.txt third.txt
rm file1
rm -r myproject
mkdir myproject
chmod 744 script.sh
chown user1 script.sh
sudo chown root script.sh
cat file.txt
cat file1.txt file2.txt
wc –l readme.txt
man grep
man mkdir
sudo apt-get update
locate file1.txt
diff file1.txt file2.txt
useradd John

curl -I -s myapplication:5000
curl -I -s database:27017
curl -I -s https://opensource.com
curl database:27017

cat test.json | python -m json.tool
cat test.json | jq

tail -n 100 /var/log/httpd/access_log
cat requirements.txt
ps -ef

env

PYTHON_PIP_VERSION=9.0.1
HOME=/root
DB_NAME=test
PATH=/usr/local/bin:/usr/local/sbin
LANG=C.UTF-8
PYTHON_VERSION=3.4.6
PWD=/
DB_URI=mongodb://database:27017/test

netstat
ip address show eth0
lsof
df -h
du -sh /var/log/*
dnf -y install httpd
id
chmod +x test.sh
nslookup mydatabase
dig mydatabase

sudo firewall-cmd --get-active-zones
sudo firewall-cmd --zone corp --list-all
sudo firewall-cmd --add-service http --permanent
sudo firewall-cmd –reload
sestatus

ssh
scp
sftp
ftp
find
chattr
setacl
getacl
cron
rsyslog
grub
rsync

sleep
ls -al
touch testfile
nano testfile
touch file.py
mkdir newDir

mkdir dir1 dir2 dir3
nano textfile
grep -c 'Linux' testfile
nano testfile
grep -c 'Linux' testfile
man echo
man echo
less trialfile
compgen -c
shuffle
compgen -c > newfile.txt
cat trialfile
head newfile.txt
tail newfile.txt
ps -ef
sudo kill 702
sleep 2

sudo apt-get install curl
curl https://raw.githubusercontent.com/smiths/linux/master/kernel/events/core.c -o core.c
cat /etc/passwd
cat -n test.txt
chown max:max trial.txt

echo $USER
echo $HOME
echo $PATH

find . -name *smith*
find . -type f -name *smith*
find . -type f -iname *smith*

uname -a
uname -s
uname -v

finger smith
finger -p smith
free -h
tar -cvf videos.tar Football/
tail example.txt
tail -n 5 example.txt
head -n 5 example.txt example2.txt
ssh Max@192.168.3.82
ps -e | grep Kazam
less example.txt
ls -R / | less
shutdown +10
shutdown -c
ps -u smith
ps -u smith | less
ping -c 5 192.168.3.18
Enable printit
cp -R directory/ football
locate me.txt
netstat -a | more
netstat -au
rsync -zvh examples.tar /tmp/football/
rsync -avz test/ root@192.168.1.105:/home/
rpm -qa
rpm -q BitTorrent
sudo ifup -av
sudo apt install screen
awk '{print}' team.txt
awk '/strikers/ {print}' team.txt

