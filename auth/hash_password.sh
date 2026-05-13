#!/bin/bash
# Auth Toolkit — Hash a password (bcrypt)
# Usage: export TOOLKITAPI_KEY=tk_live_...; bash hash_password.sh
set -euo pipefail
API_KEY="${TOOLKITAPI_KEY:-}"; if [ -z "$API_KEY" ]; then echo "Error: TOOLKITAPI_KEY is not set" >&2; exit 1; fi
curl -sf -X POST -H "X-API-Key: ${API_KEY}" -H "Accept: application/json" \
  -H "Content-Type: application/json" \
  -d '{"password":"my-secret-password","algorithm":"bcrypt"}' \
  "https://auth.toolkitapi.io/v1/auth/hash-password" | jq .
