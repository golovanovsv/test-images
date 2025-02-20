ARG VERSION=24.04
FROM golovanovsv/ubuntu:$VERSION-systemd
LABEL maintainer="golovanovsv@gmail.com"

RUN mkdir -p /etc/apt/keyrings && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null && \
    apt-get update && \
    apt-get install --no-install-recommends -y \
      containerd.io \
      dnsutils \
      docker-buildx-plugin \
      docker-ce \
      docker-ce-cli \
      docker-compose-plugin && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

VOLUME [ "/var/lib/docker" ]
