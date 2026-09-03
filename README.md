# waris-skill-library

A personal library of engineering-practice skills, built through an interview-driven process (not copied from other repos) so each one encodes actual working decisions rather than generic best-practice text. Source format is [Claude Code Skills](https://docs.claude.com/en/docs/claude-code/skills) (`SKILL.md` = YAML frontmatter + markdown instructions), but the content is tool-agnostic — see [Using this library from other agents](#using-this-library-from-other-agents) below.

## Categories

### UI/UX Design

| Skill | What it decides |
|---|---|
| [`warisskill-ui-ux-accessibility`](skills/warisskill-ui-ux-accessibility/SKILL.md) | Building or reviewing any interactive UI, on any platform (web, iOS, Android, desktop) — this is a non-negotiable baseline, not an optional pass. |
| [`warisskill-ui-ux-design-systems-tokens`](skills/warisskill-ui-ux-design-systems-tokens/SKILL.md) | Setting up or extending the styling foundation of a web project — choosing/configuring a component library, defining color/radius/font tokens, deciding token naming, or wiring up dark mode. |
| [`warisskill-ui-ux-motion-design`](skills/warisskill-ui-ux-motion-design/SKILL.md) | Adding, reviewing, or fixing any UI animation or transition on web — button feedback, modal/panel enter-exit, page transitions, scroll-linked reveals, loading/skeleton states, hover/drag interactions. |
| [`warisskill-ui-ux-responsive-multiplatform`](skills/warisskill-ui-ux-responsive-multiplatform/SKILL.md) | A UI needs to work across screen sizes (responsive web layout) or across platforms (web + React Native/Expo + SwiftUI + Jetpack Compose + desktop). |
| [`warisskill-ui-ux-visual-design-taste`](skills/warisskill-ui-ux-visual-design-taste/SKILL.md) | A UI needs a visual direction decided with no designer, brand guide, or existing design system to follow — a new project's first screen, a prototype that needs to look intentional, or when asked "make this look good" with no other constraints. |

### System Design

| Skill | What it decides |
|---|---|
| [`warisskill-system-design-api-design`](skills/warisskill-system-design-api-design/SKILL.md) | Designing or reviewing an API — REST endpoint shape, status codes, response format, pagination, error responses, or versioning strategy. |
| [`warisskill-system-design-decision-making`](skills/warisskill-system-design-decision-making/SKILL.md) | A genuinely significant, hard-to-reverse technical choice is being made — database engine, auth strategy, framework/major library swap, a boundary that's expensive to undo later. |
| [`warisskill-system-design-distributed-patterns`](skills/warisskill-system-design-distributed-patterns/SKILL.md) | A system already is distributed (client project with existing microservices, multiple deployables, or a message bus) or when deciding whether to introduce distribution into a currently-monolithic system — splitting a service, adding a queue, introducing eventual consistency, or coordinating a multi-step process across ownership boundaries. |
| [`warisskill-system-design-domain-modeling`](skills/warisskill-system-design-domain-modeling/SKILL.md) | Structuring a non-trivial backend feature or service — deciding how business logic relates to I/O (HTTP, database, external APIs), and how domain concepts are represented in code. |

### Clean Code

| Skill | What it decides |
|---|---|
| [`warisskill-clean-code-naming-style`](skills/warisskill-clean-code-naming-style/SKILL.md) | Writing or renaming variables, functions, types, or files in any language — naming casing conventions and function-naming shape. |
| [`warisskill-clean-code-review-etiquette`](skills/warisskill-clean-code-review-etiquette/SKILL.md) | Giving code review feedback (via /code-review or inline in conversation) or when I am receiving feedback/corrections about my own output from the user. |

### Workflows

| Skill | What it decides |
|---|---|
| [`warisskill-workflows-agent-log`](skills/warisskill-workflows-agent-log/SKILL.md) | Use at the end of any non-trivial piece of work — records it into an organized, cross-referenced `docs/agent-log/` trail (reviews, debugging, decisions, improvements, and more) instead of letting it live only in chat scrollback. |
| [`warisskill-workflows-feature-delivery`](skills/warisskill-workflows-feature-delivery/SKILL.md) | Use before declaring any feature or fix complete — the definition-of-done checklist and the hard rule against claiming success without fresh evidence. |
| [`warisskill-workflows-git`](skills/warisskill-workflows-git/SKILL.md) | Starting a new project's git setup, creating branches, writing commit messages, or bringing a feature branch up to date with main. |
| [`warisskill-workflows-planning`](skills/warisskill-workflows-planning/SKILL.md) | Use before starting implementation on any non-trivial task — decides whether planning stays internal (silent task sequencing) or gets surfaced as an explicit checkpoint the user confirms before code gets written. |
| [`warisskill-workflows-tdd`](skills/warisskill-workflows-tdd/SKILL.md) | Implementing business logic, algorithms, or anything with real edge cases — decides whether to write the test first (red-green-refactor) and what actually warrants a test at all. |

### Engineering Practices

| Skill | What it decides |
|---|---|
| [`warisskill-database-modeling-migrations`](skills/warisskill-database-modeling-migrations/SKILL.md) | Creating or altering database schema, writing a migration, or designing a new table/relationship. |
| [`warisskill-dependency-management`](skills/warisskill-dependency-management/SKILL.md) | A new dependency is genuinely being considered for installation — after ponytail's ladder already established that stdlib/native/an existing dependency doesn't cover it. |
| [`warisskill-deployment-environment-config`](skills/warisskill-deployment-environment-config/SKILL.md) | Setting up deployment for a new project, configuring CI/CD, or structuring environment-specific config (dev/staging/prod). |
| [`warisskill-documentation-practices`](skills/warisskill-documentation-practices/SKILL.md) | A README or project doc is explicitly requested (standing global rule: never create those unprompted), and use automatically whenever an API is being built or changed — API documentation is always-on, not request-gated. |
| [`warisskill-error-handling-observability`](skills/warisskill-error-handling-observability/SKILL.md) | Writing code that can fail — external calls, parsing, database operations, anything with a real failure mode — and when deciding how a failure gets surfaced (logs, user-facing message, API error shape). |
| [`warisskill-performance-optimization`](skills/warisskill-performance-optimization/SKILL.md) | A performance issue is suspected or reported, when profiling is needed, or when writing code that touches a known cheap-to-get-right performance floor (pagination, indexing, N+1 queries). |
| [`warisskill-react-performance`](skills/warisskill-react-performance/SKILL.md) | Writing or reviewing React/React Native UI where render behavior matters — unnecessary re-renders, long lists, memoization calls, or janky typing/scroll. |
| [`warisskill-security-practices`](skills/warisskill-security-practices/SKILL.md) | Writing code that touches authentication, secrets, user input, database queries, or external requests — this is a coding- time baseline, not an audit-time-only concern. |
| [`warisskill-testing-strategy`](skills/warisskill-testing-strategy/SKILL.md) | Deciding what level of automated testing a feature needs beyond unit-level TDD — whether it warrants an E2E test, and what the integration-test bar is for a new API endpoint. |

### Research

| Skill | What it decides |
|---|---|
| [`warisskill-research-methodology`](skills/warisskill-research-methodology/SKILL.md) | The foundation for any research task — evaluating source credibility, triangulating claims, and calibrating claim strength to evidence. The other research skills below build on this rather than restate it. |
| [`warisskill-research-academic`](skills/warisskill-research-academic/SKILL.md) | Literature reviews, finding and evaluating peer-reviewed work, systematic-style search discipline, and scholarly citation practice. |
| [`warisskill-research-technical`](skills/warisskill-research-technical/SKILL.md) | Pre-implementation research — evaluating libraries and approaches, reading docs/source/RFCs, avoiding the version-staleness trap, and running a disciplined spike. |
| [`warisskill-research-startup-feasibility`](skills/warisskill-research-startup-feasibility/SKILL.md) | Validating whether a new initiative — startup idea, product line, or internal build — is worth pursuing: market/competitive/technical/financial feasibility plus real-world validation, before `marketing-research` ever gets involved. |

### Documentation

| Skill | What it decides |
|---|---|
| [`documentation-architect`](skills/documentation-architect/SKILL.md) | Execution-grade PRDs, SRSs, architecture docs, implementation plans, ADRs, and full project documentation systems — treats documentation as an executable spec another AI agent could implement from, with adaptive questioning, decision challenging, and cross-document consistency checking. Distinct from `warisskill-documentation-practices` (below), which is a lightweight code-level convention: when a README/API doc gets written at all, not how to author a full spec set. |

### Marketing

| Skill | What it decides |
|---|---|
| [`marketing-research`](skills/marketing-research/SKILL.md) | Use this skill for any marketing research, product positioning, copywriting research, or audience profiling task. |

## Bootstrap on a new machine

This library is meant to be used alongside a few companion tools:
[ponytail](https://ponytail.dev) (minimal-code coding ruleset),
[Impeccable](https://impeccable.style) (anti-AI-slop design polish), and
[Taste](https://www.tasteskill.dev) (anti-templated frontend generation).
`scripts/bootstrap.sh` (or `scripts/bootstrap.ps1` on native Windows
PowerShell) installs all of them, plus this library itself, globally for
every coding agent it detects on the machine:

```bash
git clone https://github.com/SodiqAbdulwaris/waris-skill-library.git
cd waris-skill-library
./scripts/bootstrap.sh
```

On a new machine, this is also the thing to tell a fresh coding agent to
do — "clone SodiqAbdulwaris/waris-skill-library and run its bootstrap
script" is enough for it to pick up this whole setup, companion tools
included, without re-deriving which ones or how. Safe to re-run any time
to pick up updates.

## Using this library

### Claude Code

**As a plugin (recommended):**

```
/plugin marketplace add SodiqAbdulwaris/waris-skill-library
/plugin install waris-skill-library
```

**Or manually:**

```bash
git clone https://github.com/SodiqAbdulwaris/waris-skill-library.git
cp -r waris-skill-library/skills/* ~/.claude/skills/
```

### Codex

Codex's plugin marketplace reads the same `.claude-plugin/` manifest. Verified working:

```bash
codex plugin marketplace add SodiqAbdulwaris/waris-skill-library
codex plugin add waris-skill-library@waris-skill-library
```

Codex also reads `AGENTS.md` automatically for any project this repo is opened in, independent of the plugin install.

### OpenCode

Clone the repo, then point OpenCode's config at it — `.opencode/opencode.json` already does this (`skills.paths` → `../skills`, `instructions` → `AGENTS.md`). Open the repo as an OpenCode project, or merge those two keys into your own `opencode.json`.

### Antigravity

The `agy` CLI's `import claude` only picks up plugins already registered in Claude Code, and its `plugin install` doesn't take a marketplace ref the way Codex's does — it wants a local directory. Verified working:

```bash
git clone https://github.com/SodiqAbdulwaris/waris-skill-library.git
agy plugin install ./waris-skill-library
```

Confirm with `agy plugin list` — it should show `waris-skill-library` with `"components": ["skills"]`.

### Any other tool

A `SKILL.md` is portable content (YAML frontmatter + markdown) — nothing about it is Claude-specific. Most agentic tools without a dedicated adapter here will still read `AGENTS.md` if it's a supported convention for them, or the full skill text is always available under `skills/<name>/SKILL.md` for manual reference or copy-paste into that tool's own config.

## Structure

```
skills/<skill-name>/SKILL.md   canonical source, one per skill
AGENTS.md                      generated — Codex / AGENTS.md-aware tools
.cursor/rules/*.mdc            generated — Cursor
.claude-plugin/                plugin manifest — Claude Code + Codex marketplace install
.opencode/opencode.json        static config — points OpenCode at skills/ directly
scripts/regen_adapters.py      regenerates AGENTS.md + .cursor/rules/ from skills/
```

Run `python scripts/regen_adapters.py` after adding, editing, or removing a skill to keep `AGENTS.md` and `.cursor/rules/` in sync. `.claude-plugin/` and `.opencode/opencode.json` point at the `skills/` directory itself, so they don't need regenerating when skills change — only if the repo is renamed or moved.
