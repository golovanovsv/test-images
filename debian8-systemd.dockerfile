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

RUN apt install python3-docker && pip3 install --upgrade pip && pip3 install testinfra

CMD ["/sbin/init"]
