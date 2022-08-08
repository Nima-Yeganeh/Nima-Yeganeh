# How To Install and Configure Elasticsearch on Ubuntu 
# Elasticsearch is a platform for distributed search and analysis of data in real time. It is a popular choice due to its usability, powerful features, and scalability.
sudo curl -fsSL https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo gpg --dearmor -o /usr/share/keyrings/elastic.gpg
ls -anp /usr/share/keyrings/ | grep elastic
sudo echo "deb [signed-by=/usr/share/keyrings/elastic.gpg] https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list
ls -anp /etc/apt/sources.list.d | grep elastic
sudo apt update -y
sudo apt install -y elasticsearch

sudo cat /etc/elasticsearch/elasticsearch.yml | grep network

sudo nano /etc/elasticsearch/elasticsearch.yml
sudo vi /etc/elasticsearch/elasticsearch.yml

network.host: localhost # >> /etc/elasticsearch/elasticsearch.yml

# NOT starting on installation, please execute the following statements to configure elasticsearch service to start automatically using systemd
sudo systemctl daemon-reload
sudo systemctl enable elasticsearch.service

# You can start elasticsearch service by executing
sudo systemctl start elasticsearch.service

sudo ufw allow from 198.51.100.0 to any port 9200
sudo ufw enable
sudo ufw status
curl -X GET 'http://localhost:9200'
curl -X GET 'http://localhost:9200/_nodes?pretty'

# To start using Elasticsearch, let’s first add some data. Elasticsearch uses a RESTful API, which responds to the usual CRUD commands: create, read, update, and delete. To work with it, we’ll use the cURL command again.

curl -X POST -H "Content-Type: application/json" 'http://localhost:9200/tutorial/helloworld/1' -d '{ "message": "Hello World!" }'
curl -X GET -H "Content-Type: application/json" 'http://localhost:9200/tutorial/helloworld/1'
curl -X PUT -H "Content-Type: application/json"  'localhost:9200/tutorial/helloworld/1?pretty' -d '{ "message": "Hello, People!" }'
curl -X GET -H "Content-Type: application/json" 'http://localhost:9200/tutorial/helloworld/1?pretty'


