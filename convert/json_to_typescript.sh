#!/bin/bash
# Convert Toolkit — JSON to TypeScript interfaces
# Usage: export TOOLKITAPI_KEY=tk_live_...; bash json_to_typescript.sh
set -euo pipefail
API_KEY="${TOOLKITAPI_KEY:-}"; if [ -z "$API_KEY" ]; then echo "Error: TOOLKITAPI_KEY is not set" >&2; exit 1; fi
curl -sf -X POST -H "X-API-Key: ${API_KEY}" -H "Accept: application/json" \
  -H "Content-Type: application/json" \
  -d '{"data":{"user":{"id":1,"name":"Alice","email":"alice@example.com","active":true}}}' \
  "https://convert.toolkitapi.io/v1/convert/json-to-typescript" | jq .
