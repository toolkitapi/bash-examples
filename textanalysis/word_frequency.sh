#!/bin/bash
# Text Analysis Toolkit — Word frequency
# Usage: export TOOLKITAPI_KEY=tk_live_...; bash word_frequency.sh
set -euo pipefail
API_KEY="${TOOLKITAPI_KEY:-}"; if [ -z "$API_KEY" ]; then echo "Error: TOOLKITAPI_KEY is not set" >&2; exit 1; fi
curl -sf -X POST -H "X-API-Key: ${API_KEY}" -H "Accept: application/json" \
  -H "Content-Type: application/json" \
  -d '{"text":"The quick brown fox jumps over the lazy dog. The dog barked at the fox. The fox ran away quickly.","top_n":10}' \
  "https://textanalysis.toolkitapi.io/v1/text/word-frequency" | jq .
