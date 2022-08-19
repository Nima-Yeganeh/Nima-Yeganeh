# Ansible is a free, open source and on of the most popular automation tool used by system administrators and developers to configure and manage multiple servers from a central place. It helps you to build your entire infrastructure in minimal time. Installing Ansible inside a container will helps you to easily use your Ansible environment wherever you need it. You can build your Ansible container image and copy it across environments as needed.

# Individual associated with IT knows how significant Ansible is to them. It is an open source automation tool or platform that is used for fulfilling complex IT tasks, like configuration management, application deployment, intra service orchestration, and provisioning. It is widely used for multi tier deployments and its models within the IT infrastructure in one deployment. Therefore it eliminates the hassle of handling them separately.

# So, with the help of Ansible, you can get a desired state of infrastructure and crush the complexity of infrastructure scalability. It also helps in automating the entire process of infrastructure provisioning and configuration. It is usually done by handling it with the help of the code.

# Ansible Pros
# Using Ansible, you can handle any scale of infrastructure, even if it is as small as defining a package that needs to be installed on a system and as large as setting up a multi tier orchestration.

# Moreover, Ansible becomes really significant when the configuration of the server’s manual becomes a very difficult task. At this point, it helps you with:
# Managing Configuration – Ansible manages configuration by providing control at a granular level. It provides consistency in configuration management.
# Deploying Application – Ansible manages applications from development to production quite straightforwardly with just a few changes.
# Orchestration – Ansible teaches you the process of configuring infra in the entire server.
# Security And Compliance – With the assistance of Ansible, you can also deploy a security policy. It provides you with the server’s best practices.

# Advantages Of Ansible
# Ansible provides you with the following advantages:

# Simple To Learn
# Due to its simplicity, Ansible is considered the best tool for beginners as well. Its easy to learn features enable you to learn using Ansible fast. It also helps  in increasing productivity.

# Written In Python
# Since Ansible is written in Python, getting it up and using it becomes effortless in it. Also, Python is a language that is common for administration and scripting tasks. Therefore, engineers and system administrations are familiar with Python as opposed to another language, like Ruby.

# Do Not Depend On Agents
# Ansible’s agentless nature enables it to manage all the master agent communication via Standard SSH or Paramiko module. Since the Paramiko module is a Python implementation of SSH2, it is very crucial for managing nodes. Also, it restricts Ansible from using any forms of agents installed on the remote system to ensure management. This way, it reduces maintenance overheads and performance degradations by vast margins.

# YAMP Based Playbooks
# Playbooks, one of the Ansible configuration files is written in the YAML language. It makes it a perfect fit for configuration management and automation purposes as compared to other formats like JSON. This format is effortless to read, supports comments and employs the use of anchors for referencing other items.

# Ansible Galaxy
# Ansible Galaxy is a portal that acts as a central repository for locating, reusing and sharing content related to Ansible. For instance, downloading reusable Roles for installing applications and server configuration makes them ideal for use in a particular user’s playbooks. It can contribute substantially to an increase in deployment speed.

# Install Ansible using Docker Compose (Build Ansible Container) Ubuntu
# Install Docker CE
apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt update -y
apt install docker-ce -y
docker --version
docker info

# Install Docker Compose
curl -L "https://github.com/docker/compose/releases/download/v2.6.1/docker-compose-linux-x86_64" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
docker-compose --version

# Create a Dockerfile
# At this stage you will need to create two Dockerfile on your system. One is for the Ansible container and the other is for another Ubuntu containers.
# Firstly, create a directory to hold all configuration files:
mkdir ansible
mkdir ansible/ssh-enabled-ubuntu
cd ansible

nano Dockerfile
# Add the following lines:
FROM ubuntu
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y gcc python2-dev libkrb5-dev && \
    apt-get install python3-pip -y && \
    pip3 install --upgrade pip && \
    pip3 install --upgrade virtualenv && \
    pip3 install pywinrm && \
    pip3 install kerberos && \
    apt install krb5-user -y && \
    pip3 install ansible && \
    apt install openssh-server openssh-client -y && \
    apt install sshpass -y

nano ssh-enabled-ubuntu/Dockerfile
# Again here add the following lines:
FROM ubuntu:16.04
RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'rootpassword' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

# Create a Docker-Compose File to Launch Ansible Container
# Now, you will need to create a Docker Compose file to launch both container. You can create it inside the ansible directory:
nano ansible/docker-compose.yml
# Add the following configurations:
version: '3'
services:
      ansible:
        container_name: ansible
        image: ansible
        tty: true
        stdin_open: true
        build:
          context: ./
      remote-host-one:
        container_name: remote-host-one
        image: remote-host-ssh
        build:
          context: ./ssh-enabled-ubuntu
networks:
      net:

# Launch Ansible Container
# At this point, all the configuration files are ready to launch the Ansible container. You can now change the directory to ansible and run the following command to launch the Ansible container:

cd ansible
docker-compose up -d
docker images
docker ps

# Connect to the Ansible Container
docker exec -it 324f1c88f928 bash
ansible --version
ssh root@remote-host-one
