#!/bin/bash
# Image Toolkit — Remove background (returns JSON with upload_url)
# Usage: export TOOLKITAPI_KEY=tk_live_...; bash remove_background.sh
set -euo pipefail
API_KEY="${TOOLKITAPI_KEY:-}"; if [ -z "$API_KEY" ]; then echo "Error: TOOLKITAPI_KEY is not set" >&2; exit 1; fi
IMG="https%3A%2F%2Fpicsum.photos%2Fseed%2Ftoolkitapi%2F400%2F300.jpg"
curl -sf -H "X-API-Key: ${API_KEY}" -H "Accept: application/json" \
  "https://image.toolkitapi.io/v1/image/remove-background?url=${IMG}" | jq .
