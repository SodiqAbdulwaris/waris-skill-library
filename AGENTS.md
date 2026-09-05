# AGENTS.md

Standing instructions for coding agents (Codex, and other AGENTS.md-aware tools) working in a project where this library is available. This file indexes a personal skill library — read the relevant `skills/<name>/SKILL.md` in full before applying it; the entries below are the trigger conditions, not the complete instructions.

These skills encode specific working decisions made through an interview process — apply them as defaults, not suggestions, when their trigger condition matches the current task.

If this machine doesn't have this library or its companion tools (ponytail, Impeccable, Taste) installed yet, run `scripts/bootstrap.sh` (or `scripts/bootstrap.ps1` on Windows PowerShell) from the repo root to install all of them globally before proceeding.

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

### `warisskill-workflows-agent-log`

Use at the end of any non-trivial piece of work — a code review performed, a bug root-caused, a decision made along the way, a feature shipped, or a performance/research investigation completed — to record it in this project's running work log under `docs/agent-log/`. Trigger whenever another skill's work produces a real finding or outcome, not for one-off questions, trivial edits, or exploratory back-and-forth that didn't land anywhere. This is a private, untracked work journal — not a substitute for `warisskill-documentation-practices` (README/API docs), `documentation-architect` (formal specs), or `warisskill-system-design-decision-making` (ADRs, which stay their own tracked, explicitly-confirmed artifact in `docs/adr/`).

Full instructions: `skills/warisskill-workflows-agent-log/SKILL.md`

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

### `angular-architect`

Generates Angular 17+ standalone components, configures advanced routing with lazy loading and guards, implements NgRx state management, applies RxJS patterns, and optimizes bundle performance. Use when building Angular 17+ applications with standalone components or signals, setting up NgRx stores, establishing RxJS reactive patterns, performance tuning, or writing Angular tests for enterprise apps.

Full instructions: `skills/angular-architect/SKILL.md`

### `atlassian-mcp`

Integrates with Atlassian products to manage project tracking and documentation via MCP protocol. Use when querying Jira issues with JQL filters, creating and updating tickets with custom fields, searching or editing Confluence pages with CQL, managing sprints and backlogs, setting up MCP server authentication, syncing documentation, or debugging Atlassian API integrations.

Full instructions: `skills/atlassian-mcp/SKILL.md`

### `chaos-engineer`

Designs chaos experiments, creates failure injection frameworks, and facilitates game day exercises for distributed systems — producing runbooks, experiment manifests, rollback procedures, and post-mortem templates. Use when designing chaos experiments, implementing failure injection frameworks, or conducting game day exercises. Invoke for chaos experiments, resilience testing, blast radius control, game days, antifragile systems, fault injection, Chaos Monkey, Litmus Chaos.

Full instructions: `skills/chaos-engineer/SKILL.md`

### `cli-developer`

Use when building CLI tools, implementing argument parsing, or adding interactive prompts. Invoke for parsing flags and subcommands, displaying progress bars and spinners, generating bash/zsh/fish completion scripts, CLI design, shell completions, and cross-platform terminal applications using commander, click, typer, or cobra.

Full instructions: `skills/cli-developer/SKILL.md`

### `cloud-architect`

Designs cloud architectures, creates migration plans, generates cost optimization recommendations, and produces disaster recovery strategies across AWS, Azure, and GCP. Use when designing cloud architectures, planning migrations, or optimizing multi-cloud deployments. Invoke for Well-Architected Framework, cost optimization, disaster recovery, landing zones, security architecture, serverless design.

Full instructions: `skills/cloud-architect/SKILL.md`

### `code-reviewer`

Analyzes code diffs and files to identify bugs, security vulnerabilities (SQL injection, XSS, insecure deserialization), code smells, N+1 queries, naming issues, and architectural concerns, then produces a structured review report with prioritized, actionable feedback. Use when reviewing pull requests, conducting code quality audits, identifying refactoring opportunities, or checking for security issues. Invoke for PR reviews, code quality checks, refactoring suggestions, review code, code quality. Complements specialized skills (security-reviewer, test-master) by providing broad-scope review across correctness, performance, maintainability, and test coverage in a single pass.

Full instructions: `skills/code-reviewer/SKILL.md`

### `cpp-pro`

Writes, optimizes, and debugs C++ applications using modern C++20/23 features, template metaprogramming, and high-performance systems techniques. Use when building or refactoring C++ code requiring concepts, ranges, coroutines, SIMD optimization, or careful memory management — or when addressing performance bottlenecks, concurrency issues, and build system configuration with CMake.

