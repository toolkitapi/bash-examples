#!/bin/bash
# DNS Toolkit — SSL certificate inspection
# ==========================================
# Returns TLS certificate details: issuer, validity dates, SANs,
# protocol version, cipher suite, and days until expiry.
#
# Usage:
#   export TOOLKITAPI_KEY=tk_live_...
#   bash certificate.sh

set -euo pipefail

API_KEY="${TOOLKITAPI_KEY:-}"
if [ -z "$API_KEY" ]; then echo "Error: TOOLKITAPI_KEY is not set" >&2; exit 1; fi

DOMAIN="github.com"

curl -sf \
  -H "X-API-Key: ${API_KEY}" \
  -H "Accept: application/json" \
  "https://dns.toolkitapi.io/v1/certificate?domain=${DOMAIN}" \
  | jq .
