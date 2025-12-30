#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "${ROOT_DIR}"

echo "Running markdownlint..."
npx -y markdownlint-cli@0.39.0 "**/*.md" "!**/node_modules/**" -c .markdownlint.yaml
