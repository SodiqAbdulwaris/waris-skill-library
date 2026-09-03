---
name: warisskill-workflows-agent-log
description: >
  Use at the end of any non-trivial piece of work — a code review
  performed, a bug root-caused, a decision made along the way, a feature
  shipped, or a performance/research investigation completed — to record
  it in this project's running work log under `docs/agent-log/`. Trigger
  whenever another skill's work produces a real finding or outcome, not
  for one-off questions, trivial edits, or exploratory back-and-forth that
  didn't land anywhere. This is a private, untracked work journal — not a
  substitute for `warisskill-documentation-practices` (README/API docs),
  `documentation-architect` (formal specs), or
  `warisskill-system-design-decision-making` (ADRs, which stay their own
  tracked, explicitly-confirmed artifact in `docs/adr/`).
---

# Agent Work Log

A running, per-project trail of what an agent actually did — so a review,
an investigation, or the reasoning behind a fix survives past the chat
scrollback it happened in, without becoming a second documentation system.

## What counts as "non-trivial"

Write an entry when there's a real finding or outcome to preserve: a
completed code review, a bug that took real investigation to root-cause,
a decision made in passing that isn't significant enough for a full ADR,
a shipped feature, a performance investigation, a research conclusion.
Skip it for one-off questions, trivial edits, and exploration that didn't
land anywhere — this is a log of outcomes, not a transcript.

## Where it lives

`docs/agent-log/<category>/` at the root of whatever project is being
worked in. Untracked by default: the first time this is used in a
project, check `.gitignore` for a `docs/agent-log/` entry and add one if
it's missing, before writing anything. Never commit the directory unless
the user explicitly asks to.

## Categories

| Category | Prefix | What goes here |
|---|---|---|
| `reviews/` | `R` | code review findings |
| `debugging/` | `D` | root-caused bugs, investigation trails |
| `observations/` | `O` | noticed-in-passing things worth remembering, not yet actioned |
| `improvements/` | `I` | suggested or completed cleanups |
| `decisions/` | `DEC` | a contemporaneous note on a choice made along the way (not a substitute for a full ADR — if the choice clears `warisskill-system-design-decision-making`'s bar, that skill's own confirm-then-write-to-`docs/adr/` flow still applies; this entry just links to the resulting ADR once one exists) |
| `performance/`, `research/` | `P`, `RS` | investigation write-ups |

Not a fixed list — create the subdirectory and pick a short, stable
prefix for a new kind of work, avoiding collisions with prefixes already
in use elsewhere in the log; reuse an existing category before inventing
a near-duplicate.

## File format

One file per topic or finding, not one growing log file. The filename is
the category's prefix plus a zero-padded sequential number — not a date
or topic slug: `docs/agent-log/<category>/<PREFIX>-NNN.md` (e.g.
`R-001.md`, then `R-002.md`). Numbering is per category: scan that
category's directory for the highest existing `NNN` and increment; never
reuse or renumber a file once written.

The date and topic live inside the file instead, as the first two lines.
Keep each entry as short as the finding warrants — a few lines for
something small, more for something that needs it:

```markdown
# Short title
**Date:** 2026-09-03

What happened / what was found.

Outcome — what changed as a result, or what's still open.

See also: [related entry](../decisions/DEC-004.md)
```

## Cross-referencing

Link between agent-log entries and to real repo files with relative
markdown links (`[auth.ts](../../../src/auth.ts)`), so the log stays
navigable as it grows instead of becoming a pile of disconnected notes.

## Limitations

- Not ADRs — `warisskill-system-design-decision-making` still owns
  significant, hard-to-reverse decisions and `docs/adr/`.
- Not user-facing documentation — READMEs and API docs stay
  `warisskill-documentation-practices` and `documentation-architect`'s
  territory.
- Gitignored by default — this is the agent's own working notes, not
  project history, unless the user says otherwise.
