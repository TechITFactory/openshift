#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "${ROOT_DIR}"

echo "Checking Markdown links..."
CONFIG_OPTION=()
if [ -f ".markdown-link-check.json" ]; then
  CONFIG_OPTION=(-c .markdown-link-check.json)
fi

find . -name "*.md" -not -path "./node_modules/*" -print0 | while IFS= read -r -d '' file; do
  echo "  -> ${file}"
  npx -y markdown-link-check@3.11.2 -q "${CONFIG_OPTION[@]}" "${file}"
done
