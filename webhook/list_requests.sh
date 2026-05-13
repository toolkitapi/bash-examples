#!/bin/bash
# Webhook Toolkit — List captured requests
# Usage: export TOOLKITAPI_KEY=tk_live_...; bash list_requests.sh
set -euo pipefail
API_KEY="${TOOLKITAPI_KEY:-}"; if [ -z "$API_KEY" ]; then echo "Error: TOOLKITAPI_KEY is not set" >&2; exit 1; fi
BIN_ID="your-bin-id-here"  # Replace with a real bin ID
curl -sf -H "X-API-Key: ${API_KEY}" -H "Accept: application/json" \
  "https://webhook.toolkitapi.io/v1/bins/${BIN_ID}/requests?limit=10" | jq .
