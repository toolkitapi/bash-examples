#!/bin/bash
# Barcode Toolkit — Generate a linear barcode
# Usage: export TOOLKITAPI_KEY=tk_live_...; bash generate.sh
set -euo pipefail
API_KEY="${TOOLKITAPI_KEY:-}"; if [ -z "$API_KEY" ]; then echo "Error: TOOLKITAPI_KEY is not set" >&2; exit 1; fi
curl -sf -X POST -H "X-API-Key: ${API_KEY}" -H "Accept: application/json" \
  -H "Content-Type: application/json" \
  -d '{"data":"1234567890128","barcode_type":"CODE128","width":300,"height":100}' \
  "https://barcode.toolkitapi.io/v1/barcode/generate" | jq .
