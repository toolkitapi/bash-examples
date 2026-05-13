#!/bin/bash
# DNS Toolkit — DNS health audit
# ================================
# Audits a domain's DNS configuration and returns a score, grade, and
# a list of specific checks (NS redundancy, SPF, DMARC, DNSSEC, etc.).
#
# Usage:
#   export TOOLKITAPI_KEY=tk_live_...
#   bash health.sh

set -euo pipefail

API_KEY="${TOOLKITAPI_KEY:-}"
if [ -z "$API_KEY" ]; then echo "Error: TOOLKITAPI_KEY is not set" >&2; exit 1; fi

DOMAIN="github.com"

curl -sf \
  -H "X-API-Key: ${API_KEY}" \
  -H "Accept: application/json" \
  "https://dns.toolkitapi.io/v1/health?domain=${DOMAIN}" \
  | jq .
