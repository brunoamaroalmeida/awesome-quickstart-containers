#!/bin/bash
echo "Configuration:"
echo "PROXY_SERVER=$PROXY_SERVER"
echo "PROXY_PORT=$PROXY_PORT"

echo "Setting config variables"
sed -i "s/vPROXY-SERVER/$PROXY_SERVER/g" /etc/redsocks.conf
sed -i "s/vPROXY-PORT/$PROXY_PORT/g" /etc/redsocks.conf

echo "Restarting redsocks and redirecting traffic via iptables"
/etc/init.d/redsocks restart
iptables -t nat -A OUTPUT  -p tcp --dport 21 -j REDIRECT --to-port 12345

# Run app
echo "Testing ftp access using: ftp://ftp.dei.uc.pt/"
curl ftp://ftp.dei.uc.pt/

while true; do sleep 1000; done
