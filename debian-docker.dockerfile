ARG VERSION=12
FROM golovanovsv/debian:$VERSION-systemd
LABEL maintainer="golovanovsv@gmail.com"

RUN mkdir -p /etc/apt/keyrings && \
    curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
      $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null && \
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
