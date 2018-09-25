FROM debian:latest
LABEL maintainer="Bruno Amaro Almeida | brunoamaro.com"

# Set the working directory to /app
WORKDIR /app
# Copy the current directory contents into the container at /app
ADD . /app

# Make port 9200 available outside this container
EXPOSE 9200

RUN bash setup-elastic.sh
ENTRYPOINT service elasticsearch start && service kibana start && service logstash start && tail -f /var/log/elasticsearch/elasticsearch.log
