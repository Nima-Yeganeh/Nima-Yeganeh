echo 'note >> touch Command
The touch command allows you to update the access and modification times of the specified files.
For example, I have an old file that was last modified on April 12th:
List command showing modifying dates of a set of files.
To change its modification date to the current time, we need to use the -m flag:
touch -m old_file
Now the date matches today’s date.
List command showing new date.
Nonetheless, most of the time, you won’t use touch to modify file dates, but rather to create new empty files:
touch new_file_name'
touch -m old_file
touch new_file_name
ls -anp

