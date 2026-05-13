#!/bin/bash
# Text Analysis Toolkit — Summarize text
# Usage: export TOOLKITAPI_KEY=tk_live_...; bash summarize.sh
set -euo pipefail
API_KEY="${TOOLKITAPI_KEY:-}"; if [ -z "$API_KEY" ]; then echo "Error: TOOLKITAPI_KEY is not set" >&2; exit 1; fi
curl -sf -X POST -H "X-API-Key: ${API_KEY}" -H "Accept: application/json" \
  -H "Content-Type: application/json" \
  -d '{"text":"Artificial intelligence is intelligence demonstrated by machines. AI research studies intelligent agents that perceive their environment and take actions to maximize goals. The field encompasses machine learning, natural language processing, computer vision, and robotics.","max_sentences":2}' \
  "https://textanalysis.toolkitapi.io/v1/text/summarize" | jq .
