ARG VERSION
FROM ubuntu:$VERSION
LABEL maintainer="golovanovsv@gmail.com"

RUN apt-get update && \
    apt-get install --no-install-recommends -y systemd && \
    apt-get install --no-install-recommends -y \
      apt-transport-https \
      ca-certificates \
      curl \
      dnsutils \
      gnupg \
      gnupg-agent \
      # Ansible requires the iproute2 package for network facts to be populated
      iproute2 \
      iputils-ping \
      sudo \
      # Ansible requires for modprobe module
      kmod \
      mcedit \
      net-tools \
      openssh-server \
      python3 \
      python3-pip \
      python3-setuptools \
      rsyslog \
      software-properties-common && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip3 install --no-cache-dir --upgrade pip && \
    pip3 install --no-cache-dir pyyaml==5.3.1 docker-compose pytest-testinfra

CMD ["/lib/systemd/systemd"]
