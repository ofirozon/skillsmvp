# MVP-Execution-Engine — System Rules

This repository is governed by a custom capability named **MVP-Execution-Engine**
(v2). It converts a detailed product brief into a big-company-grade specification
suite — research, vision, product, design, engineering, quality, launch — then
implements full-stack production code strictly from those specs. All agent
sessions in this repo MUST follow these rules.

## Capability: MVP-Execution-Engine

**Trigger:** the user invokes `/mvp-execution-engine <Product Name> — <product brief>`,
runs `./skills/mvp-execution-engine/init-mvp.sh "<Product Name>"`, or asks in plain language to "build an MVP for X".

**Blueprint source of truth:** `skills/mvp-execution-engine/templates/` — never
improvise the docs structure; instantiate it from these templates, replacing
`{{PRODUCT_NAME}}` and `{{DATE}}` tokens.

**Intake principle:** the user supplies all product details they have (audience,
features, business model, references, constraints). The engine maps every detail
into the spec suite. Gaps are closed in ONE clarifying round before Phase 0; any
remaining assumption is recorded explicitly — never silently invented.

## Mandatory 3-Phase Flow

### Phase 0 — Research & Vision (docs/ only)
- `docs/00-research.md` — market landscape, 3–5 competitor teardowns, positioning,
  differentiation. Use web research when available; cite sources. Mark unverified
  claims as assumptions.
- `docs/01-vision.md` — Amazon-style PR-FAQ (press release written from the
  customer's point of view, then FAQ) plus 3–5 Apple-style product principles
  that later resolve design and scope disputes.

### Phase 1 — Specification Suite (docs/ only)
- **No application code may be written in Phase 0 or Phase 1.**
- Required files (instantiated from `skills/mvp-execution-engine/templates/`):
  1. `docs/README.md` — backlog matrix with status glyphs ☐ / ◐ / ☑ and the phase gates.
  2. `docs/02-product-spec.md` — personas, jobs-to-be-done, user stories, feature
     catalog (MoSCoW, IDs `F-###`) with **testable** acceptance criteria per feature.
  3. `docs/03-design-system.md` — brand direction, design tokens (color, type,
     spacing, radius, motion), component inventory, UX principles, WCAG 2.2 AA.
  4. `docs/04-engineering-architecture.md` — PostgreSQL/Supabase schema with RLS
     per table, API specs (path, method, auth, request/response), integrations.
  5. `docs/05-quality-security.md` — test strategy, security checklist (OWASP-aligned),
     performance budgets, accessibility verification.
  6. `docs/06-launch.md` — analytics event taxonomy, SEO, env/deploy runbook, launch checklist.
  7. `docs/07-foundation.md` — stack defaults, engineering conventions, append-only ADR log.
- Traceability is mandatory: every feature → at least one persona/story; every DB
  table, API route, screen, and analytics event → a feature ID.
- Specs are written for an AI implementer: unambiguous, behavior-focused,
  with explicit scope boundaries ("Out of scope" sections) and verification criteria.

### Phase gate
- Phase 2 MUST NOT begin until all docs exist, contain no unresolved `TBD` in
  Must-have sections, and the user approves (says "approve specs" / "start
  phase 2", or invoked the skill with `--build`).

### Phase 2 — Autonomous Code Generation
- Implement **strictly** from the specs. If the specs are silent on something
  material, append an ADR to `docs/07-foundation.md` before deviating — never
  silently invent scope.
- Work the backlog in `docs/README.md` top-to-bottom by priority: ☐ → ◐ when
  starting, ◐ → ☑ only after implemented AND verified (lint + build + tests pass,
  acceptance criteria met).
- Stack fixed unless an ADR says otherwise: Next.js (App Router, TypeScript),
  Supabase (Postgres + Auth + RLS), Tailwind CSS (tokens from the design system),
  Stripe. DB changes in `supabase/migrations/`; every table ships with RLS enabled.
- Secrets only via env vars; keep `.env.example` complete (no real values).
- Commit per feature with the feature ID: `feat(F-001): ...`.

## Standing constraints
- `docs/` is the single source of truth; code review = diff vs. spec.
- `docs/07-foundation.md` holds stack defaults and the ADR log — append-only,
  never rewrite or delete past entries.
- Update the `docs/README.md` matrix in the same commit as the code it describes.
- UI work must consume the design tokens from `docs/03-design-system.md`; no ad-hoc values.
