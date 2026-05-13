#!/bin/bash
# DNS Toolkit — Domain availability check
# =========================================
# Returns whether a domain name is available to register.
#
# Usage:
#   export TOOLKITAPI_KEY=tk_live_...
#   bash available.sh

set -euo pipefail

API_KEY="${TOOLKITAPI_KEY:-}"
if [ -z "$API_KEY" ]; then echo "Error: TOOLKITAPI_KEY is not set" >&2; exit 1; fi

DOMAIN="toolkitapi-test-xyz-99999.com"  # Replace with the domain you want to check

curl -sf \
  -H "X-API-Key: ${API_KEY}" \
  -H "Accept: application/json" \
  "https://dns.toolkitapi.io/v1/available?domain=${DOMAIN}" \
  | jq .
