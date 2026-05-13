#!/bin/bash
# DNS Toolkit — Lookup all record types at once
# ===============================================
# Queries A, AAAA, MX, TXT, CNAME, NS, SOA, CAA, and SRV records in a
# single request and returns everything found.
#
# Usage:
#   export TOOLKITAPI_KEY=tk_live_...
#   bash lookup_all.sh

set -euo pipefail

API_KEY="${TOOLKITAPI_KEY:-}"
if [ -z "$API_KEY" ]; then echo "Error: TOOLKITAPI_KEY is not set" >&2; exit 1; fi

DOMAIN="github.com"

curl -sf \
  -H "X-API-Key: ${API_KEY}" \
  -H "Accept: application/json" \
  "https://dns.toolkitapi.io/v1/lookup/all?domain=${DOMAIN}" \
  | jq .
