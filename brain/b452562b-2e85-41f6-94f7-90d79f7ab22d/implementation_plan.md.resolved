# Project Sandbox UI/UX Revamp — SHE Approach + Transaction-based Data Flow

Revamp the sandbox project management UI to reflect the new transaction-based approach for ad campaign connections, with CSV/Excel backdate import mapped to link refs, clearer visual hierarchy across tabs, and a history tab split into "before connection" vs "after connection" periods.

## User Review Required

> [!IMPORTANT]
> **Data model change**: The CSV upload currently maps `date, count` to a single Link Ref. The new requirement adds columns: `link ref`, `ref count`, `startTimestamp`, `endTimestamp`, `ID` (campaign ads ID), `adCampName`. This is a significant structure change — see proposed schema below.

> [!IMPORTANT]
> **History split**: The "before connection" / "after connection" distinction uses `CampaignConnection.connectedAt` as the dividing moment. Events before that timestamp are "retrospective" (backdate data). Events after are "live-tracked". Is this the correct interpretation?

## Open Questions

1. **CSV column mapping**: Should the CSV upload create new link refs if the `link ref` column contains URLs that don't exist yet in the project? Or should it only work with existing link refs?

2. **Campaign ID in CSV**: The `ID` column contains the campaign ads ID — should this create a connection record in the ledger, or is it purely informational metadata for the ref count entry?

3. **Transaction visual**: When you say "data flow like transaction approach", do you mean each campaign connection should show as a discrete transaction record (like a bank transaction ledger) rather than the current real-time sync animation?

---

## Proposed Changes

### Component 1: Data Model Updates

#### [MODIFY] [project-campaign-types.ts](file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/src/types/project-campaign-types.ts)

- **Add `BackdateEntry` type** — richer ref count entry with campaign mapping:
  ```ts
  export interface BackdateEntry {
    linkRef: string;        // Link Ref URL or ID
    refCount: number;       // Number of referrals
    startTimestamp: string;  // Period start (ISO or YYYY-MM-DD)
    endTimestamp: string;    // Period end
    campaignId: string;      // Campaign ads ID
    adCampName: string;      // Campaign name
  }
  ```
- **Extend `RefCountEntry`** with optional `campaignId` and `source` field (`'manual' | 'csv' | 'live'`) so we can distinguish how the data was entered
- **Add `CsvImportRecord`** type for tracking uploaded file history

---

### Component 2: Visual Hierarchy Revamp (SHE approach)

#### [MODIFY] [SandboxDetailView.tsx](file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/src/containers/project-sandbox/SandboxDetailView.tsx)

**S — Simplicity**: Reduce cognitive load
- Simplify the tab navigation from 4 verbose labels to **icon+short label** format with subtle badge counts
- Remove nested mode toggles (day/week/month) from inline ref count and move to a collapsible toolbar
- Consolidate KPI cards into a cleaner 2-row layout: top row = Ads data, bottom row = Ref data

**H — Hide**: Progressive disclosure
- Hide advanced features behind expandable sections (CSV template download, backdate range selector)
- Campaign performance table auto-collapses when >3 campaigns; shows "Xem thêm" link
- Connection lines only appear on hover or when a specific campaign/link ref is selected

**E — Embody**: Make the interface self-explanatory
- Add transaction-style timeline in the Connection tab showing each campaign connection as a ledger entry
- Show data source indicators (🔴 live, 🔵 backdate, ⚪ no data) directly on chart data points
- Each campaign card in the connection view shows its connection timestamp and duration

**Tab-specific changes:**

1. **Tab "Hiệu quả Ads"** — Clearer section dividers with gradient accent lines, data source badge on each KPI card
2. **Tab "Kết nối báo cáo"** — Add transaction ledger view showing connection history chronologically, with each entry showing: campaign name → link ref URL, connected timestamp, status badge
3. **Tab "Phân tích Dự án"** — No major changes, minor polish
4. **Tab "Lịch sử dự án"** (revamped) — **Split into two timeline sections** with a clear visual divider

---

### Component 3: CSV/Excel Backdate Upload Revamp

#### [MODIFY] [SandboxDetailView.tsx](file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/src/containers/project-sandbox/SandboxDetailView.tsx) — `ManageLinkRefModal` / CSV tab

- **Redesign CSV tab** to show the new column format:
  ```
  link ref | ref count | startTimestamp | endTimestamp | ID | adCampName
  ```
- Add a **template download button** that generates a pre-filled CSV with existing link refs and campaign IDs
- Add a **preview table** after file upload showing parsed rows before import
- Show validation results: matched link refs, matched campaigns, new entries vs updates
- Parse and distribute ref counts across the date range (startTimestamp→endTimestamp)

---

### Component 4: History Tab — Before/After Connection Split

#### [MODIFY] [SandboxDetailView.tsx](file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/src/containers/project-sandbox/SandboxDetailView.tsx) — `ProjectHistoryTab`

**Redesign the history tab with two distinct sections:**

1. **"Trước khi kết nối" (Before Connection)**
   - Visual: muted/faded timeline with dashed line
   - Shows: backdate CSV imports, estimated ref counts, historical data pulled from Google Ads History API
   - Each entry tagged with 🔵 "Backdate" badge
   - Data here is "retrospective" — manually entered or estimated

2. **"Sau khi kết nối" (After Connection)**
   - Visual: vibrant timeline with solid line and pulse animation on latest entry
   - Shows: live sync events, real-time campaign connections/disconnections, two-way sync triggers
   - Each entry tagged with 🟢 "Live" badge
   - Data here is "immutable" — captured from hourly syncs

3. **Connection Moment Divider**
   - A prominent horizontal divider with the connection timestamp
   - Shows "⚡ Thời điểm kết nối: {date}" with a subtle glow effect
   - Acts as the visual anchor between the two periods

---

### Component 5: Project List Visual Hierarchy

#### [MODIFY] [ProjectListPanel.tsx](file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/src/containers/project-sandbox/ProjectListPanel.tsx)

- Improve tab styling with stronger active indicators (gradient underline instead of solid)
- Add subtle row hover states with left accent border color matching project status
- Make "Connect" button more prominent with a gradient background
- Add micro-animation on tab switch (slide transition for tab indicator)

---

## Verification Plan

### Automated Tests
- Run `npm run dev` and verify the sandbox page loads without errors
- Navigate to each project detail and verify all 4 tabs render correctly
- Test CSV upload with sample data matching the new column format
- Verify history tab correctly splits events into before/after sections

### Manual Verification
- Visual inspection of the tab hierarchy, data source badges, and connection timeline
- Test the CSV template download produces correct column headers
- Verify the connection moment divider appears at the correct timestamp
