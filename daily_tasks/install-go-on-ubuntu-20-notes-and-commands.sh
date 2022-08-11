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

. . .
export PATH=$PATH:/usr/local/go/bin

source ~/.profile

go version

# Now that Go is installed and the paths are set for your server, you can try creating your Hello, World! application to ensure that Go is working.
# First, create a new directory for your Go workspace, which is where Go will build its files:

mkdir hello
cd hello

# When importing packages, you have to manage the dependencies through the code’s own module. You can do this by creating a go.mod file with the go mod init command:

go mod init your_domain/hello
nano hello.go

package main

import "fmt"

func main() {
    fmt.Println("Hello, World!")
}

go run .

# The go run command compiles and runs the Go package from a list of .go source files from the new hello directory you created and the path you imported. But, you can also use go build to make an executable file that can save you some time.
