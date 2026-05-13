#!/bin/bash
# Email Toolkit — Normalize an email address
# Usage: export TOOLKITAPI_KEY=tk_live_...; bash normalize.sh
set -euo pipefail
API_KEY="${TOOLKITAPI_KEY:-}"; if [ -z "$API_KEY" ]; then echo "Error: TOOLKITAPI_KEY is not set" >&2; exit 1; fi
EMAIL="user.name+tag@gmail.com"
curl -sf -H "X-API-Key: ${API_KEY}" -H "Accept: application/json" \
  "https://email.toolkitapi.io/v1/email/normalize?email=${EMAIL}" | jq .
