FROM ubuntu:bionic

ENV GITFLOW_DIR=/usr/local/bin

RUN set -eux; \
    apt-get update; \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
      apt-transport-https \
      ca-certificates \
      curl \
      fish \
      git \
      jq \
      make \
      ruby \
      software-properties-common; \
    \
    git clone https://github.com/troykinsella/gitflow-avh; \
    cd gitflow-avh; \
    make install; \
    cd ..; \
    rm -rf gitflow-avh; \
    \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -; \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"; \
    apt-get update; \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
      docker-ce; \
    apt-get clean all; \
    rm -rf /var/lib/apt/lists/*
