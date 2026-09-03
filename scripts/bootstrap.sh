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
  # Must run from $HOME: it treats the CWD's own .cursor/.opencode dirs as
  # "detected harnesses" and installs there at project scope if run from
  # inside this repo, polluting it with its own agents/hooks/skills files.
  (cd "$HOME" && npx impeccable install) || true
fi

echo "== Native per-tool installs, where documented and confirmed working =="
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

if have agy; then
  agy plugin install https://github.com/DietrichGebert/ponytail || true
  agy plugin install "$REPO_DIR" || true
else
  echo "agy CLI not found — skipping Antigravity-native installs (still covered by the universal installers above)"
fi

if have codex; then
  timeout 120 codex plugin marketplace add DietrichGebert/ponytail || true
  timeout 120 codex plugin add ponytail@ponytail || true
  timeout 120 codex plugin marketplace add SodiqAbdulwaris/waris-skill-library || true
  timeout 120 codex plugin add waris-skill-library@waris-skill-library || true
  # impeccable has no working Codex-native marketplace: `codex plugin
  # marketplace add pbakaus/impeccable` hangs indefinitely (confirmed) —
  # relies on the universal installers above instead.
else
  echo "codex CLI not found — skipping Codex-native installs (still covered by the universal installers above)"
fi

if have opencode; then
  opencode plugin @dietrichgebert/ponytail -g || true
  # impeccable, Taste, and this library aren't published npm packages, so
  # `opencode plugin <npm-module>` doesn't apply to them — they rely on the
  # universal installers above for OpenCode instead.
else
  echo "opencode CLI not found — skipping OpenCode-native ponytail install"
fi

echo "Cursor has no native CLI plugin-install command (per ponytail's own docs — file-copy only); already covered by the universal installers above."

echo "Done. Re-run this script any time to pick up updates to any of the above."
