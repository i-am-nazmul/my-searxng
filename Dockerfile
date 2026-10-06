FROM searxng/searxng:latest


RUN apk add --no-cache tor bash

COPY settings.yml /etc/searxng/settings.yml
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

EXPOSE 8080

ENTRYPOINT ["/entrypoint.sh"]