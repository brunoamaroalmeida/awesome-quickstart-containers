#!/bin/bash -xe
export DEBIAN_FRONTEND=noninteractive

# Update system and install packages
apt-get update
apt-get dist-upgrade -qy
apt-get install -qy squid3 squid3-common
apt-get install -qy wget gnupg2 apt-transport-https apt-utils curl vim procps

# Add our Squid configuration
cp squid.conf /etc/squid/squid.conf

# Run squid one time to create swap directories
squid3 -z
service squid restart

wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -
echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | tee -a /etc/apt/sources.list.d/elastic-6.x.list

apt-get update && apt-get install filebeat -qy

# Add our Filebeat configuration
cp /etc/filebeat/filebeat.yml /etc/filebeat/filebeat.old.yml
cp filebeat.yml /etc/filebeat/filebeat.yml
