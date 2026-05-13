#!/bin/bash
# Image Toolkit — Compress image (binary output saved to file)
# Usage: export TOOLKITAPI_KEY=tk_live_...; bash compress.sh
set -euo pipefail
API_KEY="${TOOLKITAPI_KEY:-}"; if [ -z "$API_KEY" ]; then echo "Error: TOOLKITAPI_KEY is not set" >&2; exit 1; fi
IMG="https%3A%2F%2Favatars.githubusercontent.com%2Fu%2F9919"
curl -sf -H "X-API-Key: ${API_KEY}" \
  "https://image.toolkitapi.io/v1/image/compress?url=${IMG}&quality=75&format=jpeg" \
  --output output_compress.jpg
echo "Compressed image saved to output_compress.jpg"
