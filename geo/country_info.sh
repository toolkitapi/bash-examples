#!/bin/bash
# Geo Toolkit — Country information
# Usage: export TOOLKITAPI_KEY=tk_live_...; bash country_info.sh
set -euo pipefail
API_KEY="${TOOLKITAPI_KEY:-}"; if [ -z "$API_KEY" ]; then echo "Error: TOOLKITAPI_KEY is not set" >&2; exit 1; fi
COUNTRY_CODE="DE"
curl -sf -H "X-API-Key: ${API_KEY}" -H "Accept: application/json" \
  "https://geo.toolkitapi.io/v1/geo/country-info?code=${COUNTRY_CODE}" | jq .
