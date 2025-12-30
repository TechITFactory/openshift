#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -eq 0 ]; then
  targets=("README.md")
else
  targets=("$@")
fi

for file in "${targets[@]}"; do
  if [ ! -f "${file}" ]; then
    echo "Skipping ${file}: not found" >&2
    continue
  fi
  echo "Generating TOC for ${file}"
  npx -y markdown-toc@1.2.0 -i "${file}"
done
