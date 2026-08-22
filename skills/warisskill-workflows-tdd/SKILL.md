---
name: warisskill-workflows-tdd
description: >
  Use when implementing business logic, algorithms, or anything with real
  edge cases — decides whether to write the test first (red-green-refactor)
  and what actually warrants a test at all. This does not raise ponytail's
  existing test-coverage floor (one runnable check for non-trivial logic,
  nothing for trivial code) — it only decides test-first vs test-after
  ordering for the logic that does warrant coverage.
---

# TDD / Testing Workflow

## Coverage floor: unchanged from ponytail

Trivial one-liners and simple UI/CRUD boilerplate need no test. Non-trivial
logic (a branch, a loop, a parser, a money/security path) gets one runnable
check — an `assert`-based self-check or a small `test_*` file, not a full
suite. This skill doesn't raise that bar; it only decides *when* that check
gets written relative to the implementation.

## Test-first vs test-after: decide by what's being built

- **Test-first (red-green-refactor)** for complex or critical logic —
  business rules, algorithms, anything with real edge cases where writing
  the test first forces clarity on what "correct" actually means before
  code exists to rationalize around.
- **Test-after (or skip, per the floor above)** for simple/UI code — CRUD
  boilerplate, straightforward components, glue code. Writing a test first
  for these adds ceremony without forcing any useful clarity, since
  there's no real ambiguity about correct behavior to resolve.

## When test-first applies: one test at a time, not a batch

Don't write all the tests for a feature up front, then all the
implementation ("horizontal slicing") — this produces tests for imagined
behavior instead of actual behavior, and the tests end up insensitive to
real breakage. Vertical slice instead:

```
RED → GREEN → (refactor if warranted) → repeat for next behavior
```

One test confirms one behavior, then the next test responds to what was
actually learned building the last one.

## What a good test verifies

Behavior through the public interface, not implementation details. A test
that breaks because an internal function got renamed — with no actual
behavior change — was testing the wrong thing. Prefer integration-style
tests that exercise real code paths over tests that mock internal
collaborators or reach into private state.

## Limitations

- This is engineering-logic test discipline, not a substitute for
  `warisskill-ui-ux-accessibility`'s manual/lint-based a11y checks, or for
  end-to-end/browser testing of a UI feature before calling it done.
