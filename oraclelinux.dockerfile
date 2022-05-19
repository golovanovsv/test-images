ARG VERSION
FROM oraclelinux:$VERSION
LABEL maintainer="golovanovsv@gmail.com"

RUN yum install -y oracle-softwarecollection-release-el6 scl-utils && \
    yum install -y \
      sudo \
      rh-python36 \
      curl \
      ca-certificates \
      # Для 6 версии oraclelinux часть PIP пакетов уже не собирается во wheel-пакеты
      gcc && \
      ln -sf /opt/rh/rh-python36/root/usr/bin/python3 /usr/bin/python3 && \
      ln -sf /opt/rh/rh-python36/root/usr/bin/pip3 /usr/bin/pip3 && \
      ln -sf /opt/rh/rh-python36/root/usr/bin/pip3 /usr/bin/pip

RUN pip3 install --upgrade pip && \
    pip3 install docker-compose testinfra

CMD ["/sbin/init"]
