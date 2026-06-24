---
name: mvp-execution-engine
description: Convert a detailed product brief into a big-company-grade spec suite (research, PR-FAQ vision, product spec, design system, architecture, quality, launch) and then autonomously implement the full-stack production code (Next.js + Supabase + Tailwind + Stripe). Use when the user wants to build an MVP or full product, scaffold professional product specs, or says "/mvp-execution-engine <Product Name> — <brief>".
---

# MVP-Execution-Engine (v2)

Arguments: `<Product Name> — <product brief>` with optional flags:
- `--build` — pre-approve the phase gate (run all phases end-to-end).
- `--specs-only` — stop after Phase 1 regardless of other input.
- `--no-research` — skip web research; mark market claims as assumptions.

## Intake (before Phase 0)

The user supplies everything they know about the product. Map their input
against this brief; ask ONE consolidated round of clarifying questions for
material gaps, then proceed (record remaining assumptions, don't stall):

1. **Idea & outcome** — what it is, what success looks like in 6 months.
2. **Audience** — who pays, who uses, market/geography.
3. **Feature wishlist** — everything desired, in the user's words.
4. **Business model** — pricing, free tier, payment moments.
5. **References** — competitors or products to emulate ("like Apple's polish").
6. **Brand feel** — tone, look, any colors/fonts already chosen.
7. **Constraints** — deadline, budget ceilings, compliance, must-use services.

## Procedure

### Phase 0 — Research & Vision (docs/ only)

1. Run `./init-mvp.sh "<Product Name>"` from the repo root (instantiates all
   docs from `skills/mvp-execution-engine/templates/`, substituting
   `{{PRODUCT_NAME}}` and `{{DATE}}`). If the script is unavailable, copy the
   templates manually with the same substitutions.
2. `docs/00-research.md`: research the market with WebSearch (unless
   `--no-research`): 3–5 competitor teardowns (pricing, strengths, gaps),
   market signals, positioning statement, differentiation. Cite sources;
   anything unverified is listed as an assumption.
3. `docs/01-vision.md`: write the PR-FAQ — a one-page press release dated at
   launch, written from the customer's point of view (no tech jargon), then
   internal/external FAQs covering the hard questions (why now, why us,
   biggest risk). Add 3–5 product principles used to settle later disputes.

### Phase 1 — Specification Suite (docs/ only)

Fill in, in order, keeping full traceability (feature → persona/story;
table/route/screen/event → feature ID):

4. `docs/02-product-spec.md`: personas with jobs-to-be-done, user stories,
   feature catalog (`F-###`, MoSCoW). Must-have set = smallest product that
   delivers the press release's promise. Every feature gets **testable**
   acceptance criteria and explicit out-of-scope notes.
5. `docs/03-design-system.md`: brand direction from the intake references,
   design tokens (color palette with semantic names, type scale, spacing,
   radii, motion), component inventory mapped to screens, UX writing rules,
   WCAG 2.2 AA requirements.
6. `docs/04-engineering-architecture.md`: Postgres schema (tables, columns,
   FKs, indexes), RLS policy per table, API routes (path, method, auth,
   request/response shape), third-party integrations, auth & payment flows.
7. `docs/05-quality-security.md`: test strategy per layer, OWASP-aligned
   security checklist, performance budgets (LCP/INP/CLS), a11y verification.
8. `docs/06-launch.md`: analytics event taxonomy (event name, trigger,
   properties, feature ID), SEO basics, deploy runbook, launch checklist.
9. `docs/07-foundation.md`: confirm stack defaults; log every deviation or
   assumption as an ADR.
10. `docs/README.md`: backlog matrix — one row per feature, status ☐ —
    plus phase-gate checkboxes. Present a concise spec summary to the user.

### Phase gate
Stop and ask for approval — unless `--build` was passed or the user already
said to go ahead. Phase 2 starts only on approval.

### Phase 2 — Autonomous Code Generation

1. Scaffold if absent: Next.js (App Router, TypeScript), Tailwind configured
   from the design tokens in `docs/03-design-system.md`, Supabase client,
   Stripe SDK, test runner. Create `.env.example` with all required vars.
2. Work `docs/README.md` top-to-bottom by priority. Per feature:
   - Flip ☐ → ◐.
   - Implement strictly per spec: migration (with RLS) → API → UI (design
     tokens only, no ad-hoc values) → analytics events from `06-launch.md`.
   - Verify: lint + build + tests pass AND acceptance criteria met. Then ◐ → ☑.
   - Commit `feat(F-###): <summary>` including the matrix update.
3. Specs silent on something material → append an ADR to
   `docs/07-foundation.md` before deviating.
4. After the Must-have set: run the quality checklist from
   `docs/05-quality-security.md`, then report features shipped, verification
   results, and remaining backlog.
