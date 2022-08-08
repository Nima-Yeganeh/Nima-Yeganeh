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

sudo ufw app list
sudo ufw allow OpenSSH
sudo ufw enable
sudo ufw status

# Install Java with Apt on Ubuntu
sudo apt update
java -version
sudo apt install -y default-jre
java -version
sudo apt install -y default-jdk
javac -version
sudo update-alternatives --config java
sudo update-alternatives --config javac
sudo update-alternatives --config java
sudo cat /etc/environment
# Copy the path from your preferred installation. Then open /etc/environment using nano or your favorite text editor:
# At the end of this file, add the following line, making sure to replace the highlighted path with your own copied path, but do not include the bin/ portion of the path:
sudo nano /etc/environment
sudo vi /etc/environment
JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64"
source /etc/environment
echo $JAVA_HOME

# Install Nginx on Ubuntu
sudo apt update
sudo apt install nginx
sudo ufw app list
sudo ufw allow 'Nginx HTTP'
sudo ufw status
systemctl status nginx
curl -4 icanhazip.com
sudo systemctl stop nginx
sudo systemctl start nginx
sudo systemctl restart nginx
sudo systemctl reload nginx
sudo systemctl disable nginx
sudo systemctl enable nginx
sudo mkdir -p /var/www/your_domain/html
sudo chown -R $USER:$USER /var/www/your_domain/html
sudo chmod -R 755 /var/www/your_domain
nano /var/www/your_domain/html/index.html
<html>
    <head>
        <title>Welcome to your_domain!</title>
    </head>
    <body>
        <h1>Success!  The your_domain server block is working!</h1>
    </body>
</html>

sudo nano /etc/nginx/sites-available/your_domain
server {
        listen 80;
        listen [::]:80;

        root /var/www/your_domain/html;
        index index.html index.htm index.nginx-debian.html;

        server_name your_domain www.your_domain;

        location / {
                try_files $uri $uri/ =404;
        }
}

sudo ln -s /etc/nginx/sites-available/your_domain /etc/nginx/sites-enabled/

sudo nano /etc/nginx/nginx.conf
http {
    ...
    server_names_hash_bucket_size 64;
    ...
}

sudo nginx -t
sudo systemctl restart nginx

# Important Nginx Files and Directories
# /var/www/html: The actual web content, which by default only consists of the default Nginx page you saw earlier, is served out of the /var/www/html directory. This can be changed by altering Nginx configuration files.
# /etc/nginx: The Nginx configuration directory. All of the Nginx configuration files reside here.
# /etc/nginx/nginx.conf: The main Nginx configuration file. This can be modified to make changes to the Nginx global configuration.
# /etc/nginx/sites-available/: The directory where per-site server blocks can be stored. Nginx will not use the configuration files found in this directory unless they are linked to the sites-enabled directory. Typically, all server block configuration is done in this directory, and then enabled by linking to the other directory.
# /etc/nginx/sites-enabled/: The directory where enabled per-site server blocks are stored. Typically, these are created by linking to configuration files found in the sites-available directory.
# /etc/nginx/snippets: This directory contains configuration fragments that can be included elsewhere in the Nginx configuration. Potentially repeatable configuration segments are good candidates for refactoring into snippets.
# /var/log/nginx/access.log: Every request to your web server is recorded in this log file unless Nginx is configured to do otherwise.
# /var/log/nginx/error.log: Any Nginx errors will be recorded in this log.



# Installing and Configuring the Kibana Dashboard
sudo apt install -y kibana
sudo systemctl enable kibana
sudo systemctl start kibana

# Because Kibana is configured to only listen on localhost, we must set up a reverse proxy to allow external access to it. We will use Nginx for this purpose, which should already be installed on your server. First, use the openssl command to create an administrative Kibana user which you’ll use to access the Kibana web interface. As an example we will name this account kibanaadmin, but to ensure greater security we recommend that you choose a non-standard name for your user that would be difficult to guess. The following command will create the administrative Kibana user and password, and store them in the htpasswd.users file. You will configure Nginx to require this username and password and read this file momentarily:
echo "kibanaadmin:`openssl passwd -apr1`" | sudo tee -a /etc/nginx/htpasswd.users

# Enter and confirm a password at the prompt. Remember or take note of this login, as you will need it to access the Kibana web interface. Next, we will create an Nginx server block file. As an example, we will refer to this file as your_domain, although you may find it helpful to give yours a more descriptive name. For instance, if you have a FQDN and DNS records set up for this server, you could name this file after your FQDN.
sudo nano /etc/nginx/sites-available/your_domain

