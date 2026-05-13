#!/bin/bash
# DevTools Toolkit — Validate YAML
# Usage: export TOOLKITAPI_KEY=tk_live_...; bash yaml_validate.sh
set -euo pipefail
API_KEY="${TOOLKITAPI_KEY:-}"; if [ -z "$API_KEY" ]; then echo "Error: TOOLKITAPI_KEY is not set" >&2; exit 1; fi
curl -sf -X POST -H "X-API-Key: ${API_KEY}" -H "Accept: application/json" \
  -H "Content-Type: application/json" \
  -d '{"data":"name: Alice\nage: 30\nactive: true\n"}' \
  "https://dev.toolkitapi.io/v1/yaml-validate" | jq .
