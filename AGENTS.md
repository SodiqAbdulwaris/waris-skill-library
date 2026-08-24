# AGENTS.md

Standing instructions for coding agents (Codex, and other AGENTS.md-aware tools) working in a project where this library is available. This file indexes a personal skill library — read the relevant `skills/<name>/SKILL.md` in full before applying it; the entries below are the trigger conditions, not the complete instructions.

These skills encode specific working decisions made through an interview process — apply them as defaults, not suggestions, when their trigger condition matches the current task.

## UI/UX Design

### `warisskill-ui-ux-accessibility`

Use whenever building or reviewing any interactive UI, on any platform (web, iOS, Android, desktop) — this is a non-negotiable baseline, not an optional pass. Trigger on any new component, form, modal, navigation element, or icon-only control, and on any PR/change that touches markup, styling, or interaction. Also trigger when asked to review or audit a UI. Do not defer this to "later" or treat it as separate from the initial build — build to WCAG 2.2 AA the first time, not as cleanup.

Full instructions: `skills/warisskill-ui-ux-accessibility/SKILL.md`

### `warisskill-ui-ux-design-systems-tokens`

Use when setting up or extending the styling foundation of a web project — choosing/configuring a component library, defining color/radius/font tokens, deciding token naming, or wiring up dark mode. Trigger on new project setup, "make this not look like default shadcn," theming work, or when a PR introduces raw hex/px values that should be tokens instead. Web stack only (Tailwind + shadcn/Radix-style) — for native mobile/desktop platform theming see the platform-specific skills, and for choosing the overall aesthetic mode (minimal/dense/bold) see warisskill-ui-ux-visual-design-taste, which this skill's customization step should follow.

Full instructions: `skills/warisskill-ui-ux-design-systems-tokens/SKILL.md`

### `warisskill-ui-ux-motion-design`

Use when adding, reviewing, or fixing any UI animation or transition on web — button feedback, modal/panel enter-exit, page transitions, scroll-linked reveals, loading/skeleton states, hover/drag interactions. Trigger on animation jank/stutter reports, "make this feel more alive," or when a component change introduces new motion. Depends on warisskill-ui-ux-visual-design-taste for how expressive the motion should be — pick that mode first.

Full instructions: `skills/warisskill-ui-ux-motion-design/SKILL.md`

### `warisskill-ui-ux-responsive-multiplatform`

Use when a UI needs to work across screen sizes (responsive web layout) or across platforms (web + React Native/Expo + SwiftUI + Jetpack Compose + desktop). Trigger when starting layout for a new screen, when a component needs breakpoint/viewport behavior, or when deciding whether a cross-platform product should share one design language or go fully platform-native. Pairs with warisskill-ui-ux-design-systems-tokens for the underlying values and warisskill-ui-ux-visual-design-taste for the aesthetic mode being adapted.

Full instructions: `skills/warisskill-ui-ux-responsive-multiplatform/SKILL.md`

### `warisskill-ui-ux-visual-design-taste`

Use whenever a UI needs a visual direction decided with no designer, brand guide, or existing design system to follow — a new project's first screen, a prototype that needs to look intentional, or when asked "make this look good" with no other constraints. Also trigger when an existing project already has a UI library or design system in place and the instinct would otherwise be to override its taste. Not for accessibility, motion, design tokens, or responsive-breakpoint decisions specifically — those are separate skills; this one only decides the aesthetic mode and how strictly to hold it.

Full instructions: `skills/warisskill-ui-ux-visual-design-taste/SKILL.md`

## System Design

### `warisskill-system-design-api-design`

Use when designing or reviewing an API — REST endpoint shape, status codes, response format, pagination, error responses, or versioning strategy. Trigger when creating new endpoints, reviewing an existing API contract, or when choosing between REST and GraphQL for a new project. Applies at the single-service level — for how a service's internal business logic is structured, see warisskill-system-design-domain-modeling; for inter-service API contracts in a distributed system, see warisskill-system-design-distributed-patterns.

Full instructions: `skills/warisskill-system-design-api-design/SKILL.md`

### `warisskill-system-design-decision-making`

Use when a genuinely significant, hard-to-reverse technical choice is being made — database engine, auth strategy, framework/major library swap, a boundary that's expensive to undo later. Trigger by noticing the decision moment yourself (a real alternative was weighed and rejected, or the user says "we decided to..." / "the reason we chose X over Y..."), not just by explicit request. Do NOT reach for this on routine or easily reversible decisions — most day-to-day architectural-flavored choices on solo/small-team work don't warrant a written record. Companion to warisskill-system-design-domain-modeling and warisskill-system-design-distributed-patterns — this skill governs whether a decision gets documented, not whether a pattern gets applied.

