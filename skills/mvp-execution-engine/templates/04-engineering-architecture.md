# {{PRODUCT_NAME}} — Engineering Architecture

> Every table, route, and integration traces to a feature ID from `02-product-spec.md`.
> RLS is mandatory on every table; the policy block is part of the table's definition.

## System Overview
TBD — one paragraph + optional mermaid diagram: client, Next.js server, Supabase,
Stripe, any third parties.

## Database Schema (PostgreSQL / Supabase)
<!-- One section per table. Migrations live in supabase/migrations/ as SQL. -->

### Table: `profiles` (F-###)
| Column | Type | Constraints |
|---|---|---|
| id | uuid | PK, references auth.users(id) on delete cascade |
| created_at | timestamptz | not null default now() |
| ... | | TBD |

**Indexes:** TBD
**RLS policies:**
- `select`: own row (`auth.uid() = id`)
- `update`: own row
- `insert` / `delete`: TBD (trigger or service role only)

## Entity Relationships
TBD — FK list or mermaid `erDiagram`.

## API Routes (Next.js App Router)
<!-- Server components + RLS for reads; route handlers for mutations/webhooks. -->

| Route | Method | Auth | Feature | Request (zod-validated) | Response |
|---|---|---|---|---|---|
| `/api/example` | POST | session | F-001 | `{ ... }` | `200 { ... }` / `4xx { error }` |
| `/api/webhooks/stripe` | POST | Stripe signature | F-### | Stripe event | `200` |

## Auth Flow
- Supabase Auth (TBD: email magic link / OAuth providers); session via `@supabase/ssr` middleware.
- Protected routes: TBD. Role model: TBD.

## Payments Flow (Stripe)
- Products/prices: TBD. Checkout trigger: TBD.
- Webhook events handled: `checkout.session.completed`, TBD — with DB side-effects per event.

## Third-Party Integrations
| Service | Purpose | Feature | Env vars |
|---|---|---|---|
| TBD | TBD | F-### | TBD |

## Non-Functional Requirements
- Secrets server-side only; `.env.example` kept current.
- TBD: rate limiting, file storage (Supabase Storage), background jobs, email.
