FROM ubuntu:bionic

RUN set -eux; \
    apt-get update; \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
      apt-transport-https \
      ca-certificates \
      fish \
      git \
      jq \
      software-properties-common; \
    \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -; \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"; \
    apt-get update; \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
      docker-ce; \
    apt-get clean all; \
    rm -rf /var/lib/apt/lists/*
