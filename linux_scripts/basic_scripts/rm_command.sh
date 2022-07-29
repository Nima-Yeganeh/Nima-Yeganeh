echo 'note >> rm Command Now that you know how to copy files, it’ll be helpful to know how to remove them. You can use the rm command to remove files and directories. Be careful while using it, though, because it’s very difficult (yet not impossible) to recover files deleted this way. To delete a regular file, you’d type: rm file_to_copy.txt If you want to delete an empty directory, you can use the recursive (-r) flag: rm -r dir_to_remove/ On the other hand, to remove a directory with content inside of it, you need to use the force (-f) and recursive flags: rm -rf dir_with_content_to_remove/'
echo 'command >> rm file_to_copy.txt'
touch rm file_to_copy.txt
rm rm file_to_copy.txt
ls
sleep 2

mkdir dir_to_remove
touch dir_to_remove/testfile
ls -anp
rm -rf dir_to_remove/
sleep 2


