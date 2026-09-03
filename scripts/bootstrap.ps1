# Bootstrap this skill library plus the companion tools it's meant to be used
# alongside (ponytail, Impeccable, Taste) on a fresh machine, for every coding
# agent detected. Idempotent -- safe to re-run any time to pick up updates.
#
# Usage: powershell -File scripts/bootstrap.ps1

function Have($name) { return [bool](Get-Command $name -ErrorAction SilentlyContinue) }

Write-Host "== Claude Code plugins: ponytail, impeccable =="
if (Have claude) {
    claude plugin marketplace add DietrichGebert/ponytail
    claude plugin install ponytail@ponytail
    claude plugin marketplace add pbakaus/impeccable
    claude plugin install impeccable@impeccable
} else {
    Write-Host "claude CLI not found -- skipping Claude Code plugin installs"
}

Write-Host "== Taste, and this library, globally for every detected agent =="
if (Have npx) {
    npx skills add Leonxlnx/taste-skill --global --all --yes
    npx skills add SodiqAbdulwaris/waris-skill-library --global --all --yes
} else {
    Write-Host "npx not found -- skipping universal skill installs"
}

Write-Host "== Impeccable, for broader-than-Claude-Code coverage (Gemini/Codex/etc.) =="
if (Have npx) {
    # Must run from $HOME: it treats the CWD's own .cursor/.opencode dirs as
    # "detected harnesses" and installs there at project scope if run from
    # inside this repo, polluting it with its own agents/hooks/skills files.
    Push-Location $HOME
    try { npx impeccable install } finally { Pop-Location }
}

Write-Host "Done. Re-run this script any time to pick up updates to any of the above."
