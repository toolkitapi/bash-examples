#!/bin/bash
# DevTools Toolkit — Math expression evaluator
# Usage: export TOOLKITAPI_KEY=tk_live_...; bash math_eval.sh
set -euo pipefail
API_KEY="${TOOLKITAPI_KEY:-}"; if [ -z "$API_KEY" ]; then echo "Error: TOOLKITAPI_KEY is not set" >&2; exit 1; fi
curl -sf -X POST -H "X-API-Key: ${API_KEY}" -H "Accept: application/json" \
  -H "Content-Type: application/json" \
  -d '{"expression":"sqrt(144) + (2^10 / 4)"}' \
  "https://dev.toolkitapi.io/v1/math-eval" | jq .
