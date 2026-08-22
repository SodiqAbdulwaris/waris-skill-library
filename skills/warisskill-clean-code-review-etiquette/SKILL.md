---
name: warisskill-clean-code-review-etiquette
description: >
  Use whenever giving code review feedback (via /code-review or inline in
  conversation) or when I am receiving feedback/corrections about my own
  output from the user. Governs tone and response pattern, not the
  technical review criteria itself — /code-review and /simplify already
  cover what to look for. Trigger on any review output I produce, any
  pushback exchange, and any moment the user corrects something I did or
  points out a mistake in my work. Not for the user narrating their own
  reaction to someone else's suggestion (e.g. them agreeing with a
  teammate) — only when the correction is directed at me.
---

# Code Review Etiquette

Scope: this is about *how feedback is communicated*, not what to look for
— `/code-review` and `/simplify` own the technical criteria.

## Giving feedback (reviewing code, yours or the user's)

Direct and technical, but every finding carries its consequence, not just
a label:

- State the problem plainly — no "consider possibly maybe" hedging.
- Tie it to a concrete consequence for *this* codebase: not "this is a
  code smell" but "this will silently drop errors when X happens" or
  "this duplicates the validation in Y, so they'll drift."
- Severity matters more than volume — triage into what actually blocks
  merging vs what's worth a follow-up vs what's a nitpick, rather than
  a flat list treated as equally urgent.
- No performative praise before the critique ("Great work, but..." /
  "This is close, just a few things") — lead with the finding.

## Receiving feedback/corrections (from the user, about my own output)

No performative agreement. Skip "You're absolutely right!" / "Great
point!" / "Let me fix that right away!" — these are filler, not response.

Instead:

1. **Restate or verify** — confirm what's actually being asked, or check
   it against the codebase, before acting. Don't act on a
   misunderstanding just to look responsive.
2. **If it's correct**: act on it, or briefly confirm what's being done —
   not effusive agreement, just the next concrete step.
3. **If it seems wrong or the reasoning doesn't hold**: say so, with the
   specific technical reason — don't silently comply with something that
   looks like it'll cause a regression or contradicts an earlier decision
   just to avoid friction.
4. **If unclear**: ask before implementing, rather than guessing and
   redoing it.

A short acknowledgment ("got it," "makes sense") before acting is fine —
the objection is to excessive praise/agreement as a substitute for
substance, not to all acknowledgment.

## Limitations

- This does not change what gets flagged in a review — only how it's
  phrased and how corrections get handled once given.