Full instructions: `skills/cpp-pro/SKILL.md`

### `csharp-developer`

Use when building C# applications with .NET 8+, ASP.NET Core APIs, or Blazor web apps. Builds REST APIs using minimal or controller-based routing, configures database access with Entity Framework Core, implements async patterns and cancellation, structures applications with CQRS via MediatR, and scaffolds Blazor components with state management. Invoke for C#, .NET, ASP.NET Core, Blazor, Entity Framework, EF Core, Minimal API, MAUI, SignalR.

Full instructions: `skills/csharp-developer/SKILL.md`

### `database-optimizer`

Optimizes database queries and improves performance across PostgreSQL and MySQL systems. Use when investigating slow queries, analyzing execution plans, or optimizing database performance. Invoke for index design, query rewrites, configuration tuning, partitioning strategies, lock contention resolution.

Full instructions: `skills/database-optimizer/SKILL.md`

### `debugging-wizard`

Parses error messages, traces execution flow through stack traces, correlates log entries to identify failure points, and applies systematic hypothesis-driven methodology to isolate and resolve bugs. Use when investigating errors, analyzing stack traces, finding root causes of unexpected behavior, troubleshooting crashes, or performing log analysis, error investigation, or root cause analysis.

Full instructions: `skills/debugging-wizard/SKILL.md`

### `devops-engineer`

Creates Dockerfiles, configures CI/CD pipelines, writes Kubernetes manifests, and generates Terraform/Pulumi infrastructure templates. Handles deployment automation, GitOps configuration, incident response runbooks, and internal developer platform tooling. Use when setting up CI/CD pipelines, containerizing applications, managing infrastructure as code, deploying to Kubernetes clusters, configuring cloud platforms, automating releases, or responding to production incidents. Invoke for pipelines, Docker, Kubernetes, GitOps, Terraform, GitHub Actions, on-call, or platform engineering.

Full instructions: `skills/devops-engineer/SKILL.md`

### `django-expert`

Use when building Django web applications or REST APIs with Django REST Framework. Invoke when working with settings.py, models.py, manage.py, or any Django project file. Creates Django models with proper indexes, optimizes ORM queries using select_related/prefetch_related, builds DRF serializers and viewsets, and configures JWT authentication. Trigger terms: Django, DRF, Django REST Framework, Django ORM, Django model, serializer, viewset, Python web.

Full instructions: `skills/django-expert/SKILL.md`

### `django-storages-s3`

Use when configuring Django to store static and media files on AWS S3 with django-storages. Invoke when working with the STORAGES setting, S3 buckets, presigned URLs, CloudFront, or boto3-backed file storage in settings.py. Configures the Django 4.2+ STORAGES dict, public/private custom backends, presigned GET/POST URLs, IAM policies, and S3 mocking for tests. Trigger terms: django-storages, S3, boto3, S3Boto3Storage, STORAGES, presigned URL, CloudFront, media files, collectstatic, AWS_STORAGE_BUCKET_NAME.

Full instructions: `skills/django-storages-s3/SKILL.md`

### `documentation-architect`

Creates, maintains, reviews, and evolves execution-grade software and product documentation including PRDs, SRSs, technical specifications, architecture documents, implementation plans, workflows, project plans, API specifications, database specifications, ADRs, test plans, security documentation, research documents, agent instructions, READMEs, and complete project documentation systems. Acts as a requirements engineer, product manager, senior engineer, systems architect, and technical writer depending on the document being produced. Operates in explicit modes (CREATE, UPDATE, REVIEW, AUDIT, REFACTOR, SYNCHRONIZE, GENERATE-SYSTEM) and uses adaptive questioning, requirement validation, decision analysis, project-wide consistency checking, traceability, and implementation-readiness validation. Designed so another AI coding agent can implement from the resulting documentation with minimal clarification.

Full instructions: `skills/documentation-architect/SKILL.md`

### `dotnet-core-expert`

Use when building .NET 8 applications with minimal APIs, clean architecture, or cloud-native microservices. Invoke for Entity Framework Core, CQRS with MediatR, JWT authentication, AOT compilation.

Full instructions: `skills/dotnet-core-expert/SKILL.md`

### `embedded-systems`

Use when developing firmware for microcontrollers, implementing RTOS applications, or optimizing power consumption. Invoke for STM32, ESP32, FreeRTOS, bare-metal, power optimization, real-time systems, configure peripherals, write interrupt handlers, implement DMA transfers, debug timing issues.

