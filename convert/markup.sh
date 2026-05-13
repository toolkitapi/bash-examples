#!/bin/bash
# Convert Toolkit — Convert markup formats (Markdown → HTML)
# Usage: export TOOLKITAPI_KEY=tk_live_...; bash markup.sh
set -euo pipefail
API_KEY="${TOOLKITAPI_KEY:-}"; if [ -z "$API_KEY" ]; then echo "Error: TOOLKITAPI_KEY is not set" >&2; exit 1; fi
curl -sf -X POST -H "X-API-Key: ${API_KEY}" -H "Accept: application/json" \
  -H "Content-Type: application/json" \
  -d '{"content":"# Hello World\n\nThis is a **bold** paragraph.","from_format":"markdown","to_format":"html"}' \
  "https://convert.toolkitapi.io/v1/convert/markup" | jq .
