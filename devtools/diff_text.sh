#!/bin/bash
# DevTools Toolkit — Text diff
# Usage: export TOOLKITAPI_KEY=tk_live_...; bash diff_text.sh
set -euo pipefail
API_KEY="${TOOLKITAPI_KEY:-}"; if [ -z "$API_KEY" ]; then echo "Error: TOOLKITAPI_KEY is not set" >&2; exit 1; fi
curl -sf -X POST -H "X-API-Key: ${API_KEY}" -H "Accept: application/json" \
  -H "Content-Type: application/json" \
  -d '{"a":"Hello World\nThis is line two\nThis is line three","b":"Hello World\nThis is line 2 (changed)\nThis is line three\nNew fourth line"}' \
  "https://dev.toolkitapi.io/v1/diff" | jq .