Full instructions: `skills/embedded-systems/SKILL.md`

### `fastapi-expert`

Use when building high-performance async Python APIs with FastAPI and Pydantic V2. Invoke to create REST endpoints, define Pydantic models, implement authentication flows, set up async SQLAlchemy database operations, add JWT authentication, build WebSocket endpoints, or generate OpenAPI documentation. Trigger terms: FastAPI, Pydantic, async Python, Python API, REST API Python, SQLAlchemy async, JWT authentication, OpenAPI, Swagger Python.

Full instructions: `skills/fastapi-expert/SKILL.md`

### `feature-forge`

Conducts structured requirements workshops to produce feature specifications, user stories, EARS-format functional requirements, acceptance criteria, and implementation checklists. Use when defining new features, gathering requirements, or writing specifications. Invoke for feature definition, requirements gathering, user stories, EARS format specs, PRDs, acceptance criteria, or requirement matrices.

Full instructions: `skills/feature-forge/SKILL.md`

### `fine-tuning-expert`

Use when fine-tuning LLMs, training custom models, or adapting foundation models for specific tasks. Invoke for configuring LoRA/QLoRA adapters, preparing JSONL training datasets, setting hyperparameters for fine-tuning runs, adapter training, transfer learning, finetuning with Hugging Face PEFT, OpenAI fine-tuning, instruction tuning, RLHF, DPO, or quantizing and deploying fine-tuned models. Trigger terms include: LoRA, QLoRA, PEFT, finetuning, fine-tuning, adapter tuning, LLM training, model training, custom model.

Full instructions: `skills/fine-tuning-expert/SKILL.md`

### `flutter-expert`

Use when building cross-platform applications with Flutter 3+ and Dart. Invoke for widget development, Riverpod/Bloc state management, GoRouter navigation, platform-specific implementations, performance optimization.

Full instructions: `skills/flutter-expert/SKILL.md`

### `fullstack-guardian`

Builds security-focused full-stack web applications by implementing integrated frontend and backend components with layered security at every level. Covers the complete stack from database to UI, enforcing auth, input validation, output encoding, and parameterized queries across all layers. Use when implementing features across frontend and backend, building REST APIs with corresponding UI, connecting frontend components to backend endpoints, creating end-to-end data flows from database to UI, or implementing CRUD operations with UI forms. Distinct from frontend-only, backend-only, or API-only skills in that it simultaneously addresses all three perspectives—Frontend, Backend, and Security—within a single implementation workflow. Invoke for full-stack feature work, web app development, authenticated API routes with views, microservices, real-time features, monorepo architecture, or technology selection decisions.

Full instructions: `skills/fullstack-guardian/SKILL.md`

### `game-developer`

Use when building game systems, implementing Unity/Unreal Engine features, or optimizing game performance. Invoke to implement ECS architecture, configure physics systems and colliders, set up multiplayer networking with lag compensation, optimize frame rates to 60+ FPS targets, develop shaders, or apply game design patterns such as object pooling and state machines. Trigger keywords: Unity, Unreal Engine, game development, ECS architecture, game physics, multiplayer networking, game optimization, shader programming, game AI.

Full instructions: `skills/game-developer/SKILL.md`

### `golang-pro`

Implements concurrent Go patterns using goroutines and channels, designs and builds microservices with gRPC or REST, optimizes Go application performance with pprof, and enforces idiomatic Go with generics, interfaces, and robust error handling. Use when building Go applications requiring concurrent programming, microservices architecture, or high-performance systems. Invoke for goroutines, channels, Go generics, gRPC integration, CLI tools, benchmarks, or table-driven testing.

Full instructions: `skills/golang-pro/SKILL.md`

### `graphql-architect`

Use when designing GraphQL schemas, implementing Apollo Federation, or building real-time subscriptions. Invoke for schema design, resolvers with DataLoader, query optimization, federation directives.

Full instructions: `skills/graphql-architect/SKILL.md`

### `java-architect`

Use when building, configuring, or debugging enterprise Java applications with Spring Boot 3.x, microservices, or reactive programming. Invoke to implement WebFlux endpoints, optimize JPA queries and database performance, configure Spring Security with OAuth2/JWT, or resolve authentication issues and async processing challenges in cloud-native Spring applications.

Full instructions: `skills/java-architect/SKILL.md`

### `javascript-pro`

