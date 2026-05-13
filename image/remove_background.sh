#!/bin/bash
# Image Toolkit — Remove background (binary output saved to file)
# Usage: export TOOLKITAPI_KEY=tk_live_...; bash remove_background.sh
set -euo pipefail
API_KEY="${TOOLKITAPI_KEY:-}"; if [ -z "$API_KEY" ]; then echo "Error: TOOLKITAPI_KEY is not set" >&2; exit 1; fi
IMG="https%3A%2F%2Favatars.githubusercontent.com%2Fu%2F9919"
curl -sf -H "X-API-Key: ${API_KEY}" \
  "https://image.toolkitapi.io/v1/image/remove-background?url=${IMG}" \
  --output output_no_bg.png
echo "Background-removed image saved to output_no_bg.png"
