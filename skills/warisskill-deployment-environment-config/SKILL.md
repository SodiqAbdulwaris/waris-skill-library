---
name: warisskill-deployment-environment-config
description: >
  Use when setting up deployment for a new project, configuring CI/CD, or
  structuring environment-specific config (dev/staging/prod). Trigger on
  project scaffolding, first deploy setup, or when environment variables
  need organizing across environments. Deployment platform choice is
  project-dependent (see below); CI/CD floor and env-var structure are
  fixed defaults.
---

# Deployment & Environment Config

## Deployment platform: no fixed default, decide per project

Managed PaaS (Vercel, Render, Fly, Railway) vs self-managed
infrastructure depends on the project's actual constraints — client
requirements, existing infra, cost model, or specific platform features
needed. Default toward managed PaaS when nothing else dictates the
choice (less operational burden at solo/small-team scale), but this is a
per-project call, not an assumption.

## CI/CD floor: basic pipeline on every project

Every project gets a minimum GitHub Actions pipeline, even solo work:

```yaml
# .github/workflows/ci.yml (shape, not exact syntax)
on: [pull_request]
jobs:
  ci:
    steps:
      - build/typecheck
      - lint
      - test
```

Block merge on failure. This is the automated version of
`warisskill-workflows-feature-delivery`'s definition-of-done — cheap to
set up once, catches regressions before they land on `main` without
relying on remembering to run checks manually every time.

## Environment config structure

- `.env.example` checked into the repo, documenting every variable a
  developer needs (names only, no real values) — this is the reference
  for what config exists, ties to `warisskill-security-practices`'
  `.env` secrets approach.
- Actual values differ per environment (dev/staging/prod) via the
  platform's own env var mechanism (Vercel/Render/Railway dashboard,
  GitHub Actions secrets for CI) — never a shared `.env` committed with
  real values, never the same secrets reused across environments where
  avoidable.
- Config that varies by environment (API base URLs, feature flags,
  log level) lives in env vars, not hardcoded per-environment branches
  in code.

## Deployment strategy: PaaS-handled by default, know it for self-managed cases

On a managed PaaS, rolling/zero-downtime deployment is handled
automatically — don't manually reason about deployment strategy there.
Relevant only when self-managing infrastructure (a client project with
its own servers/K8s):

- **Rolling** (default): instances update gradually, zero downtime,
  requires backward-compatible changes during the overlap window.
- **Blue-green**: two full environments, atomic traffic switch, instant
  rollback — worth the 2x infra cost only for critical services with
  zero tolerance for a bad deploy.
- **Canary**: small traffic percentage to the new version first — worth
  the added complexity only for high-traffic services where testing
  against real traffic before full rollout matters.

## Limitations

- This is deployment/config structure, not infrastructure-as-code
  authoring (Terraform, CDK, etc.) or container orchestration setup —
  those are implementation detail once a self-managed path is chosen.
