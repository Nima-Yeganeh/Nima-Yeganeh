# How To Install Elasticsearch, Logstash, and Kibana (Elastic Stack) on Ubuntu
# The Elastic Stack — formerly known as the ELK Stack — is a collection of open-source software produced by Elastic which allows you to search, analyze, and visualize logs generated from any source in any format, a practice known as centralized logging. Centralized logging can be useful when attempting to identify problems with your servers or applications as it allows you to search through all of your logs in a single place. It’s also useful because it allows you to identify issues that span multiple servers by correlating their logs during a specific time frame.
# The Elastic Stack has four main components:
# Elasticsearch: a distributed RESTful search engine which stores all of the collected data.
# Logstash: the data processing component of the Elastic Stack which sends incoming data to Elasticsearch.
# Kibana: a web interface for searching and visualizing logs.
# Beats: lightweight, single-purpose data shippers that can send data from hundreds or thousands of machines to either Logstash or Elasticsearch.

# Installing and Configuring Elasticsearch
curl -fsSL https://artifacts.elastic.co/GPG-KEY-elasticsearch |sudo gpg --dearmor -o /usr/share/keyrings/elastic.gpg
echo "deb [signed-by=/usr/share/keyrings/elastic.gpg] https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list
sudo apt update
sudo apt install elasticsearch
sudo nano /etc/elasticsearch/elasticsearch.yml

# The elasticsearch.yml file provides configuration options for your cluster, node, paths, memory, network, discovery, and gateway. Most of these options are preconfigured in the file but you can change them according to your needs. For the purposes of our demonstration of a single-server configuration, we will only adjust the settings for the network host. Elasticsearch listens for traffic from everywhere on port 9200.
# To restrict access and therefore increase security, find the line that specifies network.host, uncomment it, and replace its value with localhost like this:
network.host: localhost
# We have specified localhost so that Elasticsearch listens on all interfaces and bound IPs. If you want it to listen only on a specific interface, you can specify its IP in place of localhost. Save and close elasticsearch.yml. If you’re using nano, you can do so by pressing CTRL+X, followed by Y and then ENTER.

sudo systemctl start elasticsearch
sudo systemctl enable elasticsearch
curl -X GET "localhost:9200"

