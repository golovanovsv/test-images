ARG VERSION
FROM ubuntu:$VERSION
LABEL maintainer="golovanovsv@gmail.com"

RUN apt-get update && \
    apt-get install -y systemd && \
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
    software-properties-common

RUN UVER=$(cat /etc/os-release | grep "VERSION_ID=" | sed 's/VERSION_ID="\(.*\)\.\(.*\)"/\1/') && \
    [ "${UVER}" -le 16 ] && pip3 -q install --upgrade pip==20.3 || \
    pip3 install --upgrade pip && \
    pip3 install docker-compose testinfra

CMD ["/lib/systemd/systemd"]
