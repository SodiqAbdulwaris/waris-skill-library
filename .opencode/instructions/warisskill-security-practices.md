---
name: warisskill-security-practices
description: >
  Use whenever writing code that touches authentication, secrets,
  user input, database queries, or external requests — this is a coding-
  time baseline, not an audit-time-only concern. Trigger on any new
  endpoint, form, auth flow, database query, or environment-variable
  usage. Complements the installed /security-review skill, which audits
  after the fact — this skill governs what gets written correctly the
  first time, same non-negotiable-baseline treatment as
  warisskill-ui-ux-accessibility.
---

# Security Practices

This is a coding-time baseline, not just an audit checklist — `/security-review`
catches what slips through, but the target is that little slips through.

## Auth: managed provider by default, hand-roll only with a reason

Default to a managed auth provider (Supabase Auth, Clerk, Auth0, or the
platform's native auth) — don't hand-roll session/token handling, password
hashing, or MFA. Hand-rolling is justified only when a specific constraint
forces it: a highly custom auth flow the provider can't express, a hard
no-third-party-dependency requirement, or genuine data-residency/compliance
constraints. Absent one of those, reaching for a managed provider is the
default, not a decision to re-litigate per project.

## Secrets: .env + platform env vars

`.env` files (gitignored, never committed) for local dev, platform-native
environment variable injection (Vercel/Render/Fly/etc. env config) in
production. This is sufficient at solo/small-team scale — a dedicated
secrets manager (Vault, AWS Secrets Manager) is overkill until there's a
team/compliance reason to pay that operational cost.

Never log a secret, never include one in an error message, never hardcode
one "temporarily" — there's no safe temporarily for a credential.

## Non-negotiable coding-time baseline

Apply while writing the code, not deferred to review:

- **Input validation at every trust boundary** — anything crossing from
  outside the system (request bodies, query params, file uploads,
  webhook payloads) gets validated before use. Never trust client-supplied
  data implicitly.
- **Parameterized queries, always** — no string-concatenated SQL, no
  exceptions. ORM query builders count as parameterized; raw string
  interpolation into a query does not.
- **Output encoding by context** — HTML/JS/URL encoding appropriate to
  where data is rendered, to prevent injection into templates/DOM.
- **Auth checks on every state-changing endpoint** — never assume a route
  is safe because the UI doesn't expose it; the API boundary is the real
  boundary.
- **Security headers and cookie flags by default**: `HttpOnly`, `Secure`,
  `SameSite` on session cookies; basic CSP/HSTS/X-Frame-Options on
  web responses where the framework makes this close to free to set.
- **CSRF protection** on state-changing requests using cookie-based
  sessions (SameSite cookies cover most cases; add explicit tokens if
  cross-site form submission is a real concern).
- **Rate limiting** on auth endpoints and anything cheap to abuse (login,
  password reset, signup) — even a basic in-memory/DB-backed limiter beats
  none at this scale.
- **Generic error messages externally, full detail in logs only** — never
  leak stack traces, internal paths, or query details in an API error
  response.

## SSRF/external request hygiene

When the server makes outbound requests based on user-influenced input
(webhooks, URL fetchers, image proxies), validate/allowlist destinations
and block requests to internal/private IP ranges — this is a common
overlooked path into internal infrastructure.

## Limitations

- This is defensive/secure-coding baseline for building features, not
  penetration testing, compliance auditing, or incident response — those
  are separate, more specialized concerns outside this skill's scope.
