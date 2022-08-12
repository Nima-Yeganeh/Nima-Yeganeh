# install-mongodb-on-ubuntu-20
# MongoDB is a document database used in many modern web applications. It is classified as a NoSQL database because it does not rely on a traditional table-based relational database structure.

# Instead, it uses JSON-like documents with dynamic schemas, meaning that, unlike relational databases, MongoDB does not require a predefined schema before you add data to a database. You can alter the schema at any time and as often as is necessary without having to set up a new database with an updated schema.

# To obtain the most recent version of this software, you must include MongoDB’s dedicated package repository to your APT sources. Then, you’ll be able to install mongodb-org, a meta-package that always points to the latest version of MongoDB.

# To start, import the public GPG key for the latest stable version of MongoDB by running the following command. If you intend to use a version of MongoDB other than 4.4, be sure to change 4.4 in the URL portion of this command to align with the version you want to install:
curl -fsSL https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -

# cURL is a command line tool available on many operating systems used to transfer data. It reads whatever data is stored at the URL passed to it and prints the content to the system’s output. In the following example, cURL prints the content of the GPG key file and then pipes it into the following sudo apt-key add - command, thereby adding the GPG key to your list of trusted keys.

# Also, note that this curl command uses the options -fsSL which, together, essentially tell cURL to fail silently. This means that if for some reason cURL isn’t able to contact the GPG server or the GPG server is down, it won’t accidentally add the resulting error code to your list of trusted keys.

apt-key list

# At this point, your APT installation still doesn’t know where to find the mongodb-org package you need to install the latest version of MongoDB.

# There are two places on your server where APT looks for online sources of packages to download and install: the sources.list file and the sources.list.d directory. sources.list is a file that lists active sources of APT data, with one source per line and the most preferred sources listed first. The sources.list.d directory allows you to add such sources.list entries as separate files.

# Run the following command, which creates a file in the sources.list.d directory named mongodb-org-4.4.list. The only content in this file is a single line reading deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse:

echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list

# deb: This means that the source entry references a regular Debian architecture. In other cases, this part of the line might read deb-src, which means the source entry represents a Debian distribution’s source code.
# [ arch=amd64,arm64 ]: This specifies which architectures the APT data should be downloaded to. In this case, it specifies the amd64 and arm64 architectures.
# https://repo.mongodb.org/apt/ubuntu: This is a URI representing the location where the APT data can be found. In this case, the URI points to the HTTPS address where the official MongoDB repository is located.
# focal/mongodb-org/4.4: Ubuntu repositories can contain several different releases. This specifies that you only want version 4.4 of the mongodb-org package available for the focal release of Ubuntu (“Focal Fossa” being the code name of Ubuntu 20.04).
# multiverse: This part points APT to one of the four main Ubuntu repositories. In this case, it’s pointing to the multiverse repository.

sudo apt update
sudo apt install mongodb-org

# if error
echo "deb http://security.ubuntu.com/ubuntu impish-security main" | sudo tee /etc/apt/sources.list.d/impish-security.list
echo "deb http://security.ubuntu.com/ubuntu impish-security main" | sudo tee /etc/apt/sources.list.d/impish-security.list
cat /etc/apt/sources.list.d/impish-security.list
sudo apt-get update
sudo apt-get install libssl1.1
sudo apt install mongodb-org
sudo rm /etc/apt/sources.list.d/impish-security.list

# if error again
wget http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.0g-2ubuntu4_amd64.deb
sudo dpkg -i ./libssl1.1_1.1.0g-2ubuntu4_amd64.deb
rm -i libssl1.1_1.1.0g-2ubuntu4_amd64.deb
sudo apt-get update
sudo apt-get install libssl1.1
sudo apt install mongodb-org

sudo apt-get install mongodb-mongosh

# The installation process described in the previous step automatically configures MongoDB to run as a daemon controlled by systemd, meaning you can manage MongoDB using the various systemctl commands. However, this installation procedure doesn’t automatically start the service.

sudo systemctl start mongod.service
sudo systemctl status mongod
sudo systemctl enable mongod

# You can further verify that the database is operational by connecting to the database server and executing a diagnostic command. The following command will connect to the database and output its current version, server address, and port. It will also return the result of MongoDB’s internal connectionStatus command:
mongo --eval 'db.runCommand({ connectionStatus: 1 })'

sudo systemctl status mongod
sudo systemctl stop mongod
sudo systemctl start mongod
sudo systemctl restart mongod
sudo systemctl disable mongod
sudo systemctl enable mongod

