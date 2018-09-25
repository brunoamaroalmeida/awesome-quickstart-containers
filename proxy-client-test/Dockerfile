FROM debian:latest
LABEL maintainer="Bruno Amaro Almeida | brunoamaro.com"

# Set the working directory to /app
WORKDIR /app
# Copy the current directory contents into the container at /app
ADD . /app

RUN apt-get update && apt-get install wget curl -qy

ENTRYPOINT  bash run-test.sh
