#!/bin/bash
# Scrape Toolkit — Scrape a web page
# Usage: export TOOLKITAPI_KEY=tk_live_...; bash scrape.sh
set -euo pipefail
API_KEY="${TOOLKITAPI_KEY:-}"; if [ -z "$API_KEY" ]; then echo "Error: TOOLKITAPI_KEY is not set" >&2; exit 1; fi
curl -sf -X POST -H "X-API-Key: ${API_KEY}" -H "Accept: application/json" \
  -H "Content-Type: application/json" \
  -d '{"url":"https://toolkitapi.io","type":"html"}' \
  "https://scrape.toolkitapi.io/v1/scrape" | jq .
