ARG VERSION
FROM oraclelinux:$VERSION
LABEL maintainer="golovanovsv@gmail.com"

RUN yum install -y \
      sudo \
      systemd \
      python3 \
      python3-pip \
      python3-setuptools \
      curl \
      ca-certificates

RUN pip3 install docker-compose testinfra

CMD ["/lib/systemd/systemd"]
