# {{PRODUCT_NAME}} — Quality & Security Plan

> Definition of Done for every feature: lint + build + tests pass, acceptance
> criteria from `02-product-spec.md` met, and the relevant checklist rows below hold.

## Test Strategy
| Layer | Tooling | What must be covered |
|---|---|---|
| Unit | TBD (e.g., Vitest) | Pure logic, validation schemas, price math |
| Integration | TBD | API route handlers incl. auth failures & webhooks |
| E2E (critical paths) | TBD (e.g., Playwright) | Sign-up → core action → payment |
| DB / RLS | SQL tests | Each policy: allowed role passes, others denied |

**Critical paths (must have E2E before launch):**
1. TBD — tie to F-### IDs.

## Security Checklist (OWASP-aligned — verified before launch)
- [ ] RLS enabled on every table; deny-by-default; policies tested per role
- [ ] All API input zod-validated; output never leaks other users' data
- [ ] Service-role key and Stripe secret used server-side only
- [ ] Stripe webhook signature verified; webhook handler idempotent
- [ ] Auth: session checked in middleware AND in each mutation handler
- [ ] No secrets in client bundles, logs, or error messages
- [ ] Rate limiting on auth and write endpoints: TBD strategy
- [ ] Dependency audit clean (`npm audit` high/critical = 0)

## Performance Budgets (Core Web Vitals on mid-tier mobile)
| Metric | Budget |
|---|---|
| LCP | ≤ 2.5s |
| INP | ≤ 200ms |
| CLS | ≤ 0.1 |
| JS shipped per route | TBD KB |

## Accessibility Verification
- [ ] Keyboard-only walkthrough of every critical path
- [ ] Contrast checked against tokens in `03-design-system.md`
- [ ] Screen-reader labels on all interactive elements & form errors

## Error Handling & Observability
- User-facing errors follow the UX writing rules (what happened + what to do).
- TBD: logging/monitoring choice, alert thresholds.
