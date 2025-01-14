# Use a base image with Python less than 3.10
FROM python:3.9-slim

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# Install required dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    wget curl tar unzip gcc make autoconf libtool iputils-ping net-tools && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy the ShadowsocksR script to the container
COPY install.sh /usr/local/bin/install_ssr.sh
RUN chmod +x /usr/local/bin/install_ssr.sh

# Expose the default ShadowsocksR ports
EXPOSE 8388 1080

# Set the entrypoint to run the ShadowsocksR installation script
ENTRYPOINT ["/usr/local/bin/install_ssr.sh"]
