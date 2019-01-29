FROM debian:latest
LABEL maintainer="Bruno Amaro Almeida | brunoamaro.com"

WORKDIR /
ADD . /

RUN apt-get update && apt-get install wget curl procps -qy
RUN wget -O splunk-7.2.3-06d57c595b80-linux-2.6-amd64.deb 'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=linux&version=7.2.3&product=splunk&filename=splunk-7.2.3-06d57c595b80-linux-2.6-amd64.deb&wget=true'
RUN dpkg -i splunk*.deb

# Workaround to allow Splunk to use Docker filesystem
RUN echo " " >> /opt/splunk/etc/splunk-launch.conf
RUN echo "OPTIMISTIC_ABOUT_FILE_LOCKING=1" >> /opt/splunk/etc/splunk-launch.conf

# First launch and license acceptance
RUN cat /opt/splunk/etc/splunk-launch.conf
RUN /opt/splunk/bin/splunk start --no-prompt --answer-yes --accept-license
RUN /opt/splunk/bin/splunk enable boot-start

# Enable create one seed admin account
RUN echo '[user_info]  \n\
USERNAME = admin  \n\
PASSWORD = changeme ' >>/opt/splunk/etc/system/local/user-seed.conf

# When the container start -> we start Splunk
ENTRYPOINT /etc/init.d/splunk restart && sleep infinity;
