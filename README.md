# awesome-quickstart-containers
This repository has Docker Containers to allow you a quickStart with some popular applications.
While a lot of application provide containers in the Public Docker Registry, they often lack simplicity for a quick testing. These containers are in no-way intended for staging or production usage, rather to give you a quick first insight on some applications.


# Available applications

## Elastic Stack
Contains an Elastic Search, Kibana and LogStash with pretty much the default settings, yet ready to use.

Run it with:
`docker run -p 5601:5601 -p 9200:9200 -p 5044:5044 --name elk --network mynet elastic`


## Squid Proxy
Contains an Squid Forward Proxy ready to use.

Run it with:
`docker run -p 3128:3128 --name proxy --network mynet forward-proxy`


## Squid Proxy with FileBeat
Contains an Squid Forward Proxy and a FileBeat that ships the proxy access log to an Elastic (ELK) stack.

Run it with:
`docker run -p 3128:3128 --name proxy --network mynet forward-proxy`


## Proxy client test
A simple script that will randomly visit some of the urls from the Moz's list of the top 500 domains and pages on the web ( https://moz.com/top500 ) using a proxy.

Run it with:
`docker run --network mynet client-test`
