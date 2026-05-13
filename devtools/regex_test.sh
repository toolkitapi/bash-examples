#!/bin/bash
# DevTools Toolkit — Regex test
# Usage: export TOOLKITAPI_KEY=tk_live_...; bash regex_test.sh
set -euo pipefail
API_KEY="${TOOLKITAPI_KEY:-}"; if [ -z "$API_KEY" ]; then echo "Error: TOOLKITAPI_KEY is not set" >&2; exit 1; fi
curl -sf -X POST -H "X-API-Key: ${API_KEY}" -H "Accept: application/json" \
  -H "Content-Type: application/json" \
  -d '{"pattern":"\\b\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\b","text":"Server at 192.168.1.1 and backup at 10.0.0.254 are online."}' \
  "https://dev.toolkitapi.io/v1/regex-test" | jq .
