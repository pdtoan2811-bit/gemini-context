# Walkthrough — Professional Tone-Down Across All Tabs

## Summary

Applied a systematic professional tone-down across the entire sandbox detail view. Color is now used **only where it carries meaning** (status dots, chart lines, destructive actions). Everything else uses the neutral `foreground/muted` palette.

---

## Files Changed

| File | Changes |
|------|---------|
| [SandboxDetailView.tsx](file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/src/containers/project-sandbox/SandboxDetailView.tsx) | All 4 tabs toned down |
| [ProjectListPanel.tsx](file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/src/containers/project-sandbox/ProjectListPanel.tsx) | Tab indicator, Connect button |
| [CampaignCard.tsx](file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/src/containers/project-sandbox/CampaignCard.tsx) | Sync button color |
| [LinkRefCard.tsx](file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/src/containers/project-sandbox/LinkRefCard.tsx) | Icon + campaign count pill |
| [project-campaign-types.ts](file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/src/types/project-campaign-types.ts) | New types for CSV |

---

## Tab-by-Tab Changes

### Tab 1: Hiệu quả Ads
- Removed colored section icons (`BarChart3 text-emerald-500`, `Link2 text-indigo-500`)
- KPI cards: removed `border-primary/20 bg-primary/5` highlight tint — all cards now uniform
- Tooltips: cost/ref value → `text-foreground` (was `text-amber-500`), CTR → `text-foreground` (was `text-emerald-500`)
- "Hôm nay" badge → neutral `bg-muted/50 text-foreground` (was `bg-primary/10 text-primary`)
- Quick-fill button → clean outline (was `border-primary/20 bg-primary/5 text-primary`)

### Tab 2: Kết nối báo cáo
- Section headers: removed `Activity text-sky-400` and `Link2 text-primary` icons
- Link Ref icon backgrounds: `bg-muted/40` (was `bg-primary/10`)
- Link2 icons throughout: `text-muted-foreground` (was `text-primary`)
- Campaign count pill on LinkRefCard: `bg-muted/50 text-muted-foreground` (was `bg-primary/10 text-primary`)
- CSV sample link ref: `text-foreground/70` (was `text-primary/80`)

### Tab 3: Phân tích Dự án
- SimilarWeb section header: removed `BarChart3 text-sky-400` icon
- Policy item dots: `size-1.5 bg-foreground/30` (was `size-2 bg-primary`)

### Tab 4: Lịch sử dự án
- Event timeline badges: all neutral `text-foreground bg-muted/40` except errors (kept `text-destructive`)
- Section headers: plain text with count in parens, no colored icons or emoji badges
- Connection divider: simple line with muted text (removed glow effect, gradient, colored Zap)
- Timeline lines: neutral `bg-border/40` (was `bg-emerald-500/30` and `border-blue-400/30`)

---

## Color Preserved Where Meaningful

| Element | Color | Reason |
|---------|-------|--------|
| Campaign status dots (enabled/paused/removed) | emerald/amber/neutral | Status conveys actionable information |
| Chart line colors (cost, ref, impressions, clicks) | emerald/indigo/violet/sky | Chart legend needs distinct colors |
| Chart tooltip legend dots | Matches chart lines | Visual consistency |
| Destructive actions (disconnect, error badges) | `text-destructive` | Warns user of data-affecting action |
| Date picker active preset | `text-primary` | Interactive feedback |

## Verification

- ✅ TypeScript compiles with zero errors across all 5 files