Full instructions: `skills/warisskill-system-design-decision-making/SKILL.md`

### `warisskill-system-design-distributed-patterns`

Use when a system already is distributed (client project with existing microservices, multiple deployables, or a message bus) or when deciding whether to introduce distribution into a currently-monolithic system — splitting a service, adding a queue, introducing eventual consistency, or coordinating a multi-step process across ownership boundaries. Trigger on explicit distributed-systems work, or when a design conversation reaches for "microservice," "event-driven," "saga," "eventual consistency," or "message queue." For a system that is NOT yet distributed, this skill's first job is the gate below, not applying a pattern.

Full instructions: `skills/warisskill-system-design-distributed-patterns/SKILL.md`

### `warisskill-system-design-domain-modeling`

Use when structuring a non-trivial backend feature or service — deciding how business logic relates to I/O (HTTP, database, external APIs), and how domain concepts are represented in code. Trigger when starting a new service/feature with real business logic, when domain logic is tangled with framework/transport code, or when a PR mixes DB queries directly into business rules. Companion to warisskill-system-design-decision-making (structural choice here rarely needs an ADR — it's the applied default, not a one-off decision) and warisskill-system-design-distributed-patterns (this skill is single-service domain structure; that one is cross-service).

Full instructions: `skills/warisskill-system-design-domain-modeling/SKILL.md`

## Clean Code

### `warisskill-clean-code-naming-style`

Use when writing or renaming variables, functions, types, or files in any language — naming casing conventions and function-naming shape. This is narrower than ponytail (which governs whether code should exist and how little of it there should be) — this skill only governs what things are called once they're being written. Immutability and simplification are ponytail's territory, not this skill's.

Full instructions: `skills/warisskill-clean-code-naming-style/SKILL.md`

### `warisskill-clean-code-review-etiquette`

Use whenever giving code review feedback (via /code-review or inline in conversation) or when I am receiving feedback/corrections about my own output from the user. Governs tone and response pattern, not the technical review criteria itself — /code-review and /simplify already cover what to look for. Trigger on any review output I produce, any pushback exchange, and any moment the user corrects something I did or points out a mistake in my work. Not for the user narrating their own reaction to someone else's suggestion (e.g. them agreeing with a teammate) — only when the correction is directed at me.

Full instructions: `skills/warisskill-clean-code-review-etiquette/SKILL.md`

## Workflows

### `warisskill-workflows-feature-delivery`

Use before declaring any feature or fix complete — the definition-of-done checklist and the hard rule against claiming success without fresh evidence. Trigger on any moment about to state "done," "tests pass," "this works," or similar, and before any commit/PR. This governs what gates completion; warisskill-workflows-planning governs what happens before implementation starts.

Full instructions: `skills/warisskill-workflows-feature-delivery/SKILL.md`

### `warisskill-workflows-git`

Use when starting a new project's git setup, creating branches, writing commit messages, or bringing a feature branch up to date with main. Trigger on any git operation involving branch strategy, commit message authoring, or merge/rebase decisions. Does not override explicit user git-safety rules already in effect (never force-push, never skip hooks, always confirm before destructive operations) — this skill is about convention and style, not permission to act unprompted.

Full instructions: `skills/warisskill-workflows-git/SKILL.md`

### `warisskill-workflows-planning`

Use before starting implementation on any non-trivial task — decides whether planning stays internal (silent task sequencing) or gets surfaced as an explicit checkpoint the user confirms before code gets written. Trigger on any multi-step feature or fix. Small/clear tasks don't need this skill's surfaced-plan path — just start, per Auto Mode's existing bias toward proceeding without stopping.

Full instructions: `skills/warisskill-workflows-planning/SKILL.md`

### `warisskill-workflows-tdd`

Use when implementing business logic, algorithms, or anything with real edge cases — decides whether to write the test first (red-green-refactor) and what actually warrants a test at all. This does not raise ponytail's existing test-coverage floor (one runnable check for non-trivial logic, nothing for trivial code) — it only decides test-first vs test-after ordering for the logic that does warrant coverage.

Full instructions: `skills/warisskill-workflows-tdd/SKILL.md`

## Engineering Practices

### `documentation-architect`

Creates, maintains, reviews, and evolves execution-grade software and product documentation including PRDs, SRSs, technical specifications, architecture documents, implementation plans, workflows, project plans, API specifications, database specifications, ADRs, test plans, security documentation, research documents, agent instructions, READMEs, and complete project documentation systems. Acts as a requirements engineer, product manager, senior engineer, systems architect, and technical writer depending on the document being produced. Operates in explicit modes (CREATE, UPDATE, REVIEW, AUDIT, REFACTOR, SYNCHRONIZE, GENERATE-SYSTEM) and uses adaptive questioning, requirement validation, decision analysis, project-wide consistency checking, traceability, and implementation-readiness validation. Designed so another AI coding agent can implement from the resulting documentation with minimal clarification.

Full instructions: `skills/documentation-architect/SKILL.md`

### `warisskill-database-modeling-migrations`

Use when creating or altering database schema, writing a migration, or designing a new table/relationship. Trigger on any DDL change, any ORM migration file, or schema design discussion. Migration safety rigor scales with project stage — see the gate below before reaching for zero-downtime ceremony on a pre-launch project.

Full instructions: `skills/warisskill-database-modeling-migrations/SKILL.md`

### `warisskill-dependency-management`

Use when a new dependency is genuinely being considered for installation — after ponytail's ladder already established that stdlib/native/an existing dependency doesn't cover it. This skill governs which package to pick and how much to vet it, not whether a dependency is justified at all (that's ponytail's rung 5).

Full instructions: `skills/warisskill-dependency-management/SKILL.md`

### `warisskill-deployment-environment-config`

Use when setting up deployment for a new project, configuring CI/CD, or structuring environment-specific config (dev/staging/prod). Trigger on project scaffolding, first deploy setup, or when environment variables need organizing across environments. Deployment platform choice is project-dependent (see below); CI/CD floor and env-var structure are fixed defaults.

Full instructions: `skills/warisskill-deployment-environment-config/SKILL.md`

### `warisskill-documentation-practices`

Use when a README or project doc is explicitly requested (standing global rule: never create those unprompted), and use automatically whenever an API is being built or changed — API documentation is always-on, not request-gated. Trigger on any new/changed endpoint for the API-docs path, and on explicit doc requests for the README path.

Full instructions: `skills/warisskill-documentation-practices/SKILL.md`

### `warisskill-error-handling-observability`

Use when writing code that can fail — external calls, parsing, database operations, anything with a real failure mode — and when deciding how a failure gets surfaced (logs, user-facing message, API error shape). Trigger on any new error type, catch block, retry logic, or API error response. Pairs with warisskill-system-design-api-design's error response format and warisskill-security-practices' rule against leaking internals in error messages.

Full instructions: `skills/warisskill-error-handling-observability/SKILL.md`

### `warisskill-performance-optimization`

Use when a performance issue is suspected or reported, when profiling is needed, or when writing code that touches a known cheap-to-get-right performance floor (pagination, indexing, N+1 queries). Trigger on "this feels slow," load time complaints, or before adding caching/ optimization complexity. Do NOT use this to justify premature optimization — the measurement workflow below is the gate before any optimization work, except for the proactive floor items which apply regardless.

Full instructions: `skills/warisskill-performance-optimization/SKILL.md`

### `warisskill-security-practices`

Use whenever writing code that touches authentication, secrets, user input, database queries, or external requests — this is a coding- time baseline, not an audit-time-only concern. Trigger on any new endpoint, form, auth flow, database query, or environment-variable usage. Complements the installed /security-review skill, which audits after the fact — this skill governs what gets written correctly the first time, same non-negotiable-baseline treatment as warisskill-ui-ux-accessibility.

Full instructions: `skills/warisskill-security-practices/SKILL.md`

### `warisskill-testing-strategy`

Use when deciding what level of automated testing a feature needs beyond unit-level TDD — whether it warrants an E2E test, and what the integration-test bar is for a new API endpoint. Trigger when finishing a critical user flow (auth, checkout, core happy path) or any new endpoint. Complements warisskill-workflows-tdd (unit-level coverage floor) — this skill is the layer above that: E2E and integration test scope.

Full instructions: `skills/warisskill-testing-strategy/SKILL.md`

## Marketing

### `marketing-research`

Use this skill for any marketing research, product positioning, copywriting research, or audience profiling task. Triggers include: "research my product", "develop my value proposition", "profile my avatar", "understand my market", "create a unique mechanism", "market awareness", "market sophistication", "ideal customer profile", "ICP research", "positioning research", "copywriting research", "features and benefits", "competitor research", "competitive analysis", or any request to deeply research a product or audience for marketing purposes. Use this skill proactively whenever a user wants to prepare materials for sales copy, landing pages, ads, email sequences, or any persuasion-focused content. If a user says "help me understand my market", "I need to figure out my messaging", "who is my customer", or "what makes my product different", this skill applies immediately.

Full instructions: `skills/marketing-research/SKILL.md`
