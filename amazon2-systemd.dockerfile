ARG VERSION
FROM amazonlinux:$VERSION
LABEL maintainer="golovanovsv@gmail.com"

RUN yum install -y \
      ca-certificates \
      curl \
      # Ansible requires the iproute2 package for network facts to be populated
      iproute \
      mcedit \
      net-tools \
      openssh-server \
      python3 \
      python3-pip \
      rsyslog \
      sudo && \
    yum clean all
      
RUN pip3 install --no-cache-dir --upgrade pip && \
    pip3 install --no-cache-dir docker-compose testinfra

CMD ["/lib/systemd/systemd"]
