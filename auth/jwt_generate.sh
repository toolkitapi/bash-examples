#!/bin/bash
# Auth Toolkit — Generate a JWT token
# Usage: export TOOLKITAPI_KEY=tk_live_...; bash jwt_generate.sh
set -euo pipefail
API_KEY="${TOOLKITAPI_KEY:-}"; if [ -z "$API_KEY" ]; then echo "Error: TOOLKITAPI_KEY is not set" >&2; exit 1; fi
curl -sf -X POST -H "X-API-Key: ${API_KEY}" -H "Accept: application/json" \
  -H "Content-Type: application/json" \
  -d '{"payload":{"sub":"user-123","role":"admin"},"secret":"my-signing-secret","algorithm":"HS256","expires_in":3600}' \
  "https://auth.toolkitapi.io/v1/auth/jwt-generate" | jq .
