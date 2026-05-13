#!/bin/bash
# Text Analysis Toolkit — Text similarity
# Usage: export TOOLKITAPI_KEY=tk_live_...; bash text_similarity.sh
set -euo pipefail
API_KEY="${TOOLKITAPI_KEY:-}"; if [ -z "$API_KEY" ]; then echo "Error: TOOLKITAPI_KEY is not set" >&2; exit 1; fi
curl -sf -X POST -H "X-API-Key: ${API_KEY}" -H "Accept: application/json" \
  -H "Content-Type: application/json" \
  -d '{"a":"The quick brown fox jumps over the lazy dog","b":"A fast brown fox leaps across a sleepy dog"}' \
  "https://textanalysis.toolkitapi.io/v1/text/similarity" | jq .
