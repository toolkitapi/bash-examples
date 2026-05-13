#!/bin/bash
# Auth Toolkit — Verify and decode a JWT token
# Usage: export TOOLKITAPI_KEY=tk_live_...; bash jwt_verify.sh
set -euo pipefail
API_KEY="${TOOLKITAPI_KEY:-}"; if [ -z "$API_KEY" ]; then echo "Error: TOOLKITAPI_KEY is not set" >&2; exit 1; fi
TOKEN="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJ1c2VyLTEyMyIsInJvbGUiOiJhZG1pbiIsImVtYWlsIjoidXNlckBleGFtcGxlLmNvbSIsImV4cCI6NDEwMjQ0NDgwMH0.ZndjhWS50XzbLR3Fg4SFSF8-zSBhFW-gRb3IjsViCY0"
curl -sf -X POST -H "X-API-Key: ${API_KEY}" -H "Accept: application/json" \
  -H "Content-Type: application/json" \
  -d "{\"token\":\"${TOKEN}\",\"secret\":\"my-signing-secret\"}" \
  "https://auth.toolkitapi.io/v1/auth/jwt-verify" | jq .
