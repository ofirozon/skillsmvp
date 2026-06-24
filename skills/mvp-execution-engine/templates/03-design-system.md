# {{PRODUCT_NAME}} — Design System

> Single source of truth for all UI decisions. Phase 2 consumes these tokens via
> Tailwind config — no ad-hoc colors, sizes, or shadows in components.

## Brand Direction
- **Personality (3 adjectives):** TBD
- **References / inspiration:** TBD (from intake — e.g., "Apple-level restraint")
- **Voice & UX writing:** TBD — sentence case, verb-first buttons, no jargon; error
  messages say what happened and what to do next.

## Design Tokens

### Color (semantic names — map to Tailwind theme)
| Token | Value | Usage |
|---|---|---|
| `brand` | TBD | Primary actions, links |
| `brand-foreground` | TBD | Text/icons on brand |
| `surface` / `surface-muted` | TBD | Page & card backgrounds |
| `foreground` / `foreground-muted` | TBD | Primary & secondary text |
| `border` | TBD | Dividers, inputs |
| `success` / `warning` / `danger` | TBD | Status feedback |

### Typography
| Role | Font / size / weight / line-height |
|---|---|
| Display | TBD |
| Heading | TBD |
| Body | TBD |
| Caption | TBD |

### Spacing, Radius, Elevation, Motion
- **Spacing scale:** 4-px base — 1,2,3,4,6,8,12,16,24 units (TBD adjust)
- **Radii:** TBD (e.g., `md` 8px cards, `full` pills)
- **Shadows:** TBD — max 2 elevations
- **Motion:** TBD — durations 150/250ms, ease-out; respect `prefers-reduced-motion`

## Component Inventory
<!-- Every screen is composed ONLY of these. Add a row before inventing a component. -->
| Component | Variants | Used in (screens) | Feature |
|---|---|---|---|
| Button | primary / secondary / ghost / destructive | TBD | all |
| TBD | | | F-### |

## Screen Map
| Screen | Route | Purpose | Features |
|---|---|---|---|
| TBD | `/` | TBD | F-001 |

## Accessibility (WCAG 2.2 AA — verified in Phase 2)
- Contrast ≥ 4.5:1 text, 3:1 UI; visible focus states; full keyboard paths;
  labels on every input; touch targets ≥ 24px.
