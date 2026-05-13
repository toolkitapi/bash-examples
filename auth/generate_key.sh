#!/bin/bash
# Auth Toolkit — Generate a cryptographic key / API key / UUID
# Usage: export TOOLKITAPI_KEY=tk_live_...; bash generate_key.sh
set -euo pipefail
API_KEY="${TOOLKITAPI_KEY:-}"; if [ -z "$API_KEY" ]; then echo "Error: TOOLKITAPI_KEY is not set" >&2; exit 1; fi
KEY_TYPE="api-key"  # api-key | uuid-v4 | nanoid | secret
curl -sf -H "X-API-Key: ${API_KEY}" -H "Accept: application/json" \
  "https://auth.toolkitapi.io/v1/auth/generate-key?type=${KEY_TYPE}" | jq .
