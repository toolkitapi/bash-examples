#!/bin/bash
# DNS Toolkit — WHOIS lookup
# ===========================
# Returns RDAP/WHOIS registration data: registrar, creation date, expiry,
# nameservers, and registrant details.
#
# Usage:
#   export TOOLKITAPI_KEY=tk_live_...
#   bash whois.sh

set -euo pipefail

API_KEY="${TOOLKITAPI_KEY:-}"
if [ -z "$API_KEY" ]; then echo "Error: TOOLKITAPI_KEY is not set" >&2; exit 1; fi

DOMAIN="github.com"

curl -sf \
  -H "X-API-Key: ${API_KEY}" \
  -H "Accept: application/json" \
  "https://dns.toolkitapi.io/v1/whois?domain=${DOMAIN}" \
  | jq .
