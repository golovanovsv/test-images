ARG VERSION
FROM debian:$VERSION-slim
LABEL maintainer="golovanovsv@gmail.com"

ARG VERSION

RUN apt-get update && \
    apt-get install --no-install-recommends -y systemd && \
    apt-get install --no-install-recommends -y \
    gnupg \
    gnupg-agent \
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
    software-properties-common && \
    # Для 9 (stretch) версии debian часть PIP пакетов уже не собирается во wheel-пакеты
    if [ $VERSION = "stretch" ]; then \
      apt-get install --no-install-recommends -y \
        gcc-multilib \
        python3-dev \
        libffi-dev; fi

RUN pip3 install --upgrade pip && pip3 install docker-compose

CMD ["/lib/systemd/systemd"]
