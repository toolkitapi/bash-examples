#!/bin/bash
# Auth Toolkit — Base64 encode data
# Usage: export TOOLKITAPI_KEY=tk_live_...; bash base64_encode.sh
set -euo pipefail
API_KEY="${TOOLKITAPI_KEY:-}"; if [ -z "$API_KEY" ]; then echo "Error: TOOLKITAPI_KEY is not set" >&2; exit 1; fi
curl -sf -X POST -H "X-API-Key: ${API_KEY}" -H "Accept: application/json" \
  -H "Content-Type: application/json" \
  -d '{"input":"Hello, World! This is a test string."}' \
  "https://auth.toolkitapi.io/v1/auth/base64-encode" | jq .
