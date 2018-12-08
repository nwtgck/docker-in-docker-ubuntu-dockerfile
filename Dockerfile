# Docker in Docker on Ubuntu 16.04

FROM ubuntu:18.04
LABEL maintainer="Ryo Ota <nwtgck@gmail.com>"

RUN apt-get update
RUN apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

RUN add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
       $(lsb_release -cs) \
       stable"

RUN apt update
RUN apt-get install -y docker-ce

ADD init.bash /init.bash

# Clean
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/init.bash"]