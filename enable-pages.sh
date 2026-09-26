#!/usr/bin/env bash
set -euo pipefail
OWNER="raoulmunet"
REPOS=(dev-data-tools schema-detective data-diff-explorer csv-relationship-finder data-quality-playground log-pattern-analyzer dependency-impact-explorer regex-data-lab)

if ! command -v gh >/dev/null 2>&1; then
  echo "GitHub CLI (gh) is required: https://cli.github.com/"
  exit 1
fi

gh auth status >/dev/null

for repo in "${REPOS[@]}"; do
  echo "Enabling GitHub Pages for $OWNER/$repo ..."
  if gh api "repos/$OWNER/$repo/pages" >/dev/null 2>&1; then
    echo "  Pages already enabled."
  else
    gh api --method POST "repos/$OWNER/$repo/pages" -f build_type=workflow >/dev/null
    echo "  Pages enabled with GitHub Actions."
  fi
done

echo
echo "Pages configured. Re-run the Pages workflows from GitHub Actions if they do not start automatically."
echo "Portal: https://$OWNER.github.io/dev-data-tools/"
