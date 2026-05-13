#!/bin/bash
# Webhook Toolkit — Create a mock endpoint
# Usage: export TOOLKITAPI_KEY=tk_live_...; bash create_mock.sh
set -euo pipefail
API_KEY="${TOOLKITAPI_KEY:-}"; if [ -z "$API_KEY" ]; then echo "Error: TOOLKITAPI_KEY is not set" >&2; exit 1; fi
curl -sf -X POST -H "X-API-Key: ${API_KEY}" -H "Accept: application/json" \
  -H "Content-Type: application/json" \
  -d '{"status_code":200,"headers":{"Content-Type":"application/json"},"body":"{\"ok\":true,\"message\":\"Mock response\"}"}' \
  "https://webhook.toolkitapi.io/v1/mocks" | jq .
