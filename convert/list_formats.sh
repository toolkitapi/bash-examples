#!/bin/bash
# Convert Toolkit — List all supported formats
# Usage: export TOOLKITAPI_KEY=tk_live_...; bash list_formats.sh
set -euo pipefail
API_KEY="${TOOLKITAPI_KEY:-}"; if [ -z "$API_KEY" ]; then echo "Error: TOOLKITAPI_KEY is not set" >&2; exit 1; fi
curl -sf -H "X-API-Key: ${API_KEY}" -H "Accept: application/json" \
  "https://convert.toolkitapi.io/v1/convert/formats" | jq .
