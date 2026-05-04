# Improve Link Ref Card — Ref Count Section Redesign

Redesign the Ref Count entry area within each Link Ref card to:
1. Make the **Nhập backdate**, **CSV**, and **Tất cả** action buttons bigger and aligned with the shadcn design system (use `<Button>` with proper `variant`/`size` instead of custom `<button>` elements)
2. Add a **week/month entry mode** so users can enter a single ref count for a whole week or month, instead of only day-by-day

## Proposed Changes

### [SandboxDetailView.tsx](file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/src/containers/project-sandbox/SandboxDetailView.tsx)

#### 1. Upgrade action buttons to shadcn `<Button>`

**Current** (lines 1530–1553): Three tiny `<button>` elements with `text-[10px]` / `px-2 py-0.5` — very small and visually inconsistent with the rest of the app.

**Proposed**: Replace with shadcn `<Button size="sm" variant="outline">` (and `variant="default"` for the primary action). This uses `h-8 rounded-md px-2 text-sm` from the design system — significantly bigger, consistent with the rest of the UI.

```diff
- <button className="inline-flex items-center gap-1 rounded-md border border-primary/30 bg-primary/5 px-2 py-0.5 text-[10px] font-medium text-primary hover:bg-primary/10 ...">
-   <CalendarDays className="size-3" /> Nhập backdate
- </button>
+ <Button size="sm" className="gap-1.5" onClick={...}>
+   <CalendarDays className="size-3.5" /> Nhập backdate
+ </Button>
```

Similar upgrade for CSV and Tất cả buttons (using `variant="outline"`).

---

#### 2. Add Week/Month entry mode toggle

**Design**: Add a segmented control (using shadcn `<Tabs>` or inline toggle buttons) above the ref count grid that lets users switch between:

| Mode | Grid Columns | What Each Cell Represents |
|------|-------------|--------------------------|
| **Ngày** (default) | 7 cols, last 7 days | Each cell = 1 day's ref count (current behavior) |
| **Tuần** | 4 cols, last 4 weeks | Each cell = 1 week. Entering a number auto-distributes to 7 days |
| **Tháng** | 3 cols, last 3 months | Each cell = 1 month. Entering a number auto-distributes to ~30 days |

**Implementation detail**:
- The mode toggle sits in the header bar next to "Ref Count (7 ngày gần nhất)"
- For week mode: show W18, W17, W16, W15 (ISO week labels) with date ranges (e.g. 28/04–04/05)
- For month mode: show Th.05, Th.04, Th.03 with full month range
- When user enters a value in week/month mode, it distributes evenly across the constituent days using `ADD_REF_COUNTS` dispatch (same store action)
- Existing daily values within a week/month are summed and shown as the cell's display value
- A small indicator shows how many days within the period already have data

**UI mockup for the toggle**:
```
Ref Count                                    [Ngày] [Tuần] [Tháng]   [Nhập backdate] [CSV] [Tất cả (59)]
```

The toggle buttons use `<Button size="xs" variant={active ? "default" : "outline"}>` pattern for a clean segmented appearance.

---

#### 3. New helper component: `RefCountWeekMonthInput`

A new component similar to `RefCountInput` but designed for aggregate periods:

```tsx
function RefCountPeriodInput({ linkRefId, periodLabel, dateRange, periodDates, refMap }: {
  linkRefId: string;
  periodLabel: string;        // "W18" or "Th.05"
  dateRange: string;          // "28/04 – 04/05"
  periodDates: string[];      // all YYYY-MM-DD dates in this period
  refMap: Map<string, number>;
}) {
  // Sum existing values for display
  // On save, distribute evenly across days that don't already have data
}
```

---

## User Review Required

> [!IMPORTANT]
> **Week/Month distribution strategy**: When user enters "70" for a week, should we:
> - **(A)** Distribute evenly (70/7 = 10/day) across ALL 7 days, **overwriting** existing daily values?
> - **(B)** Only fill empty days — e.g., if 3 days already have data totaling 30, distribute remaining 40 across 4 empty days (10/day)?
> - **(C)** Set the total to 70 — if existing days sum to 30, fill empty days with (70-30)/4 = 10/day, keeping existing values?
> 
> I'm proposing **Option C** (treat it as the desired total) as it feels most intuitive — "I want 70 for this week."

> [!NOTE]
> The mode toggle only affects the **inline** 7-day grid in the Link Ref card. The Backdate modal and Detail table remain day-by-day (they already handle day-level editing well).

## Verification Plan

### Manual Verification
- Start the dev server and navigate to the sandbox
- Select a project with Link Refs (e.g., proj-binance)
- Go to "Kết nối báo cáo" tab
- Verify:
  1. Buttons are visibly larger and match shadcn styling
  2. Mode toggle switches between Ngày/Tuần/Tháng
  3. Week/Month cells show correct aggregated values
  4. Entering a value distributes correctly across days
  5. Existing daily data is preserved correctly
