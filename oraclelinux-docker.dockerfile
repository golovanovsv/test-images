ARG VERSION=9
FROM golovanovsv/oraclelinux:$VERSION-systemd
LABEL maintainer="golovanovsv@gmail.com"

RUN yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo && \
    yum install -y \
      containerd.io \
      docker-buildx-plugin \
      docker-ce \
      docker-ce-cli \
      docker-compose-plugin && \
    yum clean all && \
    systemctl enable docker

VOLUME [ "/var/lib/docker" ]
