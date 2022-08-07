#installation and update on ubuntu desktop/server
node -v
sudo apt install -y nodejs
sudo apt-get install -y build-essential
sudo apt-get install -y npm
sudo apt update -y
sudo npm install -g npm
node -v

# Express is a popular framework to develop web applications in Node.
# Express is widely used and can be used to develop web applications such as Web Server, REST API Server, Streaming engine, etc.
sudo npm install express
sudo npm install --save express

sudo npm init --y
sudo npm install --save express
sudo npm install body-parser
sudo npm install --save express-session
sudo npm install --save mysql
sudo npm install --save mongodb

sudo npm ls installed
sudo npm ls stable
sudo npm ls installed stable
sudo npm ls fug
sudo npm view connect

sudo curl -i http://localhost:4000
curl -i http://localhost:8080

# Testing udp port >> 4000
echo 'hello' | nc -u -w 1 localhost 4000

# Testing udp port on multicast network
echo 'hello' | nc -u -w 1 230.1.2.3 4000

# Private key
openssl genrsa -out my.pem 1024

# Public key
openssl req -new -key my_key.pem -out my_csr.pem

# Self-signed
openssl x509 -req -in my_csr.pem -signkey my_key.pem -out my_cert.pem

# Private and Public key generation commands
openssl genrsa -out my.pem 1024
cp my.pem my_key.pem
openssl req -new -key my_key.pem -out my_csr.pem
openssl x509 -req -in my_csr.pem -signkey my_key.pem -out my_cert.pem
cp my_key.pem private_key.pem
cp my_cert.pem certificate.pem

npm install node-inspector
npm install -g mocha
npm install should
npm install async
npm install request

