#!/bin/bash
# DNS Toolkit — Lookup DNS records
# ==================================
# Look up A, AAAA, MX, TXT, CNAME, NS, SOA, CAA, or SRV records for a domain.
#
# Usage:
#   export TOOLKITAPI_KEY=tk_live_...
#   bash lookup.sh

set -euo pipefail

API_KEY="${TOOLKITAPI_KEY:-}"
if [ -z "$API_KEY" ]; then echo "Error: TOOLKITAPI_KEY is not set" >&2; exit 1; fi

DOMAIN="github.com"
RECORD_TYPE="A"  # Change to MX, TXT, AAAA, NS, etc.

curl -sf \
  -H "X-API-Key: ${API_KEY}" \
  -H "Accept: application/json" \
  "https://dns.toolkitapi.io/v1/lookup?domain=${DOMAIN}&type=${RECORD_TYPE}" \
  | jq .
