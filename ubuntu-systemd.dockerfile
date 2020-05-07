ARG VERSION
FROM ubuntu:$VERSION
LABEL maintainer="golovanovsv@gmail.com"

RUN apt-get update && \
    apt-get install -y systemd && \
    apt-get install --no-install-recommends -y \
    gnupg-agent \
    sudo \
    apt-transport-https \
    python3-pip \
    python3-setuptools \
    curl \
    ca-certificates \
    software-properties-common
RUN pip3 install docker-compose testinfra

CMD ["/sbin/init"]
