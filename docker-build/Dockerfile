FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && apt-get install -y curl libstdc++6 lua5.3 liblua5.3-0 gosu && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Create beammp user and directories
RUN useradd -m -s /bin/bash beammp && \
    mkdir -p /beamroot/configs /beamroot/bin /beamroot/beammp/Resources/Client /beamroot/beammp/Resources/Server && \
    chown -R beammp:beammp /beamroot

WORKDIR /beamroot

# Download BeamMP server binary
RUN DOWNLOAD_URL=$(curl -s https://api.github.com/repos/BeamMP/BeamMP-Server/releases/latest | \
        grep -oP '"browser_download_url": "\K[^"]*BeamMP-Server.ubuntu.22.04.x86_64[^"]*') && \
    curl -LO "$DOWNLOAD_URL" && \
    FILENAME=$(basename "$DOWNLOAD_URL") && \
    mv "$FILENAME" bin/BeamMP-Server && \
    chmod +x bin/BeamMP-Server

# Copy entrypoint and configs
COPY entrypoint.sh /beamroot/entrypoint.sh
RUN chmod +x /beamroot/entrypoint.sh
COPY configs /beamroot/configs

ENTRYPOINT ["/beamroot/entrypoint.sh"]

# Default CMD
CMD []
