# siem-with-suricata-and-elastic-stack-on-ubuntu-20

curl -fsSL https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list
sudo apt update
sudo apt install elasticsearch kibana
ip -brief address show

sudo nano /etc/elasticsearch/elasticsearch.yml
# By default Elasticsearch is only accessible on localhost. Set a different
# address here to expose this node on the network:
#
#network.host: 192.168.0.1
network.bind_host: ["127.0.0.1", "your_private_ip"]
#
# By default Elasticsearch listens for HTTP traffic on the first free port it
# finds starting at 9200. Set a specific HTTP port here:

# Add the following highlighted lines to the end of the file:
sudo vi /etc/elasticsearch/elasticsearch.yml

discovery.type: single-node
xpack.security.enabled: true

sudo ufw allow in on eth1
sudo ufw allow out on eth1
sudo systemctl start elasticsearch.service

cd /usr/share/elasticsearch/bin
sudo ./elasticsearch-setup-passwords auto

cd /usr/share/kibana/bin/
sudo ./kibana-encryption-keys generate -q

sudo nano /etc/kibana/kibana.yml
sudo vi /etc/kibana/kibana.yml

xpack.encryptedSavedObjects.encryptionKey: 66fbd85ceb3cba51c0e939fb2526f585
xpack.reporting.encryptionKey: 9358f4bc7189ae0ade1b8deeec7f38ef
xpack.security.encryptionKey: 8f847a594e4a813c4187fa93c884e92b

sudo vi /etc/kibana/kibana.yml

# Kibana is served by a back end server. This setting specifies the port to use.
#server.port: 5601

# Specifies the address to which the Kibana server will bind. IP addresses and host names are both valid values.
# The default is 'localhost', which usually means remote machines will not be able to connect.
# To allow connections from remote users, set this parameter to a non-loopback address.
#server.host: "localhost"
server.host: "your_private_ip"

sudo ./kibana-keystore add elasticsearch.username
sudo ./kibana-keystore add elasticsearch.password
sudo systemctl start kibana.service

curl -fsSL https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list
sudo apt update
sudo apt install filebeat
sudo nano /etc/filebeat/filebeat.yml

# Starting with Beats version 6.0.0, the dashboards are loaded via the Kibana API.
# This requires a Kibana endpoint configuration.
setup.kibana:

  # Kibana Host
  # Scheme and port can be left out and will be set to the default (http and 5601)
  # In case you specify and additional path, the scheme is required: http://localhost:5601/path
  # IPv6 addresses should always be defined as: https://[2001:db8::1]:5601
  #host: "localhost:5601"
  host: "your_private_ip:5601"

output.elasticsearch:
  # Array of hosts to connect to.
  hosts: ["your_private_ip:9200"]

  # Protocol - either `http` (default) or `https`.
  #protocol: "https"

  # Authentication credentials - either API key or username/password.
  #api_key: "id:api_key"
  username: "elastic"
  password: "6kNbsxQGYZ2EQJiqJpgl"

sudo filebeat modules enable suricata
sudo filebeat setup
sudo systemctl start filebeat.service
