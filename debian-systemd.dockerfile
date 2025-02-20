ARG VERSION=bookworm
FROM debian:$VERSION-slim
LABEL maintainer="golovanovsv@gmail.com"

ARG VERSION

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
      # Ansible requires for modprobe module
      kmod \
      mcedit \
      net-tools \
      openssh-server \
      python3 \
      python3-pip \
      python3-setuptools \
      rsyslog \
      software-properties-common \
      sudo && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN . /etc/os-release && \
    if [ "${VERSION_ID}" = "12" ]; then pip config set global.break-system-packages true; fi && \
    pip3 install --no-cache-dir pytest-testinfra

CMD ["/lib/systemd/systemd"]
