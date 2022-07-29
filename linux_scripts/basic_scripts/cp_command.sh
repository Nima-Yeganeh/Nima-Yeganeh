echo 'note >> cp Command It’s so easy to copy files and folders directly in the Linux terminal that sometimes it can replace conventional file managers. To use the cp command, just type it along with the source and destination files: cp file_to_copy.txt new_file.txt You can also copy entire directories by using the recursive flag: cp -r dir_to_copy/ new_copy_dir/'
echo 'command >> cp file_to_copy.txt new_file.txt'
touch file_to_copy.txt
cp file_to_copy.txt new_file.txt
ls -anp
mkdir dir_to_copy
touch dir_to_copy/testfile
cp -r dir_to_copy/ new_copy_dir/
ls -anp
sleep 2

