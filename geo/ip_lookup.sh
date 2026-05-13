#!/bin/bash
# Geo Toolkit — IP geolocation lookup
# Usage: export TOOLKITAPI_KEY=tk_live_...; bash ip_lookup.sh
set -euo pipefail
API_KEY="${TOOLKITAPI_KEY:-}"; if [ -z "$API_KEY" ]; then echo "Error: TOOLKITAPI_KEY is not set" >&2; exit 1; fi
IP="8.8.8.8"
curl -sf -H "X-API-Key: ${API_KEY}" -H "Accept: application/json" \
  "https://geo.toolkitapi.io/v1/geo/ip-lookup?ip=${IP}" | jq .
