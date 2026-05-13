#!/bin/bash
# Webhook Toolkit — Create a request bin
# Usage: export TOOLKITAPI_KEY=tk_live_...; bash create_bin.sh
set -euo pipefail
API_KEY="${TOOLKITAPI_KEY:-}"; if [ -z "$API_KEY" ]; then echo "Error: TOOLKITAPI_KEY is not set" >&2; exit 1; fi
curl -sf -X POST -H "X-API-Key: ${API_KEY}" -H "Accept: application/json" \
  "https://webhook.toolkitapi.io/v1/bins" | jq .
