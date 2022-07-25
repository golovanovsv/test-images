ARG VERSION
FROM ubuntu:$VERSION
LABEL maintainer="golovanovsv@gmail.com"

RUN apt-get update && \
    apt-get install --no-install-recommends -y systemd && \
    apt-get install --no-install-recommends -y \
    dnsutils \
    gnupg \
    gnupg-agent \
    # Ansible requires the iproute2 package for network facts to be populated
    iproute2 \
    iputils-ping \
    sudo \
    apt-transport-https \
    mcedit \
    net-tools \
    openssh-server \
    python3 \
    python3-pip \
    python3-setuptools \
    rsyslog \
    curl \
    ca-certificates \
    software-properties-common

RUN pip3 install --upgrade pip && \
    pip3 install docker-compose testinfra

CMD ["/lib/systemd/systemd"]
