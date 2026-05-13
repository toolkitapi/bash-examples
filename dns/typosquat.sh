#!/bin/bash
# DNS Toolkit — Typosquat detection
# ====================================
# Returns a list of lookalike domains generated using common typosquatting
# techniques (insertion, deletion, replacement, homoglyphs, etc.), plus
# whether each variant resolves to a live IP address.
#
# Usage:
#   export TOOLKITAPI_KEY=tk_live_...
#   bash typosquat.sh

set -euo pipefail

API_KEY="${TOOLKITAPI_KEY:-}"
if [ -z "$API_KEY" ]; then echo "Error: TOOLKITAPI_KEY is not set" >&2; exit 1; fi

DOMAIN="github.com"

curl -sf \
  -H "X-API-Key: ${API_KEY}" \
  -H "Accept: application/json" \
  "https://dns.toolkitapi.io/v1/typosquat?domain=${DOMAIN}" \
  | jq .
