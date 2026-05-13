#!/bin/bash
# Auth Toolkit — Password strength analysis
# Usage: export TOOLKITAPI_KEY=tk_live_...; bash password_strength.sh
set -euo pipefail
API_KEY="${TOOLKITAPI_KEY:-}"; if [ -z "$API_KEY" ]; then echo "Error: TOOLKITAPI_KEY is not set" >&2; exit 1; fi
curl -sf -X POST -H "X-API-Key: ${API_KEY}" -H "Accept: application/json" \
  -H "Content-Type: application/json" \
  -d '{"password":"P@ssw0rd"}' \
  "https://auth.toolkitapi.io/v1/auth/password-strength" | jq .
