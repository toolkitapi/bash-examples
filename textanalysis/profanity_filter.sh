#!/bin/bash
# Text Analysis Toolkit — Profanity filter
# Usage: export TOOLKITAPI_KEY=tk_live_...; bash profanity_filter.sh
set -euo pipefail
API_KEY="${TOOLKITAPI_KEY:-}"; if [ -z "$API_KEY" ]; then echo "Error: TOOLKITAPI_KEY is not set" >&2; exit 1; fi
curl -sf -X POST -H "X-API-Key: ${API_KEY}" -H "Accept: application/json" \
  -H "Content-Type: application/json" \
  -d '{"text":"This is a clean sentence with no bad words in it at all."}' \
  "https://textanalysis.toolkitapi.io/v1/text/profanity" | jq .
