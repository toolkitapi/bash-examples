#!/bin/bash
# Convert Toolkit — Convert spreadsheet formats
# Usage: export TOOLKITAPI_KEY=tk_live_...; bash spreadsheet.sh
set -euo pipefail
API_KEY="${TOOLKITAPI_KEY:-}"; if [ -z "$API_KEY" ]; then echo "Error: TOOLKITAPI_KEY is not set" >&2; exit 1; fi
curl -sf -X POST -H "X-API-Key: ${API_KEY}" -H "Accept: application/json" \
  -H "Content-Type: application/json" \
  -d '{"url":"https://raw.githubusercontent.com/datasets/s-and-p-500-companies/main/data/constituents.csv","from_format":"csv","to_format":"xlsx"}' \
  "https://convert.toolkitapi.io/v1/convert/spreadsheet" | jq .
