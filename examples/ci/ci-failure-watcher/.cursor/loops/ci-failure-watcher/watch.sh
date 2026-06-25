#!/usr/bin/env bash
set -euo pipefail
BRANCH="$(git branch --show-current)"
gh run list --branch "$BRANCH" --limit 1 --json conclusion,url -q '.[0]'
