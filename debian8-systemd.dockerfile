ARG VERSION
FROM debian:$VERSION-slim
LABEL maintainer="golovanovsv@gmail.com"

RUN apt-get update && \
    apt-get install -y systemd && \
    apt-get install --no-install-recommends -y \
    gnupg \
    gnupg-agent \
    sudo \
    apt-transport-https \
    net-tools \
    openssh-server \
    python \
    python-pip \
    rsyslog \
    curl \
    ca-certificates \
    software-properties-common

RUN apt install -y --no-install-recommends python-docker && pip install --upgrade 'pip<20' 'setuptools<44' wheel && \
    pip install 'pytest==4.6.6' 'testinfra==3.4.0' 'zipp==0.3.3' 'configparser==3.5.0'

CMD ["/lib/systemd/systemd"]
