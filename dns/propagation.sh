#!/bin/bash
# DNS Toolkit — DNS propagation check
# =====================================
# Checks whether a DNS record has propagated across 20+ global resolvers.
# Useful after making DNS changes to see how widely they've spread.
#
# Usage:
#   export TOOLKITAPI_KEY=tk_live_...
#   bash propagation.sh

set -euo pipefail

API_KEY="${TOOLKITAPI_KEY:-}"
if [ -z "$API_KEY" ]; then echo "Error: TOOLKITAPI_KEY is not set" >&2; exit 1; fi

DOMAIN="github.com"
RECORD_TYPE="A"  # Change to MX, TXT, NS, etc.

curl -sf \
  -H "X-API-Key: ${API_KEY}" \
  -H "Accept: application/json" \
  "https://dns.toolkitapi.io/v1/propagation?domain=${DOMAIN}&type=${RECORD_TYPE}" \
  | jq .
