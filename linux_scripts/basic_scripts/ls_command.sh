
echo 'ls is probably the first command every Linux user typed in their terminal. It allows you to list the contents of the directory you want (the current directory by default), including files and other nested directories. It has many options, so it might be good to get some help by using the --help flag. This flag returns all the flags you can use with ls.'
sleep 2

echo 'ls'
ls
sleep 2

echo 'ls -t : It sorts the file by modification time, showing the last edited file first. head -1 picks up this first file.To open the last edited file in the current directory use the combination of ls and head commands as shown below.'
echo 'ls -t | head -1'
ls -t | head -1
sleep 2

