#!/bin/bash
# DevTools Toolkit — Parse cron expression
# Usage: export TOOLKITAPI_KEY=tk_live_...; bash cron_parse.sh
set -euo pipefail
API_KEY="${TOOLKITAPI_KEY:-}"; if [ -z "$API_KEY" ]; then echo "Error: TOOLKITAPI_KEY is not set" >&2; exit 1; fi
curl -sf -H "X-API-Key: ${API_KEY}" -H "Accept: application/json" \
  "https://dev.toolkitapi.io/v1/cron-parse?expression=0+9+*+*+1-5&count=5&tz=America%2FNew_York" | jq .
