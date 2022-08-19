FROM ubuntu:14.04
RUN apt-get update
RUN apt install software-properties-common -y
RUN apt-get update
RUN apt-add-repository ppa:brightbox/ruby-ng
RUN apt-get update
RUN apt-get -y install ruby2.6
RUN apt-get -y install wget
RUN wget https://apt.puppetlabs.com/puppetlabs-release-trusty.deb
RUN dpkg -i puppetlabs-release-trusty.deb
RUN apt-get update
RUN apt-get -y install ruby ruby-dev build-essential
RUN apt-get install curl -y
RUN curl -#LO https://rvm.io/mpapis.asc
RUN gpg --import mpapis.asc
RUN curl -sSL https://get.rvm.io | bash -s stable
RUN apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev -y
RUN apt-get install build-essential make curl -y
RUN curl -L https://get.rvm.io | bash -s stable
RUN apt-get -y update
RUN curl -sSL https://get.rvm.io | bash -s stable --rails
#RUN echo "gem: --no-ri" > ~/.gemrc
RUN echo "gem: --no-ri --no-rdoc" > ~/.gemrc
#RUN gem install --no-rdoc --no-ri puppet librarian-puppet
RUN gem install puppet librarian-puppet
ADD Puppetfile /
RUN librarian-puppet install
ADD puppetdb.pp /
RUN puppet apply --modulepath=/modules puppetdb.pp
EXPOSE 8080 8081 8082
CMD /usr/lib/jvm/java-7-openjdk-amd64/bin/java -cp /usr/share/puppetdb/puppetdb.jar clojure.main -m com.puppetlabs.puppetdb.core services -c /etc/puppetdb/conf.d