# Add the following code block into the file, being sure to update your_domain to match your server’s FQDN or public IP address. This code configures Nginx to direct your server’s HTTP traffic to the Kibana application, which is listening on localhost:5601. Additionally, it configures Nginx to read the htpasswd.users file and require basic authentication.

cat /etc/nginx/sites-available/your_domain
# Delete all the existing content in the file before adding the following:
server {
    listen 80;

    server_name your_domain;

    auth_basic "Restricted Access";
    auth_basic_user_file /etc/nginx/htpasswd.users;

    location / {
        proxy_pass http://localhost:5601;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}

# Next, enable the new configuration by creating a symbolic link to the sites-enabled directory. If you already created a server block file with the same name in the Nginx prerequisite, you do not need to run this command:
sudo ln -s /etc/nginx/sites-available/your_domain /etc/nginx/sites-enabled/your_domain
sudo nginx -t

# If any errors are reported in your output, go back and double check that the content you placed in your configuration file was added correctly. Once you see syntax is ok in the output, go ahead and restart the Nginx service:
sudo systemctl reload nginx
sudo ufw allow 'Nginx Full'

# If you followed the prerequisite Nginx tutorial, you may have created a UFW rule allowing the Nginx HTTP profile through the firewall. Because the Nginx Full profile allows both HTTP and HTTPS traffic through the firewall, you can safely delete the rule you created in the prerequisite tutorial. Do so with the following command:
sudo ufw delete allow 'Nginx HTTP'

# Kibana is now accessible via your FQDN or the public IP address of your Elastic Stack server. You can check the Kibana server’s status page by navigating to the following address and entering your login credentials when prompted:
http://your_domain/status

# Installing and Configuring Logstash
# Although it’s possible for Beats to send data directly to the Elasticsearch database, it is common to use Logstash to process the data. This will allow you more flexibility to collect data from different sources, transform it into a common format, and export it to another database.
sudo apt install logstash
sudo nano /etc/logstash/conf.d/02-beats-input.conf
input {
  beats {
    port => 5044
  }
}
sudo nano /etc/logstash/conf.d/30-elasticsearch-output.conf
output {
  if [@metadata][pipeline] {
	elasticsearch {
  	hosts => ["localhost:9200"]
  	manage_template => false
  	index => "%{[@metadata][beat]}-%{[@metadata][version]}-%{+YYYY.MM.dd}"
  	pipeline => "%{[@metadata][pipeline]}"
	}
  } else {
	elasticsearch {
  	hosts => ["localhost:9200"]
  	manage_template => false
  	index => "%{[@metadata][beat]}-%{[@metadata][version]}-%{+YYYY.MM.dd}"
	}
  }
}
sudo -u logstash /usr/share/logstash/bin/logstash --path.settings /etc/logstash -t
sudo systemctl start logstash
sudo systemctl enable logstash

# Installing and Configuring Filebeat
# The Elastic Stack uses several lightweight data shippers called Beats to collect data from various sources and transport them to Logstash or Elasticsearch. Here are the Beats that are currently available from Elastic:
# Filebeat: collects and ships log files.
# Metricbeat: collects metrics from your systems and services.
# Packetbeat: collects and analyzes network data.
# Winlogbeat: collects Windows event logs.
# Auditbeat: collects Linux audit framework data and monitors file integrity.
# Heartbeat: monitors services for their availability with active probing.
sudo apt install filebeat
sudo nano /etc/filebeat/filebeat.yml
...
#output.elasticsearch:
  # Array of hosts to connect to.
  #hosts: ["localhost:9200"]
...
output.logstash:
  # The Logstash hosts
  hosts: ["localhost:5044"]
sudo filebeat modules enable system
sudo filebeat modules list
sudo filebeat setup --pipelines --modules system
sudo filebeat setup --index-management -E output.logstash.enabled=false -E 'output.elasticsearch.hosts=["localhost:9200"]'
sudo filebeat setup -E output.logstash.enabled=false -E output.elasticsearch.hosts=['localhost:9200'] -E setup.kibana.host=localhost:5601
sudo systemctl start filebeat
sudo systemctl enable filebeat
sudo systemctl enable filebeat
curl -XGET 'http://localhost:9200/filebeat-*/_search?pretty'


