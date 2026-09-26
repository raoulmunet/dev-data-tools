#!/usr/bin/env bash
set -euo pipefail
OWNER="raoulmunet"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
REPOS=(schema-detective data-diff-explorer csv-relationship-finder data-quality-playground log-pattern-analyzer dependency-impact-explorer regex-data-lab)
echo "Installing Dev Data Tools into: $ROOT"
for repo in "${REPOS[@]}"; do
  target="$ROOT/$repo"
  if [ -d "$target/.git" ]; then
    echo "Updating $repo"
    git -C "$target" pull --ff-only
  else
    echo "Cloning $repo"
    git clone "https://github.com/$OWNER/$repo.git" "$target"
  fi
done
chmod +x "$(dirname "$0")/run-local.sh"
echo "Suite installed. Run ./run-local.sh from dev-data-tools."
