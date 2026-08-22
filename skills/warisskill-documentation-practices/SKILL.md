---
name: warisskill-documentation-practices
description: >
  Use when a README or project doc is explicitly requested (standing
  global rule: never create those unprompted), and use automatically
  whenever an API is being built or changed — API documentation is
  always-on, not request-gated. Trigger on any new/changed endpoint for
  the API-docs path, and on explicit doc requests for the README path.
---

# Documentation Practices

Standing rule (unchanged, this skill doesn't loosen it): never create a
README or general project doc unless explicitly asked. **API
documentation is the one exception** — it's generated automatically
whenever an API exists, no request required. See below.

## Depth: scale to audience, not a fixed default

- **Solo/scratch project, nobody else will read it**: minimal but
  complete — what it is, how to run it locally, key commands. A future-you
  refresher, not a pitch document.
- **Meant for other people or clients**: comprehensive — setup, a real
  explanation of how the system works (not just file listing), and
  deployment notes if the reader might need to deploy it themselves.

Ask which register applies if it's not obvious from context (a client
deliverable vs a personal tool) rather than defaulting to either extreme.

## Minimal README structure

```markdown
# Project Name
One-line description.

## Setup
[exact commands to get running locally]

## Key Commands
[test, build, lint, etc.]
```

## Comprehensive README structure (adds to the above)

- **How it works**: the real architecture — main entry points, how data
  flows, what depends on what. Enough that someone unfamiliar with the
  codebase can orient without reading every file.
- **Configuration**: environment variables, what each one does, where
  defaults live.
- **Deployment**: how it actually gets to production — build steps,
  target platform, anything environment-specific.

## API documentation: always, generated from code

Every API — regardless of whether it has external consumers yet — gets
documentation, generated from code annotations (OpenAPI/Swagger for REST,
schema-derived docs for GraphQL, JSDoc/TSDoc for internal service
interfaces), not hand-written. This is not gated behind a request; it's
part of building the API, the same way an endpoint gets a
`warisskill-system-design-api-design`-shaped error response without being
asked for one.

Generate, don't hand-write, specifically because hand-written API docs
drift from the code fastest of any documentation type — annotation-driven
generation keeps the doc and the implementation from diverging.

## Limitations

- This does not cover code comments (governed by ponytail — comment only
  the non-obvious why) or ADRs (governed by
  `warisskill-system-design-decision-making`) — those are separate,
  narrower documentation decisions with their own rules.
