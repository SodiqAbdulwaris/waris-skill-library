---
name: warisskill-workflows-git
description: >
  Use when starting a new project's git setup, creating branches, writing
  commit messages, or bringing a feature branch up to date with main.
  Trigger on any git operation involving branch strategy, commit message
  authoring, or merge/rebase decisions. Does not override explicit user
  git-safety rules already in effect (never force-push, never skip hooks,
  always confirm before destructive operations) — this skill is about
  convention and style, not permission to act unprompted.
---

# Git Workflow

## Branching strategy: GitHub Flow, unless a project dictates otherwise

Default for greenfield/personal projects:

```
main (protected, always deployable)
  ├── feature/user-auth   → PR → merge to main
  └── fix/login-bug       → PR → merge to main
```

- `main` is always deployable.
- Feature/fix branches off `main`, named `feature/<slug>` or `fix/<slug>`.
- No `develop` branch, no release branches — that's GitFlow overhead this
  scale doesn't need.

If a client/existing project already has an established branching
convention (GitFlow, trunk-based, something custom), match it instead —
this default only applies to greenfield work.

## Commit messages: Conventional Commits

```
<type>(<scope>): <subject>

[optional body — the why, not a restatement of the diff]
```

Types: `feat`, `fix`, `refactor`, `chore`, `docs`, `test`, `perf`, `style`.
Keep the subject line imperative and short; use the body only when the
*why* isn't obvious from the diff itself — don't pad commits with
restated file lists.

## Rebase your branch, merge/squash into main

- Rebase feature branches onto `main` to stay current and keep history
  linear — this is safe because the branch is unshared/personal.
- Never rebase a branch other people are actively working from.
- Merge (or squash-merge) into `main` — one clean commit or a small
  logical set per feature, not a pile of "wip" / "fix typo" commits
  landing on `main`.

## PR habit

Open a PR even solo — it's the natural checkpoint for `/code-review` and
keeps `main` protected/deployable. Push directly to `main` only for truly
trivial changes (typo fixes, config tweaks) where a PR is pure overhead.

## Standing safety rules (not overridden by this skill)

- Never force-push without explicit confirmation.
- Never skip hooks (`--no-verify`) or bypass signing.
- Run `git status` before any command that could discard uncommitted work.
- These apply regardless of the workflow conventions above — convention
  governs *how* branches/commits are shaped, not permission to run
  destructive git operations unprompted.

## Limitations

- Merge conflict resolution strategy and multi-repo/worktree workflows
  aren't covered here — this is branch/commit/merge convention only.
