
echo 'note >> ls is probably the first command every Linux user typed in their terminal. It allows you to list the contents of the directory you want (the current directory by default), including files and other nested directories. It has many options, so it might be good to get some help by using the --help flag. This flag returns all the flags you can use with ls.'
sleep 2

echo 'command >> ls'
ls
sleep 2

echo 'note >> ls -t : It sorts the file by modification time, showing the last edited file first. head -1 picks up this first file.To open the last edited file in the current directory use the combination of ls and head commands as shown below.'
sleep 2

echo 'command >> ls -t | head -1'
ls -t | head -1
sleep 2

echo 'note >> ls -l : To show long listing information about the file/directory.'
echo 'command >> ls -l'
ls -l
sleep 2

echo 'note >> ls -lh (h stands for human readable form) : To display file size in easy to read format. i.e i.e M for MB, K for KB, G for GB.'
echo 'command >> ls -lh'
ls -lh
sleep 2

echo 'note >> Display Directory Information Using ls -ld When you use “ls -l” you will get the details of directories content. But if you want the details of the directory then you can use -d option as., For example, if you use ls -l /etc will display all the files under the etc directory. But, if you want to display the information about the /etc/ directory, use -ld option as shown below.'
echo 'command >> ls -ld /etc'
ls -ld /etc
sleep 2

echo 'note >> ls -lt : To sort the file names displayed in the order of last modification time.You will be finding it handy to use it in combination with -l option.'
echo 'command >> ls -lt'
ls -lt
sleep 2

echo 'note >> ls -ltr : To sort the file names in the last modification time in reverse order. This will be showing the last edited file in the last line which will be handy when the listing goes beyond a page.'
echo 'command >> ls -ltr'
ls -ltr
sleep 2

echo 'note >> ls -a : To show all the hidden files in the directory, use ‘-a option’. Hidden files in Unix starts with ‘.’ in its file name.It will show all the files including the ‘.’ (current directory) and ‘..’ (parent directory).'
echo 'command >> ls -a'
ls -a
sleep 2

echo 'note >> ls -A : To show the hidden files, but not the ‘.’ (current directory) and ‘..’ (parent directory).'
echo 'command >> ls -A'
ls -A
sleep 2

echo 'note >> ls -R /etc/apt : To show all the files recursively. When you do this from /, it shows all the unhidden files in the whole file system recursively.'
echo 'command >> ls -R /etc/apt'
ls -R /etc/apt
sleep 2

echo 'note >> Display File Inode Number Using ls -i Sometimes you may want to know the inone number of a file for internal maintenance. Use -i option as shown below to display inone number. Using inode number you can remove files that has special characters in it’s name.'
echo 'command >> ls -i'
ls -i
sleep 2

