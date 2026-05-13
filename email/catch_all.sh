#!/bin/bash
# Email Toolkit — Catch-all detection
# =====================================
# Usage: export TOOLKITAPI_KEY=tk_live_...; bash catch_all.sh
set -euo pipefail
API_KEY="${TOOLKITAPI_KEY:-}"; if [ -z "$API_KEY" ]; then echo "Error: TOOLKITAPI_KEY is not set" >&2; exit 1; fi
DOMAIN="github.com"
curl -sf -H "X-API-Key: ${API_KEY}" -H "Accept: application/json" \
  "https://email.toolkitapi.io/v1/email/catch-all?domain=${DOMAIN}" | jq .
