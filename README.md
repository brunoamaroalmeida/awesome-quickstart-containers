# awesome-quickstart-containers
This repository has Docker Containers to allow you a quickStart with some popular applications.
While a lot of application provide containers in the Public Docker Registry, they often lack simplicity for a quick testing. These containers are in no-way intended for staging or production usage, rather to give you a quick first insight on some applications.


# Available applications

## Elastic Stack
Contains an Elastic Search, Kibana and LogStash with pretty much the default settings, yet ready to use.

Run it with:
`docker run -p 5601:5601 -p 9200:9200 -p 5044:5044 --name elk --network mynet elastic`

## Splunk
Has Splunk Entreprise with free license (500Mb indexing / day).
Note: There is no persistence, ie, any data (indexes, configurations, etc) is deleted once the container stops. Do not use it for staging/production workloads.

Mount:
You can mount a local host directory to enable a easier access to data for indexing

Exposed Port:
The Web UI runs on 8000 and  HTTP Collector on 8088.

Credentials:
Default admin/changeme are enable.

Run it with:
`docker run -p 8000:8000 -p 8088:8088 --mount type=bind,source=/mydir/dump/,target=/app splunk`


## Squid Proxy
Contains an Squid Forward Proxy ready to use.

Run it with:
`docker run -p 3128:3128 --name proxy --network mynet forward-proxy`


## Squid Proxy with FileBeat
Contains an Squid Forward Proxy and a FileBeat that ships the proxy access log to an Elastic (ELK) stack.

Run it with:
`docker run -p 3128:3128 --name proxy --network mynet forward-proxy`

## Using a Proxy via iptables/redsocks
Allows any application to use a proxy transparently without any app code change.
It uses iptables to forward the traffic to a local port and redsocks to connect to a remote squid proxy.

Run it with:
 `docker run -i -t  --network mynet --privileged -e PROXY_SERVER=proxy -e PROXY_PORT=3128 proxy-via-iptables`

## Proxy client test
A simple script that will randomly visit some of the urls from the Moz's list of the top 500 domains and pages on the web ( https://moz.com/top500 ) using a proxy.

Run it with:
`docker run --network mynet client-test`
