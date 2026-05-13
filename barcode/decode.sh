#!/bin/bash
# Barcode Toolkit — Decode a barcode from an image URL
# Usage: export TOOLKITAPI_KEY=tk_live_...; bash decode.sh
set -euo pipefail
API_KEY="${TOOLKITAPI_KEY:-}"; if [ -z "$API_KEY" ]; then echo "Error: TOOLKITAPI_KEY is not set" >&2; exit 1; fi
BARCODE_URL="https://upload.wikimedia.org/wikipedia/commons/8/84/EAN13.svg"
curl -sf -X POST -H "X-API-Key: ${API_KEY}" -H "Accept: application/json" \
  -H "Content-Type: application/json" \
  -d "{\"url\":\"${BARCODE_URL}\"}" \
  "https://barcode.toolkitapi.io/v1/barcode/decode" | jq .
