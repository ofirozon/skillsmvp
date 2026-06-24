# {{PRODUCT_NAME}} — Launch & Analytics

## Analytics Event Taxonomy
<!-- Implemented in Phase 2 alongside each feature. snake_case names. -->
| Event | Trigger | Properties | Feature |
|---|---|---|---|
| `signup_completed` | account created | `method` | F-### |
| TBD | TBD | TBD | F-### |

**Tooling:** TBD (default: Vercel Analytics + a product-events table in Supabase).
**Funnel to watch:** TBD — maps to the North-Star metric in `01-vision.md`.

## SEO & Sharing
- [ ] Per-route `metadata` (title ≤ 60 chars, description ≤ 155)
- [ ] OpenGraph/Twitter card image
- [ ] `sitemap.xml` + `robots.txt`
- [ ] Marketing copy on landing page mirrors the press release in `01-vision.md`

## Environments & Deploy Runbook
| Env | Host | Supabase project | Stripe mode |
|---|---|---|---|
| Preview | Vercel preview | TBD | test |
| Production | Vercel | TBD | live |

**Deploy steps:** TBD — migrations first (`supabase db push`), then app deploy,
then webhook endpoint check.

## Launch Checklist
- [ ] All Must-have features ☑ in `docs/README.md`
- [ ] Quality & security checklist in `05-quality-security.md` fully checked
- [ ] `.env.example` complete; production env vars set
- [ ] Stripe live keys + webhook configured; test purchase refunded
- [ ] Analytics events verified end-to-end
- [ ] Custom domain + SSL; legal pages (privacy, terms): TBD
