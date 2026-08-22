---
name: warisskill-system-design-distributed-patterns
description: >
  Use when a system already is distributed (client project with existing
  microservices, multiple deployables, or a message bus) or when deciding
  whether to introduce distribution into a currently-monolithic system —
  splitting a service, adding a queue, introducing eventual consistency, or
  coordinating a multi-step process across ownership boundaries. Trigger on
  explicit distributed-systems work, or when a design conversation reaches
  for "microservice," "event-driven," "saga," "eventual consistency," or
  "message queue." For a system that is NOT yet distributed, this skill's
  first job is the gate below, not applying a pattern.
---

# Distributed Systems Patterns

## If the system isn't distributed yet: gate first

Most systems should stay a modular monolith (clear internal boundaries via
`warisskill-system-design-domain-modeling`, but one deployable) until a
concrete trigger forces distribution. Reach for a distributed pattern only
when one of these is actually true, not speculatively:

- **A specific component needs independent scaling** — e.g. heavy
  background processing that shouldn't compete for resources or deploy
  cadence with the main app.
- **A team boundary requires independent deployability** — different
  owners need to ship on separate schedules without coordinating releases.
- **A genuine cross-boundary async workflow exists** — a multi-step
  process spanning ownership/data boundaries that can't be one transaction
  (e.g. payment → inventory → notification).

If none of these apply, the answer is "stay a monolith" — say so
explicitly rather than defaulting to distributed patterns because the
project or conversation is about system design.

If the project already arrives distributed (existing client system with
microservices already in place), skip the gate — work within what's
already there.

## Service boundaries

Draw service boundaries around the trigger that justified splitting, not
around generic layers (don't split "the API service" and "the database
service" — that's a distributed monolith, not microservices). A service
boundary should map to a real ownership or scaling boundary from the gate
above.

## Communication patterns

- **Synchronous (REST/gRPC)** for request-response where the caller needs
  an immediate answer.
- **Async (message queue/event bus)** for the cross-boundary workflow
  case — decouples services so one being down doesn't cascade, and is the
  natural fit when the trigger was "a multi-step process spanning
  ownership boundaries."
- Don't reach for async messaging as a default for every inter-service
  call — it adds operational complexity (queue infrastructure,
  eventual-consistency reasoning, harder debugging) that's only worth
  paying when the workflow genuinely needs decoupling.

## Saga pattern (for the cross-boundary async workflow trigger)

When a business process spans services and can't be one transaction:

- **Choreography** (services react to each other's events) for a small
  number of steps with no central coordinator needed.
- **Orchestration** (a coordinator service drives the steps explicitly)
  once the workflow has enough steps or compensating-action logic that
  choreography becomes hard to trace.
- Every step needs a defined compensating action for rollback — a saga
  without compensation logic isn't a safety net, it's a partial-failure
  trap.

## Event sourcing / CQRS

Reserve for when the trigger genuinely calls for it — an audit trail of
every state change is a real business requirement, or read/write load
patterns are different enough that separate models pay off. Both add
substantial complexity (event replay, eventual consistency between read
models) — don't introduce them just because a system is already
distributed; distribution and event-sourcing are separate decisions.

## Limitations

- This skill assumes the operational capacity to run distributed
  infrastructure exists or is being built alongside the pattern — a
  distributed pattern with no monitoring/tracing/on-call story is a
  liability, not an architecture win.
