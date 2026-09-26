#!/usr/bin/env bash
set -euo pipefail
PORT="${1:-8765}"
HERE="$(cd "$(dirname "$0")" && pwd)"
ROOT="$(dirname "$HERE")"
echo "Dev Data Tools: http://127.0.0.1:$PORT/dev-data-tools/"
cd "$ROOT"
python3 -m http.server "$PORT" --bind 127.0.0.1
