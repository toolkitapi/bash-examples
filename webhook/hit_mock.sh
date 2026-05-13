#!/bin/bash
# Webhook Toolkit — Hit a mock endpoint
# Usage: export TOOLKITAPI_KEY=tk_live_...; bash hit_mock.sh
set -euo pipefail
API_KEY="${TOOLKITAPI_KEY:-}"; if [ -z "$API_KEY" ]; then echo "Error: TOOLKITAPI_KEY is not set" >&2; exit 1; fi
MOCK_ID="your-mock-id-here"  # Replace with a real mock ID
curl -sf -X POST -H "X-API-Key: ${API_KEY}" -H "Accept: application/json" \
  "https://webhook.toolkitapi.io/v1/mock/${MOCK_ID}" | jq .