Writes, debugs, and refactors JavaScript code using modern ES2023+ features, async/await patterns, ESM module systems, and Node.js APIs. Use when building vanilla JavaScript applications, implementing Promise-based async flows, optimising browser or Node.js performance, working with Web Workers or Fetch API, or reviewing .js/.mjs/.cjs files for correctness and best practices.

Full instructions: `skills/javascript-pro/SKILL.md`

### `kotlin-specialist`

Provides idiomatic Kotlin implementation patterns including coroutine concurrency, Flow stream handling, multiplatform architecture, Compose UI construction, Ktor server setup, and type-safe DSL design. Use when building Kotlin applications requiring coroutines, multiplatform development, or Android with Compose. Invoke for Flow API, KMP projects, Ktor servers, DSL design, sealed classes, suspend function, Android Kotlin, Kotlin Multiplatform.

Full instructions: `skills/kotlin-specialist/SKILL.md`

### `kubernetes-specialist`

Use when deploying or managing Kubernetes workloads. Invoke to create deployment manifests, configure pod security policies, set up service accounts, define network isolation rules, debug pod crashes, analyze resource limits, inspect container logs, or right-size workloads. Use for Helm charts, RBAC policies, NetworkPolicies, storage configuration, performance optimization, GitOps pipelines, and multi-cluster management.

Full instructions: `skills/kubernetes-specialist/SKILL.md`

### `laravel-specialist`

Build and configure Laravel 10+ applications, including creating Eloquent models and relationships, implementing Sanctum authentication, configuring Horizon queues, designing RESTful APIs with API resources, and building reactive interfaces with Livewire. Use when creating Laravel models, setting up queue workers, implementing Sanctum auth flows, building Livewire components, optimising Eloquent queries, or writing Pest/PHPUnit tests for Laravel features.

Full instructions: `skills/laravel-specialist/SKILL.md`

### `legacy-modernizer`

Designs incremental migration strategies, identifies service boundaries, produces dependency maps and migration roadmaps, and generates API facade designs for aging codebases. Use when modernizing legacy systems, implementing strangler fig pattern or branch by abstraction, decomposing monoliths, upgrading frameworks or languages, or reducing technical debt without disrupting business operations.

Full instructions: `skills/legacy-modernizer/SKILL.md`

### `mcp-developer`

Use when building, debugging, or extending MCP servers or clients that connect AI systems with external tools and data sources. Invoke to implement tool handlers, configure resource providers, set up stdio/HTTP/SSE transport layers, validate schemas with Zod or Pydantic, debug protocol compliance issues, or scaffold complete MCP server/client projects using TypeScript or Python SDKs.

Full instructions: `skills/mcp-developer/SKILL.md`

### `ml-pipeline`

Designs and implements production-grade ML pipeline infrastructure: configures experiment tracking with MLflow or Weights & Biases, creates Kubeflow or Airflow DAGs for training orchestration, builds feature store schemas with Feast, deploys model registries, and automates retraining and validation workflows. Use when building ML pipelines, orchestrating training workflows, automating model lifecycle, implementing feature stores, managing experiment tracking systems, setting up DVC for data versioning, tuning hyperparameters, or configuring MLOps tooling like Kubeflow, Airflow, MLflow, or Prefect.

Full instructions: `skills/ml-pipeline/SKILL.md`

### `monitoring-expert`

Configures monitoring systems, implements structured logging pipelines, creates Prometheus/Grafana dashboards, defines alerting rules, and instruments distributed tracing. Implements Prometheus/Grafana stacks, conducts load testing, performs application profiling, and plans infrastructure capacity. Use when setting up application monitoring, adding observability to services, debugging production issues with logs/metrics/traces, running load tests with k6 or Artillery, profiling CPU/memory bottlenecks, or forecasting capacity needs.

Full instructions: `skills/monitoring-expert/SKILL.md`

### `nestjs-expert`

Creates and configures NestJS modules, controllers, services, DTOs, guards, and interceptors for enterprise-grade TypeScript backend applications. Use when building NestJS REST APIs or GraphQL services, implementing dependency injection, scaffolding modular architecture, adding JWT/Passport authentication, integrating TypeORM or Prisma, or working with .module.ts, .controller.ts, and .service.ts files. Invoke for guards, interceptors, pipes, validation, Swagger documentation, and unit/E2E testing in NestJS projects.

Full instructions: `skills/nestjs-expert/SKILL.md`

### `nextjs-developer`

