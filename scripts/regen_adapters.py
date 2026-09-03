#!/usr/bin/env python3
"""
Regenerate the cross-tool adapters (AGENTS.md, .cursor/rules/*.mdc) from
skills/*/SKILL.md. skills/ is the source of truth; run this after adding,
editing, or removing a skill.

Not regenerated here (edited by hand, not derived per-skill):
  - README.md              category tables are curated prose
  - .claude-plugin/*.json   plugin manifest, points at ./skills/ as a
                             directory reference (no per-skill listing)
  - .opencode/opencode.json points at ../skills as a directory reference

Usage: python scripts/regen_adapters.py
"""
import os
import re
import sys

try:
    import yaml
except ImportError:
    sys.exit("Missing dependency: pip install pyyaml")

REPO_ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SKILLS_DIR = os.path.join(REPO_ROOT, "skills")

CATEGORY_RULES = [
    ("marketing-research", "Marketing"),
    ("warisskill-ui-ux-", "UI/UX Design"),
    ("warisskill-system-design-", "System Design"),
    ("warisskill-clean-code-", "Clean Code"),
    ("warisskill-workflows-", "Workflows"),
    ("warisskill-research-", "Research"),
]
CATEGORY_ORDER = [
    "UI/UX Design", "System Design", "Clean Code", "Workflows",
    "Engineering Practices", "Research", "Marketing",
]


def categorize(skill_dir):
    for prefix, cat in CATEGORY_RULES:
        if skill_dir == prefix or skill_dir.startswith(prefix):
            return cat
    return "Engineering Practices"


def load_skills():
    skills = []
    for name in sorted(os.listdir(SKILLS_DIR)):
        path = os.path.join(SKILLS_DIR, name, "SKILL.md")
        if not os.path.isfile(path):
            continue
        content = open(path, encoding="utf-8").read()
        m = re.match(r"^---\n(.*?)\n---\n(.*)$", content, re.S)
        if not m:
            print(f"WARNING: {name}/SKILL.md has no frontmatter, skipping")
            continue
        fm_text, body = m.groups()
        fm = yaml.safe_load(fm_text)
        skills.append({
            "dir": name,
            "name": fm.get("name", name),
            "description": (fm.get("description") or "").strip(),
            "body": body,
            "raw": content,
            "category": categorize(name),
        })
    return skills


def grouped(skills):
    groups = {}
    for s in skills:
        groups.setdefault(s["category"], []).append(s)
    return groups


def write_agents_md(skills):
    groups = grouped(skills)
    lines = [
        "# AGENTS.md", "",
        "Standing instructions for coding agents (Codex, and other "
        "AGENTS.md-aware tools) working in a project where this library "
        "is available. This file indexes a personal skill library — read "
        "the relevant `skills/<name>/SKILL.md` in full before applying "
        "it; the entries below are the trigger conditions, not the "
        "complete instructions.", "",
        "These skills encode specific working decisions made through an "
        "interview process — apply them as defaults, not suggestions, "
        "when their trigger condition matches the current task.", "",
        "If this machine doesn't have this library or its companion tools "
        "(ponytail, Impeccable, Taste) installed yet, run "
        "`scripts/bootstrap.sh` (or `scripts/bootstrap.ps1` on Windows "
        "PowerShell) from the repo root to install all of them globally "
        "before proceeding.", "",
    ]
    for cat in CATEGORY_ORDER:
        if cat not in groups:
            continue
        lines.append(f"## {cat}")
        lines.append("")
        for s in groups[cat]:
            lines.append(f"### `{s['dir']}`")
            lines.append("")
            lines.append(s["description"])
            lines.append("")
            lines.append(f"Full instructions: `skills/{s['dir']}/SKILL.md`")
            lines.append("")
    out = "\n".join(lines)
    path = os.path.join(REPO_ROOT, "AGENTS.md")
    open(path, "w", encoding="utf-8").write(out)
    print(f"wrote {path} ({len(skills)} skills)")


def write_cursor_rules(skills):
    cursor_dir = os.path.join(REPO_ROOT, ".cursor", "rules")
    os.makedirs(cursor_dir, exist_ok=True)
    existing = {f for f in os.listdir(cursor_dir) if f.endswith(".mdc")}
    expected = set()
    for s in skills:
        fname = f"{s['dir']}.mdc"
        expected.add(fname)
        desc = s["description"].replace('"', "'").replace("\n", " ")
        content = f'---\ndescription: {desc}\nalwaysApply: false\n---\n\n{s["body"]}'
        open(os.path.join(cursor_dir, fname), "w", encoding="utf-8").write(content)
    stale = existing - expected
    for fname in stale:
        os.remove(os.path.join(cursor_dir, fname))
    print(f"wrote {len(skills)} files to {cursor_dir}" + (f", removed {len(stale)} stale" if stale else ""))


def main():
    skills = load_skills()
    if not skills:
        sys.exit(f"No skills found under {SKILLS_DIR}")
    write_agents_md(skills)
    write_cursor_rules(skills)
    print("done. AGENTS.md and .cursor/rules/ are in sync with skills/.")


if __name__ == "__main__":
    main()
