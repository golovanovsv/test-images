ARG VERSION
FROM amazonlinux:$VERSION
LABEL maintainer="golovanovsv@gmail.com"

RUN yum install -y \
      ca-certificates \
      curl \
      mcedit \
      net-tools \
      openssh-server \
      python3 \
      rsyslog \
      sudo
      
RUN pip3 install --upgrade pip && pip3 install docker-compose testinfra

CMD ["/lib/systemd/systemd"]