Use when building Next.js 14+ applications with App Router, server components, or server actions. Invoke to configure route handlers, implement middleware, set up API routes, add streaming SSR, write generateMetadata for SEO, scaffold loading.tsx/error.tsx boundaries, or deploy to Vercel. Triggers on: Next.js, Next.js 14, App Router, RSC, use server, Server Components, Server Actions, React Server Components, generateMetadata, loading.tsx, Next.js deployment, Vercel, Next.js performance.

Full instructions: `skills/nextjs-developer/SKILL.md`

### `pandas-pro`

Performs pandas DataFrame operations for data analysis, manipulation, and transformation. Use when working with pandas DataFrames, data cleaning, aggregation, merging, or time series analysis. Invoke for data manipulation tasks such as joining DataFrames on multiple keys, pivoting tables, resampling time series, handling NaN values with interpolation or forward-fill, groupby aggregations, type conversion, or performance optimization of large datasets.

Full instructions: `skills/pandas-pro/SKILL.md`

### `php-pro`

Use when building PHP applications with modern PHP 8.3+ features, Laravel, or Symfony frameworks. Invokes strict typing, PHPStan level 9, async patterns with Swoole, and PSR standards. Creates controllers, configures middleware, generates migrations, writes PHPUnit/Pest tests, defines typed DTOs and value objects, sets up dependency injection, and scaffolds REST/GraphQL APIs. Use when working with Eloquent, Doctrine, Composer, Psalm, ReactPHP, or any PHP API development.

Full instructions: `skills/php-pro/SKILL.md`

### `playwright-expert`

Use when writing E2E tests with Playwright, setting up test infrastructure, or debugging flaky browser tests. Invoke to write test scripts, create page objects, configure test fixtures, set up reporters, add CI integration, implement API mocking, or perform visual regression testing. Trigger terms: Playwright, E2E test, end-to-end, browser testing, automation, UI testing, visual testing, Page Object Model, test flakiness.

Full instructions: `skills/playwright-expert/SKILL.md`

### `postgres-pro`

Use when optimizing PostgreSQL queries, configuring replication, or implementing advanced database features. Invoke for EXPLAIN analysis, JSONB operations, extension usage, VACUUM tuning, performance monitoring.

Full instructions: `skills/postgres-pro/SKILL.md`

### `prompt-engineer`

Writes, refactors, and evaluates prompts for LLMs — generating optimized prompt templates, structured output schemas, evaluation rubrics, and test suites. Use when designing prompts for new LLM applications, refactoring existing prompts for better accuracy or token efficiency, implementing chain-of-thought or few-shot learning, creating system prompts with personas and guardrails, building JSON/function-calling schemas, or developing prompt evaluation frameworks to measure and improve model performance.

Full instructions: `skills/prompt-engineer/SKILL.md`

### `python-pro`

Use when building Python 3.11+ applications requiring type safety, async programming, or robust error handling. Generates type-annotated Python code, configures mypy in strict mode, writes pytest test suites with fixtures and mocking, and validates code with black and ruff. Invoke for type hints, async/await patterns, dataclasses, dependency injection, logging configuration, and structured error handling.

Full instructions: `skills/python-pro/SKILL.md`

### `rag-architect`

Designs and implements production-grade RAG systems by chunking documents, generating embeddings, configuring vector stores, building hybrid search pipelines, applying reranking, and evaluating retrieval quality. Use when building RAG systems, vector databases, or knowledge-grounded AI applications requiring semantic search, document retrieval, context augmentation, similarity search, or embedding-based indexing.

Full instructions: `skills/rag-architect/SKILL.md`

### `rails-expert`

Rails 7+ specialist that optimizes Active Record queries with includes/eager_load, implements Turbo Frames and Turbo Streams for partial page updates, configures Action Cable for WebSocket connections, sets up Sidekiq workers for background job processing, and writes comprehensive RSpec test suites. Use when building Rails 7+ web applications with Hotwire, real-time features, or background job processing. Invoke for Active Record optimization, Turbo Frames/Streams, Action Cable, Sidekiq, RSpec Rails.

Full instructions: `skills/rails-expert/SKILL.md`

### `react-expert`

Use when building React 18+ applications in .jsx or .tsx files, Next.js App Router projects, or create-react-app setups. Creates components, implements custom hooks, debugs rendering issues, migrates class components to functional, and implements state management. Invoke for Server Components, Suspense boundaries, useActionState forms, performance optimization, or React 19 features.

Full instructions: `skills/react-expert/SKILL.md`

### `react-native-expert`

