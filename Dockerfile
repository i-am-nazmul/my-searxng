FROM searxng/searxng:latest

USER root

# Alpine Linux package manager (explicit path se taaki environment issues na aayein)
RUN /sbin/apk update && \
    /sbin/apk add --no-cache tor bash curl

# Tor configuration: 9050 port par SOCKS5 proxy enable
RUN echo "SocksPort 0.0.0.0:9050" >> /etc/tor/torrc

COPY settings.yml /etc/searxng/settings.yml
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

EXPOSE 8080

ENTRYPOINT ["/entrypoint.sh"]