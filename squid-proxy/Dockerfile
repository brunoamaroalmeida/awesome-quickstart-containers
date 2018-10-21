FROM debian:latest
LABEL maintainer="Bruno Amaro Almeida | brunoamaro.com"

# Set the working directory to /app
WORKDIR /app
# Copy the current directory contents into the container at /app
ADD . /app

# Make port 3128 available to the world outside this container
EXPOSE 3128

RUN bash setup-squid.sh
ENTRYPOINT service squid start && sleep 10 && tail -f /var/log/squid/access.log
