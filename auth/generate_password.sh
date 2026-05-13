#!/bin/bash
# Auth Toolkit — Generate a secure random password
# Usage: export TOOLKITAPI_KEY=tk_live_...; bash generate_password.sh
set -euo pipefail
API_KEY="${TOOLKITAPI_KEY:-}"; if [ -z "$API_KEY" ]; then echo "Error: TOOLKITAPI_KEY is not set" >&2; exit 1; fi
curl -sf -X POST -H "X-API-Key: ${API_KEY}" -H "Accept: application/json" \
  -H "Content-Type: application/json" \
  -d '{"length":20,"uppercase":true,"lowercase":true,"numbers":true,"symbols":true,"count":5}' \
  "https://auth.toolkitapi.io/v1/auth/generate-password" | jq .
