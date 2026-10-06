#!/bin/bash

# Tor start karo background mein
tor &

# 4-5 second wait karo taaki Tor connection ban sake
sleep 4

# SearXNG ko granian ke through boot karo
exec python3 -m searx.webapp