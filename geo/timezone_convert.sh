#!/bin/bash
# Geo Toolkit — Timezone conversion
# Usage: export TOOLKITAPI_KEY=tk_live_...; bash timezone_convert.sh
set -euo pipefail
API_KEY="${TOOLKITAPI_KEY:-}"; if [ -z "$API_KEY" ]; then echo "Error: TOOLKITAPI_KEY is not set" >&2; exit 1; fi
curl -sf -H "X-API-Key: ${API_KEY}" -H "Accept: application/json" \
  "https://geo.toolkitapi.io/v1/geo/timezone-convert?timestamp=2026-06-15T14%3A30%3A00&from=America%2FNew_York&to=Asia%2FTokyo" | jq .
