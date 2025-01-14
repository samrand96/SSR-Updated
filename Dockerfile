FROM python:3.9-slim

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# Install necessary dependencies including libsodium
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    iproute2 procps wget curl tar unzip gcc make autoconf libtool iputils-ping net-tools && \
    wget https://download.libsodium.org/libsodium/releases/libsodium-1.0.18.tar.gz && \
    tar -xzf libsodium-1.0.18.tar.gz && \
    cd libsodium-1.0.18 && \
    ./configure && make && make install && \
    ldconfig && \
    cd .. && rm -rf libsodium-1.0.18* && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy the ShadowsocksR script
COPY install_ssr.sh /usr/local/bin/install_ssr.sh
RUN chmod +x /usr/local/bin/install_ssr.sh

# Expose the default ShadowsocksR ports
EXPOSE 8388 1080

# Set ShadowsocksR service as the container's primary process
ENTRYPOINT ["/usr/local/bin/install_ssr.sh"]
CMD ["/etc/init.d/shadowsocks", "start"]
