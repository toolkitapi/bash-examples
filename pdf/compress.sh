#!/bin/bash
# PDF Toolkit — Compress PDF
# Usage: export TOOLKITAPI_KEY=tk_live_...; bash compress.sh
set -euo pipefail
API_KEY="${TOOLKITAPI_KEY:-}"; if [ -z "$API_KEY" ]; then echo "Error: TOOLKITAPI_KEY is not set" >&2; exit 1; fi
PDF="https%3A%2F%2Fraw.githubusercontent.com%2Fmozilla%2Fpdf.js%2Fmaster%2Fexamples%2Flearning%2Fhelloworld.pdf"
curl -sf -H "X-API-Key: ${API_KEY}" \
  "https://pdf.toolkitapi.io/v1/pdf/compress?url=${PDF}" | jq .
