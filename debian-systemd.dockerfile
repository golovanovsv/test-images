ARG VERSION
FROM debian:$VERSION-slim
LABEL maintainer="golovanovsv@gmail.com"

RUN apt-get update && \
    apt-get install -y systemd && \
    apt-get install --no-install-recommends -y \
    gnupg-agent \
    sudo \
    apt-transport-https \
    python3 \
    python3-pip \
    python3-setuptools \
    curl \
    ca-certificates \
    software-properties-common

RUN pip3 install --upgrade pip && pip3 install docker-compose testinfra

CMD ["/sbin/init"]
