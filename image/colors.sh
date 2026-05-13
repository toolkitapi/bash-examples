#!/bin/bash
# Image Toolkit — Extract dominant colors
# Usage: export TOOLKITAPI_KEY=tk_live_...; bash colors.sh
set -euo pipefail
API_KEY="${TOOLKITAPI_KEY:-}"; if [ -z "$API_KEY" ]; then echo "Error: TOOLKITAPI_KEY is not set" >&2; exit 1; fi
IMG="https%3A%2F%2Favatars.githubusercontent.com%2Fu%2F9919"
curl -sf -H "X-API-Key: ${API_KEY}" -H "Accept: application/json" \
  "https://image.toolkitapi.io/v1/image/extract/colors?url=${IMG}" | jq .
