#!/bin/bash

# Tor ko background daemon ki tarah start karo
tor --runasdaemon 1

# Tor network circuit banne ka wait karo
sleep 3

# SearXNG ke official start script ko hand-over karo
exec /usr/local/searxng/docker-entrypoint.sh