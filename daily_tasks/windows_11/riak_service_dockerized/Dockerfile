# syntax=docker/dockerfile:1
# Riak
#
# VERSION       0.1.1
# Use the Ubuntu parent image provided by dotCloud
FROM ubuntu:latest
# Install Riak repository before we do apt-get update, so that update happens
# in a single step
RUN apt-get update -y
RUN apt-get install -q -y curl wget gnupg
#RUN curl -fsSL https://packagecloud.io/install/repositories/basho/riak/script.deb | bash
#RUN curl -O https://packagecloud.io/install/repositories/basho/riak/script.deb.sh
#RUN bash script.deb.sh
#RUN curl -L https://packagecloud.io/gpg.key | apt-key add –
RUN wget --quiet -O - https://packagecloud.io/gpg.key | apt-key add -
#RUN echo 'deb https://packagecloud.io/basho/riak/ubuntu/ trusty main' | tee -a /etc/apt/sources.list.d/riak.list
#RUN echo 'deb-src https://packagecloud.io/basho/riak/ubuntu/ trusty main' | tee -a /etc/apt/sources.list.d/riak.list
RUN apt-get update -y
RUN apt-get install -y git
RUN git clone https://github.com/basho/riak.git
RUN cd riak
RUN apt-get install -y make build-essential
#RUN make locked-deps
#RUN make rel
#RUN make
#RUN apt-get install -y riak
#RUN apt-get install -y riak=2.1.1-1

# Install and setup project dependencies
RUN apt-get update && \
    apt-get install -y supervisor
#RUN apt-get install -y riak=2.0.5-1

RUN mkdir -p /var/log/supervisor

RUN locale-gen en_US en_US.UTF-8

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Configure Riak to accept connections from any host
RUN sed -i "s|listener.http.internal = 127.0.0.1:8098|listener.http.internal = 0.0.0.0:8098|" /etc/riak/riak.conf
RUN sed -i "s|listener.protobuf.internal = 127.0.0.1:8087|listener.protobuf.internal = 0.0.0.0:8087|" /etc/riak/riak.conf

# Expose Riak Protocol Buffers and HTTP interfaces
EXPOSE 8087 8098

CMD ["/usr/bin/supervisord"]
