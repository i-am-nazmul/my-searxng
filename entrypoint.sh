#!/bin/bash
tor --RunAsDaemon 1
sleep 3
exec /usr/local/searxng/docker-entrypoint.sh