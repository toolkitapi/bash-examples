#!/bin/bash
# PDF Toolkit — Convert document formats
# Usage: export TOOLKITAPI_KEY=tk_live_...; bash convert_document.sh
set -euo pipefail
API_KEY="${TOOLKITAPI_KEY:-}"; if [ -z "$API_KEY" ]; then echo "Error: TOOLKITAPI_KEY is not set" >&2; exit 1; fi
TMPFILE=$(mktemp /tmp/pdf_convert_doc_XXXXXX)
trap 'rm -f "$TMPFILE"' EXIT
HTTP_CODE=$(curl -s -w "%{http_code}" -o "$TMPFILE" \
  -H "X-API-Key: ${API_KEY}" \
  "https://pdf.toolkitapi.io/v1/pdf/convert/document?url=https%3A%2F%2Fraw.githubusercontent.com%2Fmozilla%2Fpdf.js%2Fmaster%2Fexamples%2Flearning%2Fhelloworld.pdf&from_format=pdf&to_format=docx")
if [ "$HTTP_CODE" -lt 200 ] || [ "$HTTP_CODE" -ge 300 ]; then
  echo "Error: HTTP ${HTTP_CODE} from pdf/convert/document" >&2
  exit 1
fi
BYTES=$(wc -c < "$TMPFILE")
echo "{\"status\":\"ok\",\"http_code\":${HTTP_CODE},\"bytes\":${BYTES}}"
