ARG VERSION=9
FROM oraclelinux:$VERSION
LABEL maintainer="golovanovsv@gmail.com"

RUN yum install -y systemd && \
    yum install -y \
      bind-utils \
      ca-certificates \
      curl \
      # Ansible requires the iproute2 package for network facts to be populated
      iproute \
      iputils \
      # Ansible requires for modprobe module
      kmod \
      net-tools \
      openssh-server \
      python3 \
      python3-pip \
      python3-setuptools \
      rsyslog \
      sudo \
      vim-enhanced && \
    yum clean all

RUN pip3 install --no-cache-dir --upgrade pip && \
    pip3 install --no-cache-dir docker-compose testinfra

CMD ["/lib/systemd/systemd"]
