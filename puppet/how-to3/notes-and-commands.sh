# This file will create the following Docker containers that are created from the official Puppet Labs Docker images:

# puppet: This is the Puppet server. We pass a number of environmental variables, including the URL to the PuppetDB server, which will be hosted on another Docker Container. A number of directories, including the Puppet Code, Puppet configuration and Server Data, will be mounted on separate Docker volumes.

# postgres: This is the PostgreSQL database server which will store the data for PuppetDB.

# puppetdb: This is the PuppetDB container that will store all the facts and configuration required to run the Puppet infrastructure. The actual data will be stored in the postgres container defined above. We therefore set a couple of dependencies to make sure that the previous two containers are up and running before spawning this one.

# Running the Dockerized Puppet
# You can start the Dockerized Puppet infrastructure by running the following command:

DNS_ALT_NAMES=host.exam docker-compose up -d
docker-compose up -d
