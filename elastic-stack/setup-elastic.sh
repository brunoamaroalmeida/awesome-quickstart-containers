#!/bin/bash -xe
export DEBIAN_FRONTEND=noninteractive

# Update system and install packages
apt-get update
apt-get dist-upgrade -qy

apt-get install wget gnupg2 apt-transport-https openjdk-8-jre-headless apt-utils curl procps vim -qy
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -
echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | tee -a /etc/apt/sources.list.d/elastic-6.x.list

apt-get update && apt-get install -qy elasticsearch kibana logstash

echo "network.host: 0.0.0.0" >>  /etc/elasticsearch/elasticsearch.yml
echo "server.host: 0.0.0.0" >> /etc/kibana/kibana.yml
cp 10-logstash.conf /etc/logstash/conf.d/

update-rc.d elasticsearch defaults 95 10
update-rc.d kibana defaults 95 10
update-rc.d logstash defaults 95 10
