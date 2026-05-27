#!/bin/zsh
cd "$(dirname "$0")/.." || exit 1

PORT=8785
URL="http://127.0.0.1:${PORT}/UWorld%20Step%202.html"
LOG="/tmp/uworld_step2ck_qbank_2025_server.log"

if ! lsof -iTCP:${PORT} -sTCP:LISTEN >/dev/null 2>&1; then
  python3 -m http.server "${PORT}" >"${LOG}" 2>&1 &
  sleep 1
fi

open "${URL}"
