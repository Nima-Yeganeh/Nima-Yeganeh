# install-go-on-ubuntu-20
# https://go.dev/dl/
# Now that you have your link ready, first confirm that you’re in the home directory:
cd ~

# Then use curl to retrieve the tarball, making sure to replace the highlighted URL with the one you just copied. The -O flag ensures that this outputs to a file, and the L flag instructs HTTPS redirects, since this link was taken from the Go website and will redirect here before the file downloads:
curl -OL https://golang.org/dl/go1.16.7.linux-amd64.tar.gz
curl -OL https://go.dev/dl/go1.19.linux-amd64.tar.gz
sha256sum go1.16.7.linux-amd64.tar.gz
sha256sum go1.19.linux-amd64.tar.gz

# Next, use tar to extract the tarball. This command includes the -C flag which instructs tar to change to the given directory before performing any other operations. This means that the extracted files will be written to the /usr/local/ directory, the recommended location for installing Go… The x flag tells tar to extract, v tells it we want verbose output (a listing of the files being extracted), and f tells it we’ll specify a filename:
sudo tar -C /usr/local -xvf go1.19.linux-amd64.tar.gz

# First, set Go’s root value, which tells Go where to look for its files. You can do this by editing the .profile file, which contains a list of commands that the system runs every time you log in.
# Use your preferred editor to open .profile, which is stored in your user’s home directory. Here, we’ll use nano:
sudo nano ~/.profile
sudo vi ~/.profile

# Then, add the following information to the end of your file:
. . .
export PATH=$PATH:/usr/local/go/bin

# Next, refresh your profile by running the following command:
source ~/.profile
go version

# Now that Go is installed and the paths are set for your server, you can try creating your Hello, World! application to ensure that Go is working.
# First, create a new directory for your Go workspace, which is where Go will build its files:

mkdir hello
cd hello

# When importing packages, you have to manage the dependencies through the code’s own module. You can do this by creating a go.mod file with the go mod init command:
go mod init your_domain/hello
nano hello.go
vi hello.go

package main
import "fmt"
func main() {
    fmt.Println("Hello, World!")
}

go run .

# The go run command compiles and runs the Go package from a list of .go source files from the new hello directory you created and the path you imported. But, you can also use go build to make an executable file that can save you some time.

# The go run command is typically used as a shortcut for compiling and running a program that requires frequent changes. In cases where you’ve finished your code and want to run it without compiling it each time, you can use go build to turn your code into an executable binary. Building your code into an executable binary consolidates your application into a single file with all the support code necessary to execute the binary. Once you’ve built the binary executable, you can then run go install to place your program on an executable file path so you can run it from anywhere on your system. Then, your program will successfully print Hello, World! when prompted and you won’t need to compile the program again.

# Try it out and run go build. Make sure you run this from the same directory where your hello.go file is stored:

go build
./hello

# This confirms that you’ve successfully turned your hello.go code into an executable binary. However, you can only invoke this binary from within this directory. If you wanted to run this program from a different location on your server, you would need to specify the binary’s full file path in order to execute it.

# Typing out a binary’s full file path can quickly become tedious. As an alternative, you can run the go install command. This is similar to go build but instead of leaving the executable in the current directory, go install places it in the $GOPATH/bin directory, which will allow you to run it from any location on your server.

# In order to run go install successfully, you must pass it the install path of the binary you created with go build. To find the binary’s install path, run the following go list command:

go list -f ‘{{.Target}}’

# go list generates a list of any named Go packages stored in the current working directory. The f flag will cause go list to return output in a different format based on whatever package template you pass to it. This command tells it to use the Target template, which will cause go list to return the install path of any packages stored in this directory.

# This is the install path of the binary file you created with go build. This means that the directory where this binary is installed is /home/sammy/go/bin/.

# Add this install directory to your system’s shell path. Be sure to change the highlighted portion of this command to reflect the install directory of the binary on your system, if different:

export PATH=$PATH:/home/sammy/go/bin/
export PATH=$PATH:/home/nima/go/bin/

go install
hello
