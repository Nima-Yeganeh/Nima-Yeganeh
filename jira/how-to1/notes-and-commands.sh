# Running Atlassian server product on Docker
# Atlassian server products can be installed using a Docker image as well as an installer running directly on your OS.

# Objectives
# The objectives of this article are
# Starting up Jira, Confluence and Bitbucket on your client machine using Docker
# Installing each single product
# Setting up integrations between products

# Note, I keep configuration as simple as possible, therefore it's not suitable for production environment. For example, some requirements like data persistence or SSL is not supported on the configuration in this article.
# Also, I won't consider connecting via SSH to Bitbucket because it's not necessary for the objective of this article.

# Prerequisite
# Install Docker on your machine. It may be better allocating enough memory for Docker when you boot multiple containers. I confirmed steps in this article with the following environment.
# Docker Desktop
# Jira 8.4.0
# Confluence 7.0.1
# Bitbucket 6.6.1

docker run -d -p 8080:8080 atlassian/jira-software:latest
docker run -d -p 8090:8090 atlassian/confluence-server:latest
docker run -d -p 7990:7990 atlassian/bitbucket-server:latest

# Setting up integration of products
# Above step is quite simple if you want to try using single product, but it's not sufficient if you wanted to try integrations of each products.
# Because each container that is running services doesn't belong to same network and can't communicate each other.
# There would be several ways to let each container communicate. Here, I'll introduce a way to boot multiple containers in a same network utilizing docker-compose.

# Requirement
# You can try using integration functionalities by fulfilling following requirements at least.
# Each service in containers can communicate each other
# Name of each service is resolved by a unique URL

# Jira : http://jira.internal
# Confluence : http://confluence.internal
# Bitbucket : http://bitbucket.internal

# Steps
# 1. First, your client computer has to allow you to access to itself looping back your requests via the above URL.
# Easiest way to achieve this is just to add records in your hosts file.
127.0.0.1 jira.internal
127.0.0.1 confluence.internal
127.0.0.1 bitbucket.internal

# Otherwise, you can configure local DNS using dnsmasq and letting your client computer to resolve above name as 127.0.0.1.
# 2. Create following two files and put them on any new directory.
# docker-compose.yaml
version: '3' 
services: 
  jira:
    container_name: jira 
    image: atlassian/jira-software:latest 
    environment:
     - ATL_PROXY_NAME=jira.internal
     - ATL_PROXY_PORT=80
     - ATL_TOMCAT_SCHEME=http 
  confluence: 
    container_name: confluence
    image: atlassian/confluence-server:latest
    environment: 
     - ATL_PROXY_NAME=confluence.internal
     - ATL_PROXY_PORT=80
     - ATL_TOMCAT_SCHEME=http
  bitbucket: 
    container_name: bitbucket 
    image: atlassian/bitbucket-server:latest 
    environment: 
     - SERVER_PROXY_NAME=bitbucket.internal
     - SERVER_PROXY_PORT=80
     - SERVER_SCHEME=http 
  nginx: 
    container_name: nginx 
    image: nginx:latest 
    volumes:
     - ./nginx.conf:/etc/nginx/nginx.conf 
    depends_on: 
     - jira 
     - confluence 
     - bitbucket 
    ports: 
     - "80:80" 
    networks: 
      default: 
        aliases:
         - jira.internal
         - confluence.internal
         - bitbucket.internal

# nginx.conf
events {} 
http {
 server {
   server_name jira.internal;
   proxy_read_timeout 600s;
   location / {
     proxy_set_header X-Forwarded-Host $host;
     proxy_set_header X-Forwarded-Server $host;
     proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
     proxy_pass http://jira:8080;
     client_max_body_size 10M;
   }
 }
 server {
   server_name confluence.internal;
   proxy_read_timeout 600s;
   location / {
     proxy_set_header X-Forwarded-Host $host;
     proxy_set_header X-Forwarded-Server $host;
     proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
     proxy_pass http://confluence:8090;
     client_max_body_size 10M;
   }
 }
 server {
   server_name bitbucket.internal;
   proxy_read_timeout 600s;
   location / {
     proxy_set_header X-Forwarded-Host $host;
     proxy_set_header X-Forwarded-Server $host;
     proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
     proxy_pass http://bitbucket:7990;
     client_max_body_size 10M;
   }
 }
}

# 3. Now you are ready! Run following command and boot containers.
docker-compose up -d

# 4. Open "Application Link" page in Jira
# https://confluence.atlassian.com/adminjiraserver/using-applinks-to-link-to-other-applications-938846918.html
# Create application link for Confluence and Bitbucket.
# Now you can use functionalities like Jira Issue Macro or Smart Commit
# Troubleshooting
# Each Docker container consumes about 2GB so some container may not boot properly if memory is not allocated enough.
# You can configure memory allocation setting as https://docs.docker.com/config/containers/resource_constraints/

