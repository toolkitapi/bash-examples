#!/bin/bash
# Media Toolkit — YouTube channel metadata
# Usage: export TOOLKITAPI_KEY=tk_live_...; bash youtube_channel.sh
set -euo pipefail
API_KEY="${TOOLKITAPI_KEY:-}"; if [ -z "$API_KEY" ]; then echo "Error: TOOLKITAPI_KEY is not set" >&2; exit 1; fi
CHANNEL_ID="UCVHFbw7woebKtFFbuylTdig"
curl -sf -H "X-API-Key: ${API_KEY}" -H "Accept: application/json" \
  "https://youtube.toolkitapi.io/v1/youtube/channel?id=${CHANNEL_ID}" | jq .
