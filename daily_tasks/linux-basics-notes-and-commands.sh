# linux-basics

# Linux is a family of free and open-source operating systems based on the Linux kernel. Operating systems based on Linux are known as Linux distributions or distros. Examples include Debian, Ubuntu, Fedora, CentOS, Gentoo, Arch Linux, and many others.

# The Linux kernel has been under active development since 1991, and has proven to be extremely versatile and adaptable. You can find computers that run Linux in a wide variety of contexts all over the world, from web servers to cell phones. Today, 90% of all cloud infrastructure and 74% of the world’s smartphones are powered by Linux.

# However, newcomers to Linux may find it somewhat difficult to approach, as Linux filesystems have a different structure than those found on Windows or MacOS. Additionally, Linux-based operating systems depend heavily on working with the command line interface, while most personal computers rely on graphical interfaces.

# A terminal is an input and output environment that presents a text-only window running a shell.

# A shell is a program that exposes the computer’s operating system to a user or program. In Linux systems, the shell presented in a terminal is a command line interpreter.

# A command line interface is a user interface (managed by a command line interpreter program) which processes commands to a computer program and outputs the results.

# When someone refers to one of these three terms in the context of Linux, they generally mean a terminal environment where you can run commands and see the results printed out to the terminal, such as this:

# Nearly all Linux distributions are compliant with a universal standard for filesystem directory structure known as the Filesystem Hierarchy Standard (FHS). The FHS defines a set of directories, each of which serve their own special function.

# The forward slash (/) is used to indicate the root directory in the filesystem hierarchy defined by the FHS.

# When a user logs in to the shell, they are brought to their own user directory, stored within /home/. This is referred to as the user’s home directory. The FHS defines /home/ as containing the home directories for regular users.

# The root user has its own home directory specified by the FHS: /root/. Note that / is referred to as the “root directory”, and that it is different from root/, which is stored within /.

# Because the FHS is the default filesystem layout on Linux machines, and each directory within it is included to serve a specific purpose, it simplifies the process of organizing files by their function.

# Linux filesystems are based on a directory tree. This means that you can create directories (which are functionally identical to folders found in other operating systems) inside other directories, and files can exist in any directory.

# To see what directory you are currently active in you can run the pwd command, which stands for “print working directory”:

pwd

# To see a list of files and directories that exist in your current working directory, run the ls command:

ls

# You can create one or more new directories within your current working directory with the mkdir command, which stands for “make directory”. For example, to create two new directories named testdir1 and testdir2, you might run the following command:

mkdir testdir1 testdir2

# Now when you run the ls command, these directories will appear in the output:

ls

# To navigate into one of these new directories, run the cd command (which stands for “change directory”) and specify the directory’s name:

cd testdir1
pwd

# However, because testdir1 and testdir2 are both held in the sammy user’s home directory, they reside in different branches of the directory tree. The cd command looks for directories within your current working directory, so this means that you cannot cd directly into the testdir2 directory you created previously while testdir1 is your working directory:

cd testdir2

cd /home/sammy/testdir2

# Note: In Linux, a tilde (~) is shorthand for the home directory of the user you’re logged in as. Knowing this, you could alternatively write the previous command like this and it would achieve the same result:

cd ~/testdir2

# Additionally, you can specify .. to change to the directory one level up in your path. To get back to your original directory:

cd ..

# You cannot use cd to interact with files; cd stands for “change directory”, and only allows you to navigate directories. You can, however, create, edit, and view the contents of files.

# One way to create a file is with the touch command. To create a new file called file.txt:

touch file.txt

# This creates an empty file with the name file.txt in your current working directory. The contents of this file are empty.

# If you decide to rename file.txt later on, you can do so with the mv command:

mv file.txt newfile.txt

# mv stands for “move” and it can move a file or directory from one place to another. By specifying the original file, file.txt, you can “move” it to a new location in the current working directory, thereby renaming it.

# It is also possible to copy a file to a new location with the cp command. If we want to bring back file.txt but keep newfile.txt, you can make a copy of newfile.txt named file.txt like this:

cp newfile.txt file.txt

# As you may have guessed, cp is short for “copy”. By copying newfile.txt to a new file called file.txt, you have replicated the original file in a new file with a different name.

# However, files are not of much use if they don’t contain anything. To edit files, a file editor is necessary.

# There are many options for file editors, all created by professionals for daily use. Such editors include vim, emacs, nano, and pico.

# nano is a suitable option for beginners: it is relatively user-friendly and doesn’t overload you with cryptic options or commands.

# To add text to file.txt with nano, run the following command:

nano file.txt

# Now that file.txt has some text within it, you can view it using cat or less.

# The cat command prints the contents of a specified file to your system’s output. Try running cat and pass the file.txt file you just edited as an argument:

cat file.txt

# Using cat to view file contents can be unwieldy and difficult to read if the file is particularly long. As an alternative, you can use the less command which will allow you to paginate the output.

# Use less to view the contents of the file.txt file, like this:

less file.txt

# Finally, to delete the file.txt file, pass the name of the file as an argument to rm:

rm file.txt

# Note: Without other options, the rm command (which stands for “remove”) cannot be used to delete directories. However, it does include the -d flag which allows you to delete empty directories:

rm -d directory

# You can also remove empty directories with the rmdir command:

rmdir directory

# If you want to delete a directory that isn’t empty, you can run rm with the -r flag. This will delete the specified directory along with of its contents, including any files and subdirectories:

rm -r directory

# However, because deleting content is a permanent action, you should only run rm with the -r option if you’re certain that you want to delete the specified directory.

# If your question has to do with a specific Linux command, the manual pages offer detailed and insightful documentation for nearly every command. To see the man page for any command, pass the command’s name as an argument to the man command:

man command
