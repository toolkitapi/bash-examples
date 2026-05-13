#!/bin/bash
# Scrape Toolkit — Mobile-friendly check
# Usage: export TOOLKITAPI_KEY=tk_live_...; bash seo_mobile_friendly.sh
set -euo pipefail
API_KEY="${TOOLKITAPI_KEY:-}"; if [ -z "$API_KEY" ]; then echo "Error: TOOLKITAPI_KEY is not set" >&2; exit 1; fi
curl -sf -H "X-API-Key: ${API_KEY}" -H "Accept: application/json" \
  "https://scrape.toolkitapi.io/v1/scrape/mobile-friendly?url=https%3A%2F%2Ftoolkitapi.io" | jq .
