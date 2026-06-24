# {{PRODUCT_NAME}} — Technical Foundation & ADR Log

## Stack Defaults (fixed unless overridden by an ADR below)

| Layer | Choice | Notes |
|---|---|---|
| Framework | Next.js (App Router, TypeScript) | `app/` directory, server components by default |
| Database | Supabase (PostgreSQL) | Migrations as SQL in `supabase/migrations/` |
| Auth | Supabase Auth | Email + OAuth; session via `@supabase/ssr` |
| Authorization | Postgres RLS | RLS enabled on EVERY table; policies in the same migration |
| Styling | Tailwind CSS | Theme generated from tokens in `03-design-system.md` |
| Payments | Stripe | Checkout + webhooks at `/api/webhooks/stripe` |
| Testing | TBD per `05-quality-security.md` | |
| Hosting target | Vercel + Supabase cloud | |

## Environment Variables
Tracked in `.env.example` (no real values committed):
- `NEXT_PUBLIC_SUPABASE_URL`
- `NEXT_PUBLIC_SUPABASE_ANON_KEY`
- `SUPABASE_SERVICE_ROLE_KEY` (server only)
- `STRIPE_SECRET_KEY`, `STRIPE_WEBHOOK_SECRET`
- `NEXT_PUBLIC_APP_URL`

## Engineering Conventions
- Validation at API boundaries (zod); never trust client input.
- Server-side Stripe/Supabase service-role calls only — never expose secrets to the client.
- UI consumes design tokens only; no ad-hoc colors/sizes.
- Each feature commit: `feat(F-###): <summary>`, includes backlog matrix update.
- Definition of Done: spec acceptance criteria met, lint + build + tests pass, matrix ☑.

## Architecture Decision Records (append-only — never edit or delete past entries)
<!-- Add a row whenever the specs are silent or a default is overridden. -->

| # | Date | Decision | Context / Consequence |
|---|---|---|---|
| ADR-000 | {{DATE}} | Adopt the stack defaults above | Initialized by MVP-Execution-Engine |
