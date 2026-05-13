#!/bin/bash
# Auth Toolkit — Verify a password against a stored hash
# Usage: export TOOLKITAPI_KEY=tk_live_...; bash verify_password.sh
set -euo pipefail
API_KEY="${TOOLKITAPI_KEY:-}"; if [ -z "$API_KEY" ]; then echo "Error: TOOLKITAPI_KEY is not set" >&2; exit 1; fi
HASH='$2b$12$0gD/ehYhcSa.RmJucefFRuzIA3ox5EedHrJ86DNweHYIu.eYMF50y'
curl -sf -X POST -H "X-API-Key: ${API_KEY}" -H "Accept: application/json" \
  -H "Content-Type: application/json" \
  -d "{\"password\":\"my-secret-password\",\"hash\":\"${HASH}\"}" \
  "https://auth.toolkitapi.io/v1/auth/verify-password" | jq .
