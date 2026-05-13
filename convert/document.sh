#!/bin/bash
# Convert Toolkit — Convert document formats
# Usage: export TOOLKITAPI_KEY=tk_live_...; bash document.sh
set -euo pipefail
API_KEY="${TOOLKITAPI_KEY:-}"; if [ -z "$API_KEY" ]; then echo "Error: TOOLKITAPI_KEY is not set" >&2; exit 1; fi
curl -sf -X POST -H "X-API-Key: ${API_KEY}" -H "Accept: application/json" \
  -H "Content-Type: application/json" \
  -d '{"url":"https://raw.githubusercontent.com/mozilla/pdf.js/master/examples/learning/helloworld.pdf","from_format":"pdf","to_format":"docx"}' \
  "https://convert.toolkitapi.io/v1/convert/document" | jq .
