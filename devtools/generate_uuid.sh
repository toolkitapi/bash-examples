#!/bin/bash
# DevTools Toolkit — Generate UUIDs
# Usage: export TOOLKITAPI_KEY=tk_live_...; bash generate_uuid.sh
set -euo pipefail
API_KEY="${TOOLKITAPI_KEY:-}"; if [ -z "$API_KEY" ]; then echo "Error: TOOLKITAPI_KEY is not set" >&2; exit 1; fi
curl -sf -H "X-API-Key: ${API_KEY}" -H "Accept: application/json" \
  "https://dev.toolkitapi.io/v1/uuid?version=v4&count=5" | jq .
