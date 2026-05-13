#!/bin/bash
# PDF Toolkit — Merge PDFs
# Usage: export TOOLKITAPI_KEY=tk_live_...; bash merge.sh
set -euo pipefail
API_KEY="${TOOLKITAPI_KEY:-}"; if [ -z "$API_KEY" ]; then echo "Error: TOOLKITAPI_KEY is not set" >&2; exit 1; fi
curl -sf -X POST -H "X-API-Key: ${API_KEY}" -H "Accept: application/json" \
  -H "Content-Type: application/json" \
  -d '{"pdf_urls":["https://raw.githubusercontent.com/mozilla/pdf.js/master/examples/learning/helloworld.pdf","https://raw.githubusercontent.com/mozilla/pdf.js/master/examples/learning/helloworld.pdf"]}' \
  "https://pdf.toolkitapi.io/v1/pdf/merge" | jq .
