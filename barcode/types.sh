#!/bin/bash
# Barcode Toolkit — List supported barcode types
# Usage: export TOOLKITAPI_KEY=tk_live_...; bash types.sh
set -euo pipefail
API_KEY="${TOOLKITAPI_KEY:-}"; if [ -z "$API_KEY" ]; then echo "Error: TOOLKITAPI_KEY is not set" >&2; exit 1; fi
curl -sf -H "X-API-Key: ${API_KEY}" -H "Accept: application/json" \
  "https://barcode.toolkitapi.io/v1/barcode/types" | jq .
