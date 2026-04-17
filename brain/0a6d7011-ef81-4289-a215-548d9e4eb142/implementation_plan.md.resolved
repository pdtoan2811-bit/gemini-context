# Bento Grid: Elegant Revamp Plan

## Problem Analysis

After auditing the current state, I identified two core issues:

### 1. Border Animation Feels Mechanical
The current SVG `strokeDasharray` approach creates a "dashed line running around a rectangle." It's technically correct but lacks the organic, premium feel of modern UI libraries like Magic UI or Vercel's components. The beam has no organic glow, no tapering, and moves at a lifeless constant speed.

### 2. Internal Animations Waste Space & Lack "Wow"

| Box | Current Issue |
|-----|--------------|
| **AI Agent** (2×2, largest) | Massive empty white space above/below tiny centered content. Each animation step uses ~30% of available area. |
| **Deep Research** (1×1) | Content is small and static. Skeleton bars feel like loading states, not feature previews. |
| **Analytics** (1×1) | Cycles through small stat cards. Chart is cramped. Numbers don't animate. |
| **Project Management** (3×1, full-width) | **4 gray skeleton rectangles.** No animation, no content, no value. Complete waste. |

---

## Proposed Changes

### Part 1: Elegant Border Beam

#### [MODIFY] [border-beam.tsx](file:///c:/Users/Admin/Desktop/prod-2-adecos/src/components/ui/border-beam.tsx)

Replace the SVG stroke approach with a **CSS `offset-path` traveling orb** — the same technique used by Magic UI. This creates a small glowing "star" that travels organically along the border path.

**How it works:**
- A small `div` (the "orb") is positioned using `offset-path: rect(0 auto auto 0 round 24px)` which defines the border perimeter as its motion path
- `offset-distance` animates from `0%` to `100%` via Framer Motion
- The orb has a radial gradient with blur, creating a natural "traveling light" effect
- A second orb (delayed, dimmer) follows behind for depth
- No SVG, no masks, no dasharray — just pure CSS motion path

**Why this is better:**
- GPU-accelerated `offset-distance` is a single-property animation
- The orb naturally follows rounded corners with sub-pixel precision
- The glow looks organic because it's a radial gradient, not a hard stroke
- Zero risk of "searchlight" or light-bleed since the orb is tiny and contained

---

### Part 2: Internal Animations Revamp

#### [MODIFY] [LandingFeatures.tsx](file:///c:/Users/Admin/Desktop/prod-2-adecos/src/containers/landing/LandingFeatures.tsx)

##### Box 1: AI Agent (2×2) — "Live Chat Interface"
**Goal:** Fill the entire space with a convincing chat UI mockup.

- Show a persistent mini chat window with:
  - A top bar ("Adecos AI" with green status dot)
  - Messages flowing in sequentially from both user and AI
  - AI typing indicator with realistic dots
  - The bar chart animating into view as an embedded "AI response card"
  - The action suggestion sliding up at the bottom
- All content fills the box edge-to-edge with proper spacing

##### Box 2: Deep Research (1×1) — "Scanning Pipeline"
**Goal:** Feel like a live research engine.

- Show a search bar at top that "types" the query
- Below: animated scanning lines with a pulsing progress indicator
- Results cards slide in from the right when "found"
- A final "High Potential" stamp fades in
- Each element flows into the next, filling the vertical space

##### Box 3: Analytics (1×1) — "Live Dashboard"
**Goal:** A compact but rich analytics dashboard.

- Show all KPIs simultaneously (keep the 2×2 grid)
- Below KPIs: a mini sparkline/area chart with animated draw-in
- Numbers use **counting animation** (e.g., $0 → $12,840) for "wow"
- A subtle "+12.5%" trend badge pulses green
- Everything visible at once — no cycling/hiding

##### Box 4: Project Management (3×1) — "Kanban Board"
**Goal:** Transform gray skeletons into a living Kanban board mockup.

- 3 columns: "Đang quét" | "Đã lưu" | "Đang chạy Ads"
- Each column has 1–2 mini project cards with:
  - Project name, commission badge, status dot
  - Cards that subtly animate (slight float, opacity pulse)
- One card every few seconds "moves" from column 1 → column 2 (via AnimatePresence)
- Full-width layout utilizes the 3-column span perfectly

---

## User Review Required

> [!IMPORTANT]
> This is a significant visual overhaul of both the border effect and all 4 bento box internals. The border implementation switches from SVG to CSS offset-path. The internal animations are rewritten from scratch for each box.

> [!WARNING]
> `offset-path: rect()` requires modern browsers (Chrome 116+, Safari 17.2+, Firefox 116+). This covers 95%+ of users but excludes very old browsers.

## Open Questions

1. **Box 4 Kanban columns** — should I use Vietnamese column names ("Đang quét" / "Đã lưu" / "Đang chạy Ads") or keep them as i18n keys? Currently the translations don't include project management animation keys.
2. **Analytics box** — do you prefer the "all stats visible at once" approach or keeping the cycling between stages?

## Verification Plan

### Browser Testing
- Verify the traveling orb follows rounded corners precisely
- Confirm zero light-bleed in both light and dark mode
- Test all 4 internal animations for smoothness (60fps)
- Verify space utilization is dramatically improved
