#!/bin/bash
# Media Toolkit — YouTube video metadata
# Usage: export TOOLKITAPI_KEY=tk_live_...; bash youtube_video.sh
set -euo pipefail
API_KEY="${TOOLKITAPI_KEY:-}"; if [ -z "$API_KEY" ]; then echo "Error: TOOLKITAPI_KEY is not set" >&2; exit 1; fi
curl -sf -H "X-API-Key: ${API_KEY}" -H "Accept: application/json" \
  "https://youtube.toolkitapi.io/v1/youtube/video?url=https%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3DdQw4w9WgXcQ" | jq .
