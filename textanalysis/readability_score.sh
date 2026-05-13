#!/bin/bash
# Text Analysis Toolkit — Readability score
# Usage: export TOOLKITAPI_KEY=tk_live_...; bash readability_score.sh
set -euo pipefail
API_KEY="${TOOLKITAPI_KEY:-}"; if [ -z "$API_KEY" ]; then echo "Error: TOOLKITAPI_KEY is not set" >&2; exit 1; fi
curl -sf -X POST -H "X-API-Key: ${API_KEY}" -H "Accept: application/json" \
  -H "Content-Type: application/json" \
  -d '{"text":"The cat sat on the mat. It was a sunny day. The children played outside."}' \
  "https://textanalysis.toolkitapi.io/v1/text/readability" | jq .
