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
    python \
    python-pip \
    curl \
    ca-certificates \
    software-properties-common

RUN apt install -y --no-install-recommends python-docker && pip install --upgrade 'pip<20' 'setuptools<44' && pip install 'pytest==4.6.6' 'testinfra==3.4.0'

CMD ["/lib/systemd/systemd"]
