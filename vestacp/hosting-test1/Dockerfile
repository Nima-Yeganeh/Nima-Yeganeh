FROM centos:7
LABEL maintainer="Nima Yeganeh <yeganeh.nima.d@gmail.com>"
ENV DEBIAN_FRONTEND=noninteractive
RUN yum update -y
RUN yum remove apache2* mysql* nginx* -y
RUN yum install curl -y
RUN curl -O http://vestacp.com/pub/vst-install.sh
RUN yum install sudo -y
RUN sudo chmod u+x vst-install.sh
RUN bash vst-install.sh --nginx yes --apache yes --phpfpm no --named yes --remi yes --vsftpd yes --proftpd no --iptables yes --fail2ban yes --quota no --exim yes --dovecot yes --spamassassin yes --clamav yes --softaculous yes --mysql yes --postgresql no --hostname host --email admin@domain.local --password P@ssw0rd -y no -f
VOLUME ["/vesta", "/home", "/backup"]
EXPOSE 22 25 53 54 80 110 143 443 465 587 993 995 1194 3000 3306 5432 5984 6379 8083 10022 11211 27017
