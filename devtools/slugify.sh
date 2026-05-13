#!/bin/bash
# DevTools Toolkit — Slugify a string
# Usage: export TOOLKITAPI_KEY=tk_live_...; bash slugify.sh
set -euo pipefail
API_KEY="${TOOLKITAPI_KEY:-}"; if [ -z "$API_KEY" ]; then echo "Error: TOOLKITAPI_KEY is not set" >&2; exit 1; fi
curl -sf -X POST -H "X-API-Key: ${API_KEY}" -H "Accept: application/json" \
  -H "Content-Type: application/json" \
  -d '{"text":"Hello World! This is a Test String — with punctuation."}' \
  "https://dev.toolkitapi.io/v1/slug" | jq .
