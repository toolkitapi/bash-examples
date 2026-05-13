#!/bin/bash
# Barcode Toolkit — Generate a QR code
# Usage: export TOOLKITAPI_KEY=tk_live_...; bash qr_generate.sh
set -euo pipefail
API_KEY="${TOOLKITAPI_KEY:-}"; if [ -z "$API_KEY" ]; then echo "Error: TOOLKITAPI_KEY is not set" >&2; exit 1; fi
curl -sf -X POST -H "X-API-Key: ${API_KEY}" -H "Accept: application/json" \
  -H "Content-Type: application/json" \
  -d '{"data":"https://toolkitapi.io","size":300}' \
  "https://barcode.toolkitapi.io/v1/barcode/qr-generate" | jq .
