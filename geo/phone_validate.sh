#!/bin/bash
# Geo Toolkit — Phone number validation
# Usage: export TOOLKITAPI_KEY=tk_live_...; bash phone_validate.sh
set -euo pipefail
API_KEY="${TOOLKITAPI_KEY:-}"; if [ -z "$API_KEY" ]; then echo "Error: TOOLKITAPI_KEY is not set" >&2; exit 1; fi
PHONE="%2B14155552671"  # URL-encoded +14155552671
curl -sf -H "X-API-Key: ${API_KEY}" -H "Accept: application/json" \
  "https://geo.toolkitapi.io/v1/geo/phone-validate?number=${PHONE}" | jq .
