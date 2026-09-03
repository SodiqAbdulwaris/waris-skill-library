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

function Invoke-WithTimeout($seconds, $scriptBlock) {
    $job = Start-Job -ScriptBlock $scriptBlock
    if (Wait-Job $job -Timeout $seconds) { Receive-Job $job } else { Write-Host "(timed out after ${seconds}s, skipping)" }
    Remove-Job $job -Force
}

Write-Host "== Native per-tool installs, where documented and confirmed working =="
$RepoDir = Split-Path -Parent $PSScriptRoot

if (Have agy) {
    agy plugin install https://github.com/DietrichGebert/ponytail
    agy plugin install $RepoDir
} else {
    Write-Host "agy CLI not found -- skipping Antigravity-native installs (still covered by the universal installers above)"
}

if (Have codex) {
    Invoke-WithTimeout 120 { codex plugin marketplace add DietrichGebert/ponytail }
    Invoke-WithTimeout 120 { codex plugin add ponytail@ponytail }
    Invoke-WithTimeout 120 { codex plugin marketplace add SodiqAbdulwaris/waris-skill-library }
    Invoke-WithTimeout 120 { codex plugin add waris-skill-library@waris-skill-library }
    # impeccable has no working Codex-native marketplace: `codex plugin
    # marketplace add pbakaus/impeccable` hangs indefinitely (confirmed) --
    # relies on the universal installers above instead.
} else {
    Write-Host "codex CLI not found -- skipping Codex-native installs (still covered by the universal installers above)"
}

if (Have opencode) {
    opencode plugin @dietrichgebert/ponytail -g
    # impeccable, Taste, and this library aren't published npm packages, so
    # `opencode plugin <npm-module>` doesn't apply to them -- they rely on the
    # universal installers above for OpenCode instead.
} else {
    Write-Host "opencode CLI not found -- skipping OpenCode-native ponytail install"
}

Write-Host "Cursor has no native CLI plugin-install command (per ponytail's own docs -- file-copy only); already covered by the universal installers above."

Write-Host "Done. Re-run this script any time to pick up updates to any of the above."
