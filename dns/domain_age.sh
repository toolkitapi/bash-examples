#!/bin/bash
# DNS Toolkit — Domain age
# =========================
# Returns how old a domain is based on its WHOIS creation date.
#
# Usage:
#   export TOOLKITAPI_KEY=tk_live_...
#   bash domain_age.sh

set -euo pipefail

API_KEY="${TOOLKITAPI_KEY:-}"
if [ -z "$API_KEY" ]; then echo "Error: TOOLKITAPI_KEY is not set" >&2; exit 1; fi

DOMAIN="github.com"

curl -sf \
  -H "X-API-Key: ${API_KEY}" \
  -H "Accept: application/json" \
  "https://dns.toolkitapi.io/v1/domain-age?domain=${DOMAIN}" \
  | jq .
