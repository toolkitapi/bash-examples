#!/bin/bash
# Email Toolkit — Spam score
# Usage: export TOOLKITAPI_KEY=tk_live_...; bash spam_score.sh
set -euo pipefail
API_KEY="${TOOLKITAPI_KEY:-}"; if [ -z "$API_KEY" ]; then echo "Error: TOOLKITAPI_KEY is not set" >&2; exit 1; fi
curl -sf -X POST -H "X-API-Key: ${API_KEY}" -H "Accept: application/json" \
  -H "Content-Type: application/json" \
  -d '{"subject":"URGENT: You won a prize! Click here NOW!!!","body":"Congratulations! You have been selected. Click the link to claim your FREE reward.","from":"noreply@promo-offer.biz"}' \
  "https://email.toolkitapi.io/v1/email/spam-score" | jq .
