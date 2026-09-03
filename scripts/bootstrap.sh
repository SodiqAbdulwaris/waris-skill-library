#!/usr/bin/env bash
# Bootstrap this skill library plus the companion tools it's meant to be used
# alongside (ponytail, Impeccable, Taste) on a fresh machine, for every coding
# agent detected. Idempotent — safe to re-run any time to pick up updates.
#
# Usage: ./scripts/bootstrap.sh
set -uo pipefail

have() { command -v "$1" >/dev/null 2>&1; }

echo "== Claude Code plugins: ponytail, impeccable =="
if have claude; then
  claude plugin marketplace add DietrichGebert/ponytail || true
  claude plugin install ponytail@ponytail || true
  claude plugin marketplace add pbakaus/impeccable || true
  claude plugin install impeccable@impeccable || true
else
  echo "claude CLI not found — skipping Claude Code plugin installs"
fi

echo "== Taste, and this library, globally for every detected agent =="
if have npx; then
  npx skills add Leonxlnx/taste-skill --global --all --yes || true
  npx skills add SodiqAbdulwaris/waris-skill-library --global --all --yes || true
else
  echo "npx not found — skipping universal skill installs"
fi

echo "== Impeccable, for broader-than-Claude-Code coverage (Gemini/Codex/etc.) =="
if have npx; then
  npx impeccable install || true
fi

echo "Done. Re-run this script any time to pick up updates to any of the above."
