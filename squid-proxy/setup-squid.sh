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
