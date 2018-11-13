FROM debian:latest
LABEL maintainer="Bruno Amaro Almeida | brunoamaro.com"

# Set the working directory to /app
WORKDIR /app
# Copy the current directory contents into the container at /app
ADD . /app

ENV PROXY_SERVER=localhost
ENV PROXY_PORT=3128

RUN apt-get update
RUN apt-get upgrade -qy
RUN apt-get install iptables redsocks curl lynx -qy
COPY redsocks.conf /etc/redsocks.conf

ENTRYPOINT /bin/bash run.sh
