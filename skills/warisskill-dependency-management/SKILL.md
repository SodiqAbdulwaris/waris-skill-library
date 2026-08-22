---
name: warisskill-dependency-management
description: >
  Use when a new dependency is genuinely being considered for
  installation — after ponytail's ladder already established that
  stdlib/native/an existing dependency doesn't cover it. This skill
  governs which package to pick and how much to vet it, not whether a
  dependency is justified at all (that's ponytail's rung 5).
---

# Dependency Management

Scope note: whether a new dependency is warranted at all is `ponytail`'s
job (rung 5 — stdlib, native, and already-installed deps come first).
This skill only applies once that gate has already been cleared.

## Vetting: quick check always, deep vetting for security-sensitive deps

**Every new dependency** gets a fast sanity check before installing:
last-published date, rough popularity (downloads/stars), whether it's
actively maintained. This is a glance, not an investigation — catches
obviously abandoned or sketchy packages for near-zero cost.

**Security-sensitive dependencies** — auth, crypto, payment handling,
anything doing deserialization or FFI, anything in the direct path of
`warisskill-security-practices`'s baseline — get the full checklist:

- Single/anonymous maintainer vs an organization-backed project
- Unmaintained/archived, or a large backlog of unaddressed security issues
- Low popularity relative to alternatives (fewer eyes = slower to notice
  a compromise)
- Known CVE history disproportionate to the project's popularity/scope
- No security contact (`SECURITY.md`, listed contact) for responsible
  disclosure

If a security-sensitive package trips one of these, look for a more
established alternative before installing — don't proceed just because it
technically does the job.

## Bundle size: matters for client-side, not backend

For anything shipped to the browser or a mobile client, prefer the
lighter option when two dependencies are otherwise equivalent in fit and
maintenance — bundle weight is a real UX cost there (ties to
`warisskill-performance-optimization`'s Core Web Vitals targets).
Backend/server dependencies don't need this scrutiny — size isn't the
constraint there; fit and maintenance are.

## Limitations

- This is pre-install vetting, not an ongoing audit of an existing
  dependency tree — for auditing what's already installed, that's a
  separate periodic task, not something to run on every dependency
  decision.
