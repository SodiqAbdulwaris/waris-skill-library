---
name: warisskill-performance-optimization
description: >
  Use when a performance issue is suspected or reported, when profiling is
  needed, or when writing code that touches a known cheap-to-get-right
  performance floor (pagination, indexing, N+1 queries). Trigger on
  "this feels slow," load time complaints, or before adding caching/
  optimization complexity. Do NOT use this to justify premature
  optimization — the measurement workflow below is the gate before any
  optimization work, except for the proactive floor items which apply
  regardless.
---

# Performance Optimization

## Proactive floor: cheap defaults, no measurement required

A handful of things are worth doing right by default because they're
nearly free upfront and expensive to retrofit — apply these without
waiting for a profiler to justify them:

- **Paginate any list that could grow unbounded** — never return "all
  rows" from an endpoint or query without a limit.
- **Index columns used in `WHERE`/`JOIN`/`ORDER BY`**, especially foreign
  keys — an unindexed foreign key lookup is a common silent slow-query
  cause that's invisible until the table grows.
- **Avoid N+1 queries** — a loop that issues one query per iteration
  instead of one batched query is a default-avoid, not a
  measure-first-then-fix case; the fix (a join or batched fetch) is
  usually no more code than the N+1 version.
- **Debounce/throttle** high-frequency user input handlers (search-as-
  you-type, scroll/resize listeners) — cheap to add, prevents an entire
  class of jank.

These aren't "optimization" in the premature sense — they're the
straightforward way to write the code the first time, same tier as
choosing a semantic HTML element in accessibility work.

## Everything else: measure before optimizing

Beyond the floor above, performance work follows a strict evidence-first
loop — no fixing what hasn't been shown to be a bottleneck:

```
MEASURE → IDENTIFY → FIX → VERIFY → GUARD
```

1. **Measure** — establish a baseline with real data. Synthetic
   (Lighthouse/DevTools Performance tab) for controlled, reproducible
   checks; real-user data (web-vitals, APM) to confirm a fix actually
   helped in practice, not just in a synthetic run.
2. **Identify** — find the actual bottleneck the measurement points to,
   not the one that seems intuitively likely.
3. **Fix** — address that specific bottleneck, nothing else.
4. **Verify** — measure again, confirm the fix actually moved the number.
5. **Guard** — add a regression check (a perf budget in CI, a simple
   timing assertion) so the fix doesn't silently regress later.

## Core Web Vitals targets (web)

| Metric | Good | Needs improvement |
|---|---|---|
| LCP (Largest Contentful Paint) | ≤ 2.5s | ≤ 4.0s |
| INP (Interaction to Next Paint) | ≤ 200ms | ≤ 500ms |
| CLS (Cumulative Layout Shift) | ≤ 0.1 | ≤ 0.25 |

Use these as a guide for whether a real problem exists, not a mandate to
chase every fraction of a point once "Good" is already hit.

## Where to look, by symptom

- **Slow first load**: large bundle → check code splitting; slow server
  response → profile backend + check queries/caching; render-blocking
  resources → check the network waterfall.
- **Sluggish interaction**: profile main thread for long tasks (>50ms);
  check for unnecessary re-renders.
- **Slow after navigation**: measure API response times, check for
  request waterfalls or N+1 fetches (should already be avoided per the
  floor above, but verify).

## Limitations

- This is not a mandate to add caching, memoization, or other complexity
  preemptively — that still requires the measure-first loop. Only the
  floor items above are exempt from "prove it's slow first."
