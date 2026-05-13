#!/bin/bash
# Text Analysis Toolkit — PII / data masking
# Usage: export TOOLKITAPI_KEY=tk_live_...; bash data_mask.sh
set -euo pipefail
API_KEY="${TOOLKITAPI_KEY:-}"; if [ -z "$API_KEY" ]; then echo "Error: TOOLKITAPI_KEY is not set" >&2; exit 1; fi
curl -sf -X POST -H "X-API-Key: ${API_KEY}" -H "Accept: application/json" \
  -H "Content-Type: application/json" \
  -d '{"text":"Please call John Smith at 555-867-5309 or email john.smith@example.com about SSN 123-45-6789."}' \
  "https://textanalysis.toolkitapi.io/v1/text/pii-mask" | jq .
