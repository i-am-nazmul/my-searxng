FROM searxng/searxng:latest

# Root user par switch karo taaki apt packages install ho sakein
USER root

# Tor aur bash install karo (Debian style)
RUN apt-get update && \
    apt-get install -y --no-install-recommends tor bash curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Tor ki basic configuration set karo (taaki port 9050 par SOCKS proxy open ho)
RUN echo "SocksPort 0.0.0.0:9050" >> /etc/tor/torrc

COPY settings.yml /etc/searxng/settings.yml
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

EXPOSE 8080

ENTRYPOINT ["/entrypoint.sh"]