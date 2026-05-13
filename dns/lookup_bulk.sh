#!/bin/bash
# DNS Toolkit — Bulk DNS lookup
# ==============================
# Look up DNS records for multiple domains in a single request.
#
# Usage:
#   export TOOLKITAPI_KEY=tk_live_...
#   bash lookup_bulk.sh

set -euo pipefail

API_KEY="${TOOLKITAPI_KEY:-}"
if [ -z "$API_KEY" ]; then echo "Error: TOOLKITAPI_KEY is not set" >&2; exit 1; fi

RECORD_TYPE="MX"  # Change to A, TXT, NS, etc.

curl -sf \
  -X POST \
  -H "X-API-Key: ${API_KEY}" \
  -H "Accept: application/json" \
  -H "Content-Type: application/json" \
  -d '["github.com", "python.org", "nodejs.org"]' \
  "https://dns.toolkitapi.io/v1/lookup/bulk?type=${RECORD_TYPE}" \
  | jq .
