#!/bin/bash
# Scrape Toolkit — PageSpeed / Core Web Vitals
# Usage: export TOOLKITAPI_KEY=tk_live_...; bash seo_pagespeed.sh
set -euo pipefail
API_KEY="${TOOLKITAPI_KEY:-}"; if [ -z "$API_KEY" ]; then echo "Error: TOOLKITAPI_KEY is not set" >&2; exit 1; fi
curl -sf -H "X-API-Key: ${API_KEY}" -H "Accept: application/json" \
  "https://scrape.toolkitapi.io/v1/scrape/pagespeed?url=https%3A%2F%2Ftoolkitapi.io" | jq .
