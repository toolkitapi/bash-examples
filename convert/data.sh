#!/bin/bash
# Convert Toolkit — Convert data formats (JSON → CSV)
# Usage: export TOOLKITAPI_KEY=tk_live_...; bash data.sh
set -euo pipefail
API_KEY="${TOOLKITAPI_KEY:-}"; if [ -z "$API_KEY" ]; then echo "Error: TOOLKITAPI_KEY is not set" >&2; exit 1; fi
curl -sf -X POST -H "X-API-Key: ${API_KEY}" -H "Accept: application/json" \
  -H "Content-Type: application/json" \
  -d '{"data":[{"name":"Alice","age":30},{"name":"Bob","age":25}],"from_format":"json","to_format":"csv"}' \
  "https://convert.toolkitapi.io/v1/convert/data" | jq .
