#!/bin/bash
# DevTools Toolkit — Validate JSON
# Usage: export TOOLKITAPI_KEY=tk_live_...; bash json_validate.sh
set -euo pipefail
API_KEY="${TOOLKITAPI_KEY:-}"; if [ -z "$API_KEY" ]; then echo "Error: TOOLKITAPI_KEY is not set" >&2; exit 1; fi
curl -sf -X POST -H "X-API-Key: ${API_KEY}" -H "Accept: application/json" \
  -H "Content-Type: application/json" \
  -d '{"data":"{\"name\": \"Alice\", \"age\": 30, \"active\": true}"}' \
  "https://dev.toolkitapi.io/v1/json-validate" | jq .
