---
name: warisskill-system-design-domain-modeling
description: >
  Use when structuring a non-trivial backend feature or service — deciding
  how business logic relates to I/O (HTTP, database, external APIs), and
  how domain concepts are represented in code. Trigger when starting a new
  service/feature with real business logic, when domain logic is tangled
  with framework/transport code, or when a PR mixes DB queries directly
  into business rules. Companion to
  warisskill-system-design-decision-making (structural choice here rarely
  needs an ADR — it's the applied default, not a one-off decision) and
  warisskill-system-design-distributed-patterns (this skill is single-service
  domain structure; that one is cross-service).
---

# Domain Modeling

## Structural default: full ports & adapters, applied by default

Hexagonal architecture (ports and adapters) on any non-trivial feature —
not gated behind "does a second implementation exist yet." Business logic
never imports framework/transport/persistence code directly.

- **Domain/application layer**: business rules, use cases. No framework
  imports, no direct DB/HTTP calls.
- **Ports**: interfaces the application layer depends on
  (`UserRepositoryPort`, `BillingGatewayPort`) — model capabilities, not
  technologies.
- **Adapters**: concrete implementations at the edge (Postgres repository,
  HTTP client, queue consumer). Adapters depend inward on ports; nothing
  depends outward on adapters.
- **Composition root**: one place where concrete adapters get wired to use
  cases — avoid scattering instantiation/service-locator lookups
  throughout the codebase.

This is a default for structure, not a one-off decision to weigh pros/cons
on every feature — apply it the same way every time rather than deciding
fresh per PR.

## Domain modeling depth: lightweight, not full tactical DDD

Use the parts of DDD that pay off immediately; skip the ceremony that
doesn't:

- **Do use**: meaningful entities and value objects where they clarify or
  protect the domain — a `Money` value object instead of a raw float, a
  validated `Email` type instead of a bare string, an entity with a clear
  identity instead of an anonymous record.
- **Skip by default**: aggregate roots, domain events, full repository
  abstractions as a DDD-specific pattern (the repository *port* from
  hexagonal architecture above already covers persistence abstraction —
  don't additionally layer DDD aggregate/repository ceremony on top unless
  the domain's actual complexity demands it).
- Reach for the fuller tactical toolkit (aggregates, domain events) only
  when a specific domain genuinely has the complexity that justifies it —
  e.g. multi-step invariants that must hold across several entities, or a
  real need for eventual-consistency-via-events. Don't apply it
  prophylactically.

## How this composes

A typical feature: an inbound adapter (HTTP handler) converts a request
into a use-case input → the use case (application layer) orchestrates
domain logic using entities/value objects and calls outbound ports →
outbound adapters (DB repository, external API client) implement those
ports. Test the use case against fake/in-memory port implementations
without spinning up real infrastructure.

## Limitations

- This is the single-service/single-deployable default. Once a system
  genuinely spans multiple services, see
  `warisskill-system-design-distributed-patterns` for the additional
  concerns (eventual consistency, sagas, service boundaries) that domain
  modeling alone doesn't cover.