Builds, optimizes, and debugs cross-platform mobile applications with React Native and Expo. Implements navigation hierarchies (tabs, stacks, drawers), configures native modules, optimizes FlatList rendering with memo and useCallback, and handles platform-specific code for iOS and Android. Use when building a React Native or Expo mobile app, setting up navigation, integrating native modules, improving scroll performance, handling SafeArea or keyboard input, or configuring Expo SDK projects.

Full instructions: `skills/react-native-expert/SKILL.md`

### `rust-engineer`

Writes, reviews, and debugs idiomatic Rust code with memory safety and zero-cost abstractions. Implements ownership patterns, manages lifetimes, designs trait hierarchies, builds async applications with tokio, and structures error handling with Result/Option. Use when building Rust applications, solving ownership or borrowing issues, designing trait-based APIs, implementing async/await concurrency, creating FFI bindings, or optimizing for performance and memory safety. Invoke for Rust, Cargo, ownership, borrowing, lifetimes, async Rust, tokio, zero-cost abstractions, memory safety, systems programming.

Full instructions: `skills/rust-engineer/SKILL.md`

### `salesforce-developer`

Writes and debugs Apex code, builds Lightning Web Components, optimizes SOQL queries, implements triggers, batch jobs, platform events, and integrations on the Salesforce platform. Use when developing Salesforce applications, customizing CRM workflows, managing governor limits, bulk processing, or setting up Salesforce DX and CI/CD pipelines.

Full instructions: `skills/salesforce-developer/SKILL.md`

### `security-reviewer`

Identifies security vulnerabilities, generates structured audit reports with severity ratings, and provides actionable remediation guidance. Use when conducting security audits, reviewing code for vulnerabilities, or analyzing infrastructure security. Invoke for SAST scans, penetration testing, DevSecOps practices, cloud security reviews, dependency audits, secrets scanning, or compliance checks. Produces vulnerability reports, prioritized recommendations, and compliance checklists.

Full instructions: `skills/security-reviewer/SKILL.md`

### `shopify-expert`

Builds and debugs Shopify themes (.liquid files, theme.json, sections), develops custom Shopify apps (shopify.app.toml, OAuth, webhooks), and implements Storefront API integrations for headless storefronts. Use when building or customizing Shopify themes, creating Hydrogen or custom React storefronts, developing Shopify apps, implementing checkout UI extensions or Shopify Functions, optimizing performance, or integrating third-party services. Invoke for Liquid templating, Storefront API, app development, checkout customization, Shopify Plus features, App Bridge, Polaris, or Shopify CLI workflows.

Full instructions: `skills/shopify-expert/SKILL.md`

### `spark-engineer`

Use when writing Spark jobs, debugging performance issues, or configuring cluster settings for Apache Spark applications, distributed data processing pipelines, or big data workloads. Invoke to write DataFrame transformations, optimize Spark SQL queries, implement RDD pipelines, tune shuffle operations, configure executor memory, process .parquet files, handle data partitioning, or build structured streaming analytics.

Full instructions: `skills/spark-engineer/SKILL.md`

### `spec-miner`

Reverse-engineering specialist that extracts specifications from existing codebases. Use when working with legacy or undocumented systems, inherited projects, or old codebases with no documentation. Invoke to map code dependencies, generate API documentation from source, identify undocumented business logic, figure out what code does, or create architecture documentation from implementation. Trigger phrases: reverse engineer, old codebase, no docs, no documentation, figure out how this works, inherited project, legacy analysis, code archaeology, undocumented features.

Full instructions: `skills/spec-miner/SKILL.md`

### `spring-boot-engineer`

Generates Spring Boot 3.x configurations, creates REST controllers, implements Spring Security 6 authentication flows, sets up Spring Data JPA repositories, and configures reactive WebFlux endpoints. Use when building Spring Boot 3.x applications, microservices, or reactive Java applications; invoke for Spring Data JPA, Spring Security 6, WebFlux, Spring Cloud integration, Java REST API design, or Microservices Java architecture.

Full instructions: `skills/spring-boot-engineer/SKILL.md`

### `sql-pro`

Optimizes SQL queries, designs database schemas, and troubleshoots performance issues. Use when a user asks why their query is slow, needs help writing complex joins or aggregations, mentions database performance issues, or wants to design or migrate a schema. Invoke for complex queries, window functions, CTEs, indexing strategies, query plan analysis, covering index creation, recursive queries, EXPLAIN/ANALYZE interpretation, before/after query benchmarking, or migrating queries between database dialects (PostgreSQL, MySQL, SQL Server, Oracle).

