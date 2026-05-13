#!/bin/bash
# Auth Toolkit — Generate a TOTP secret and QR code
# Usage: export TOOLKITAPI_KEY=tk_live_...; bash totp_generate.sh
set -euo pipefail
API_KEY="${TOOLKITAPI_KEY:-}"; if [ -z "$API_KEY" ]; then echo "Error: TOOLKITAPI_KEY is not set" >&2; exit 1; fi
curl -sf -H "X-API-Key: ${API_KEY}" -H "Accept: application/json" \
  "https://auth.toolkitapi.io/v1/auth/totp-generate?issuer=MyApp&account_name=user%40example.com&digits=6&period=30" | jq .
