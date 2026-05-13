#!/bin/bash
# Geo Toolkit — Distance between two coordinates
# Usage: export TOOLKITAPI_KEY=tk_live_...; bash distance.sh
set -euo pipefail
API_KEY="${TOOLKITAPI_KEY:-}"; if [ -z "$API_KEY" ]; then echo "Error: TOOLKITAPI_KEY is not set" >&2; exit 1; fi
curl -sf -X POST -H "X-API-Key: ${API_KEY}" -H "Accept: application/json" \
  -H "Content-Type: application/json" \
  -d '{"points":[{"lat":51.5074,"lon":-0.1278},{"lat":48.8566,"lon":2.3522}],"unit":"km"}' \
  "https://geo.toolkitapi.io/v1/geo/distance" | jq .
