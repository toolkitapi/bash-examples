#!/usr/bin/env bash
# Test runner for all bash examples.
# Runs each .sh file via bash, handles webhook chaining (create_bin → get_bin/list_requests, create_mock → hit_mock).
# Requires: bash, curl, jq
# Exit code: 0 = all enabled tests pass; 1 = one or more failures.
#
# Usage: export TOOLKITAPI_KEY=tk_live_...; bash _run_tests.sh

set -uo pipefail

API_KEY="${TOOLKITAPI_KEY:-}"
if [ -z "$API_KEY" ]; then
  echo "Error: TOOLKITAPI_KEY is not set" >&2
  exit 1
fi

BASE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PASS=0
FAIL=0
SKIP=0
declare -a FAILURES=()

# ── Helpers ───────────────────────────────────────────────────────────────────

sep() {
  echo ""
  echo "============================================================"
  echo "  $1"
  echo "============================================================"
}

record_pass() { printf "  ✅ PASS  %-35s\n" "$2"; ((PASS++)); }
record_fail() { printf "  ❌ FAIL  %-35s %s\n" "$2" "${3:0:120}"; ((FAIL++)); FAILURES+=("$1/$2: ${3:-}"); }
record_skip() { printf "  ⚠️  SKIP  %-35s %s\n" "$2" "${3:-}"; ((SKIP++)); }

run_toolkit() {
  local toolkit="$1"; shift
  sep "${toolkit^^}"
  local folder="$BASE/$toolkit"
  for f in "$@"; do
    local path="$folder/$f"
    if [ ! -f "$path" ]; then
      record_fail "$toolkit" "$f" "FILE MISSING"
      continue
    fi
    local out
    if out=$(timeout 60 bash "$path" 2>&1); then
      record_pass "$toolkit" "$f"
    else
      record_fail "$toolkit" "$f" "$(echo "$out" | head -1 | cut -c1-120)"
    fi
  done
}

# ── Devtools ──────────────────────────────────────────────────────────────────
run_toolkit devtools \
  generate_uuid.sh json_validate.sh yaml_validate.sh \
  regex_test.sh cron_parse.sh diff_text.sh \
  slugify.sh math_eval.sh

# ── DNS ───────────────────────────────────────────────────────────────────────
run_toolkit dns \
  lookup.sh lookup_all.sh lookup_bulk.sh whois.sh \
  available.sh domain_age.sh certificate.sh \
  typosquat.sh propagation.sh health.sh

# ── Email ─────────────────────────────────────────────────────────────────────
run_toolkit email \
  validate_email.sh normalize.sh role_check.sh \
  catch_all.sh provider.sh security.sh \
  validate_batch.sh spam_score.sh

# ── Auth ──────────────────────────────────────────────────────────────────────
run_toolkit auth \
  generate_password.sh password_strength.sh \
  hash_password.sh generate_key.sh base64_encode.sh \
  encrypt.sh jwt_generate.sh jwt_verify.sh \
  totp_generate.sh verify_password.sh

# ── Barcode ───────────────────────────────────────────────────────────────────
sep "BARCODE (plan unavailable — expected skip)"
for f in types.sh qr_generate.sh qr_bulk.sh generate.sh qr_decode.sh decode.sh; do
  record_skip "barcode" "$f" "API key does not have barcode access"
done

# ── Geo ───────────────────────────────────────────────────────────────────────
run_toolkit geo \
  ip_lookup.sh ip_threat.sh country_info.sh \
  timezone_convert.sh distance.sh phone_validate.sh

# ── Textanalysis ──────────────────────────────────────────────────────────────
run_toolkit textanalysis \
  detect_language.sh summarize.sh word_frequency.sh \
  readability_score.sh text_similarity.sh \
  profanity_filter.sh data_mask.sh

# ── Scrape ────────────────────────────────────────────────────────────────────
run_toolkit scrape \
  scrape.sh seo_audit.sh seo_keyword_density.sh \
  seo_mobile_friendly.sh seo_pagespeed.sh

# ── Media ─────────────────────────────────────────────────────────────────────
run_toolkit media \
  youtube_transcript.sh youtube_video.sh \
  youtube_channel.sh youtube_search.sh