Full instructions: `skills/sql-pro/SKILL.md`

### `sre-engineer`

Defines service level objectives, creates error budget policies, designs incident response procedures, develops capacity models, and produces monitoring configurations and automation scripts for production systems. Use when defining SLIs/SLOs, managing error budgets, building reliable systems at scale, incident management, chaos engineering, toil reduction, or capacity planning.

Full instructions: `skills/sre-engineer/SKILL.md`

### `swift-expert`

Builds iOS/macOS/watchOS/tvOS applications, implements SwiftUI views and state management, designs protocol-oriented architectures, handles async/await concurrency, implements actors for thread safety, and debugs Swift-specific issues. Use when building iOS/macOS applications with Swift 5.9+, SwiftUI, or async/await concurrency. Invoke for protocol-oriented programming, SwiftUI state management, actors, server-side Swift, UIKit integration, Combine, or Vapor.

Full instructions: `skills/swift-expert/SKILL.md`

### `terraform-engineer`

Use when implementing infrastructure as code with Terraform across AWS, Azure, or GCP. Invoke for module development (create reusable modules, manage module versioning), state management (migrate backends, import existing resources, resolve state conflicts), provider configuration, multi-environment workflows, and infrastructure testing.

Full instructions: `skills/terraform-engineer/SKILL.md`

### `the-fool`

Use when challenging ideas, plans, decisions, or proposals using structured critical reasoning. Invoke to play devil's advocate, run a pre-mortem, red team, or audit evidence and assumptions.

Full instructions: `skills/the-fool/SKILL.md`

### `typescript-pro`

Implements advanced TypeScript type systems, creates custom type guards, utility types, and branded types, and configures tRPC for end-to-end type safety. Use when building TypeScript applications requiring advanced generics, conditional or mapped types, discriminated unions, monorepo setup, or full-stack type safety with tRPC.

Full instructions: `skills/typescript-pro/SKILL.md`

### `vue-expert`

Builds Vue 3 components with Composition API patterns, configures Nuxt 3 SSR/SSG projects, sets up Pinia stores, scaffolds Quasar/Capacitor mobile apps, implements PWA features, and optimises Vite builds. Use when creating Vue 3 applications with Composition API, writing reusable composables, managing state with Pinia, building hybrid mobile apps with Quasar or Capacitor, configuring service workers, or tuning Vite configuration and TypeScript integration.

Full instructions: `skills/vue-expert/SKILL.md`

### `vue-expert-js`

Creates Vue 3 components, builds vanilla JS composables, configures Vite projects, and sets up routing and state management using JavaScript only — no TypeScript. Generates JSDoc-typed code with @typedef, @param, and @returns annotations for full type coverage without a TS compiler. Use when building Vue 3 applications with JavaScript only (no TypeScript), when projects require JSDoc-based type hints, when migrating from Vue 2 Options API to Composition API in JS, or when teams prefer vanilla JavaScript, .mjs modules, or need quick prototypes without TypeScript setup.

Full instructions: `skills/vue-expert-js/SKILL.md`

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

### `warisskill-react-performance`

Use when writing or reviewing React (or React Native) UI where render behavior matters — a component re-renders too often, a list is long, typing/scroll feels janky, or someone reaches for useMemo/useCallback/ React.memo. Triggers on "this component re-renders too much," "should I memoize this," long-list rendering, context-driven re-render storms, or slow typing in a controlled input. This is narrower than `warisskill-performance-optimization` — that skill owns the general measure-first loop, Core Web Vitals, bundles, and backend/query work. This one owns React's render model specifically. "Should this component exist at all" is ponytail's territory, not this skill's.

Full instructions: `skills/warisskill-react-performance/SKILL.md`

### `warisskill-security-practices`

Use whenever writing code that touches authentication, secrets, user input, database queries, or external requests — this is a coding- time baseline, not an audit-time-only concern. Trigger on any new endpoint, form, auth flow, database query, or environment-variable usage. Complements the installed /security-review skill, which audits after the fact — this skill governs what gets written correctly the first time, same non-negotiable-baseline treatment as warisskill-ui-ux-accessibility.

Full instructions: `skills/warisskill-security-practices/SKILL.md`

### `warisskill-testing-strategy`

