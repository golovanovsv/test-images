ARG VERSION
FROM golovanovsv/ubuntu:$VERSION-systemd

RUN mkdir -p /etc/apt/keyrings && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null && \
    apt-get update && \
    apt-get install --no-install-recommends -y \
      dnsutils \
      docker-ce \
      docker-ce-cli \
      containerd.io \
      docker-compose-plugin \
      iputils-ping

VOLUME [ "/var/lib/docker" ]
