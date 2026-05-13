#!/bin/bash
# Email Toolkit — Validate an email address
# ===========================================
# Checks deliverability, MX records, and syntax in one call.
# Usage: export TOOLKITAPI_KEY=tk_live_...; bash validate_email.sh
set -euo pipefail
API_KEY="${TOOLKITAPI_KEY:-}"; if [ -z "$API_KEY" ]; then echo "Error: TOOLKITAPI_KEY is not set" >&2; exit 1; fi
EMAIL="user@github.com"
curl -sf -H "X-API-Key: ${API_KEY}" -H "Accept: application/json" \
  "https://email.toolkitapi.io/v1/email/validate?email=${EMAIL}" | jq .
