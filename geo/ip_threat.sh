#!/bin/bash
# Geo Toolkit — IP threat intelligence
# Usage: export TOOLKITAPI_KEY=tk_live_...; bash ip_threat.sh
set -euo pipefail
API_KEY="${TOOLKITAPI_KEY:-}"; if [ -z "$API_KEY" ]; then echo "Error: TOOLKITAPI_KEY is not set" >&2; exit 1; fi
IP="1.1.1.1"
curl -sf -H "X-API-Key: ${API_KEY}" -H "Accept: application/json" \
  "https://geo.toolkitapi.io/v1/geo/ip-threat?ip=${IP}" | jq .
