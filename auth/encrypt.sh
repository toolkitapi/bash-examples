#!/bin/bash
# Auth Toolkit — Encrypt plaintext data (AES-GCM)
# Usage: export TOOLKITAPI_KEY=tk_live_...; bash encrypt.sh
set -euo pipefail
API_KEY="${TOOLKITAPI_KEY:-}"; if [ -z "$API_KEY" ]; then echo "Error: TOOLKITAPI_KEY is not set" >&2; exit 1; fi
curl -sf -X POST -H "X-API-Key: ${API_KEY}" -H "Accept: application/json" \
  -H "Content-Type: application/json" \
  -d '{"plaintext":"Sensitive data: SSN 123-45-6789","key":"0102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f20"}' \
  "https://auth.toolkitapi.io/v1/auth/encrypt" | jq .
