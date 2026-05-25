#!/bin/bash
# Text Analysis Toolkit — Detect language
# Usage: export TOOLKITAPI_KEY=tk_live_...; bash detect_language.sh
set -euo pipefail
API_KEY="${TOOLKITAPI_KEY:-}"; if [ -z "$API_KEY" ]; then echo "Error: TOOLKITAPI_KEY is not set" >&2; exit 1; fi
curl -sf -X POST -H "X-API-Key: ${API_KEY}" -H "Accept: application/json" \
  -H "Content-Type: application/json" \
  -d '{"text":"Bonjour, comment allez-vous aujourd'\''hui?"}' \
  "https://textanalysis.toolkitapi.io/v1/text/detect-language" | jq .