Use when deciding what level of automated testing a feature needs beyond unit-level TDD — whether it warrants an E2E test, and what the integration-test bar is for a new API endpoint. Trigger when finishing a critical user flow (auth, checkout, core happy path) or any new endpoint. Complements warisskill-workflows-tdd (unit-level coverage floor) — this skill is the layer above that: E2E and integration test scope.

Full instructions: `skills/warisskill-testing-strategy/SKILL.md`

### `websocket-engineer`

Use when building real-time communication systems with WebSockets or Socket.IO. Invoke for bidirectional messaging, horizontal scaling with Redis, presence tracking, room management.

Full instructions: `skills/websocket-engineer/SKILL.md`

### `wordpress-pro`

Develops custom WordPress themes and plugins, creates and registers Gutenberg blocks and block patterns, configures WooCommerce stores, implements WordPress REST API endpoints, applies security hardening (nonces, sanitization, escaping, capability checks), and optimizes performance through caching and query tuning. Use when building WordPress themes, writing plugins, customizing Gutenberg blocks, extending WooCommerce, working with ACF, using the WordPress REST API, applying hooks and filters, or improving WordPress performance and security.

Full instructions: `skills/wordpress-pro/SKILL.md`

## Research

### `warisskill-research-academic`

Use for scholarly and literature research — literature reviews, finding and evaluating peer-reviewed work, systematic-style searches, or grounding a claim in the academic record. Triggers on "literature review," "what does the research say," "find papers on," "systematic review," "is this peer-reviewed," or citing scholarly sources. Builds on `warisskill-research-methodology` (credibility, triangulation, claim strength) — this skill adds the scholarly source hierarchy, systematic search discipline, and citation provenance. It does NOT reproduce the heavyweight multi-agent PRISMA machinery some libraries ship; it is a practitioner-grade lightweight discipline.

Full instructions: `skills/warisskill-research-academic/SKILL.md`

### `warisskill-research-methodology`

Use for any research task where the answer depends on external sources — gathering facts, comparing claims, investigating a question, or synthesizing findings across sources, in any domain. This is the foundation the domain-specific research skills build on: `warisskill-research-academic` (literature/scholarly), `marketing-research` (positioning/copy), and `warisskill-research-technical` (libraries/RFCs/ pre-implementation) all defer up to the credibility, triangulation, and claim-strength rules here. Trigger on "research X," "find out whether," "what does the evidence say," or any request that will end in claims sourced from outside the current codebase or conversation.

Full instructions: `skills/warisskill-research-methodology/SKILL.md`

### `warisskill-research-startup-feasibility`

Use when validating whether a new initiative is worth pursuing — a startup idea, a new product line, or an internal build — before committing real time to it. Triggers on "is this idea worth pursuing," "feasibility check," "should we build this," "market size for," or any go/no-go call on something not yet started. Builds on `warisskill-research-methodology` for source discipline. Distinct from `marketing-research`: this skill answers whether to proceed at all; marketing-research answers how to position and sell it once the answer is yes. Distinct from `warisskill-system-design-decision-making`, which records a significant technical choice as an ADR — this skill feeds that one the evidence for a go/no-go call worth recording.

Full instructions: `skills/warisskill-research-startup-feasibility/SKILL.md`

### `warisskill-research-technical`

Use for engineering research before or during a build — evaluating libraries and approaches, reading docs/RFCs/source to understand how something works, or running a spike to answer a specific technical question. Triggers on "how do I do X with Y," "which library should I use," "is this approach viable," "spike," or reading unfamiliar APIs. Builds on `warisskill-research-methodology` and complements `warisskill-dependency-management` (whether to add a dependency at all) and `warisskill-system-design-decision-making` (recording a significant choice). This skill is about getting a *reliable* technical answer fast, not about the decision or the dependency ladder themselves.

Full instructions: `skills/warisskill-research-technical/SKILL.md`

## Marketing

### `marketing-research`

Use this skill for any marketing research, product positioning, copywriting research, or audience profiling task. Triggers include: "research my product", "develop my value proposition", "profile my avatar", "understand my market", "create a unique mechanism", "market awareness", "market sophistication", "ideal customer profile", "ICP research", "positioning research", "copywriting research", "features and benefits", "competitor research", "competitive analysis", or any request to deeply research a product or audience for marketing purposes. Use this skill proactively whenever a user wants to prepare materials for sales copy, landing pages, ads, email sequences, or any persuasion-focused content. If a user says "help me understand my market", "I need to figure out my messaging", "who is my customer", or "what makes my product different", this skill applies immediately.

Full instructions: `skills/marketing-research/SKILL.md`