# ── Image ─────────────────────────────────────────────────────────────────────
run_toolkit image \
  metadata.sh colors.sh resize.sh \
  compress.sh strip_exif.sh remove_background.sh

# ── PDF ───────────────────────────────────────────────────────────────────────
run_toolkit pdf \
  text_extract.sh metadata.sh split.sh \
  compress.sh merge.sh watermark.sh

# ── Convert ───────────────────────────────────────────────────────────────────
run_toolkit convert \
  list_formats.sh data.sh markup.sh \
  json_to_typescript.sh document.sh spreadsheet.sh

# ── Webhook (chained) ────────────────────────────────────────────────────────
sep "WEBHOOK (chained)"
WEBHOOK="$BASE/webhook"

# 1. create_bin
BIN_ID=""
if out=$(timeout 60 bash "$WEBHOOK/create_bin.sh" 2>&1); then
  record_pass "webhook" "create_bin.sh"
  BIN_ID=$(echo "$out" | jq -r '.bin.bin_id // .bin_id // empty' 2>/dev/null || true)
else
  record_fail "webhook" "create_bin.sh" "$(echo "$out" | head -1)"
fi

# 2. get_bin
if [ -n "${BIN_ID:-}" ]; then
  TMP="$WEBHOOK/_tmp_get_bin.sh"
  sed "s/your-bin-id-here/${BIN_ID}/g" "$WEBHOOK/get_bin.sh" > "$TMP"
  if out=$(timeout 60 bash "$TMP" 2>&1); then
    record_pass "webhook" "get_bin.sh"
  else
    record_fail "webhook" "get_bin.sh" "$(echo "$out" | head -1)"
  fi
  rm -f "$TMP"
else
  record_skip "webhook" "get_bin.sh" "skipped (no bin_id from create_bin)"
fi

# 3. list_requests
if [ -n "${BIN_ID:-}" ]; then
  TMP="$WEBHOOK/_tmp_list_requests.sh"
  sed "s/your-bin-id-here/${BIN_ID}/g" "$WEBHOOK/list_requests.sh" > "$TMP"
  if out=$(timeout 60 bash "$TMP" 2>&1); then
    record_pass "webhook" "list_requests.sh"
  else
    record_fail "webhook" "list_requests.sh" "$(echo "$out" | head -1)"
  fi
  rm -f "$TMP"
else
  record_skip "webhook" "list_requests.sh" "skipped (no bin_id from create_bin)"
fi

# 4. create_mock
MOCK_ID=""
if out=$(timeout 60 bash "$WEBHOOK/create_mock.sh" 2>&1); then
  record_pass "webhook" "create_mock.sh"
  MOCK_ID=$(echo "$out" | jq -r '.mock.mock_id // .mock_id // empty' 2>/dev/null || true)
else
  record_fail "webhook" "create_mock.sh" "$(echo "$out" | head -1)"
fi

# 5. hit_mock
if [ -n "${MOCK_ID:-}" ]; then
  TMP="$WEBHOOK/_tmp_hit_mock.sh"
  sed "s/your-mock-id-here/${MOCK_ID}/g" "$WEBHOOK/hit_mock.sh" > "$TMP"
  if out=$(timeout 60 bash "$TMP" 2>&1); then
    record_pass "webhook" "hit_mock.sh"
  else
    record_fail "webhook" "hit_mock.sh" "$(echo "$out" | head -1)"
  fi
  rm -f "$TMP"
else
  record_skip "webhook" "hit_mock.sh" "skipped (no mock_id from create_mock)"
fi

# ── Summary ───────────────────────────────────────────────────────────────────
TOTAL=$((PASS + FAIL + SKIP))
echo ""
echo "============================================================"
echo "  RESULTS: ${PASS}/${TOTAL} passed, ${FAIL} failed, ${SKIP} skipped"
echo "============================================================"

if [ "${#FAILURES[@]}" -gt 0 ]; then
  echo ""
  echo "Failed:"
  for entry in "${FAILURES[@]}"; do
    echo "  $entry"
  done
  exit 1
fi

exit 0
