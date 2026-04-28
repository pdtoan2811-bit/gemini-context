# Project Management Sandbox — Walkthrough

## Summary of Changes

This update implements 4 major enhancements to the sandbox project detail view:

### 1. ConnectCampaignModal — Simplified & Hierarchical
**File**: `ConnectCampaignModal.tsx`

- **Removed**: All filter chips (search field selectors, campaign type filters, "Bộ lọc" button)
- **Kept**: Single search bar that searches across all fields (name, email, account ID, URL)
- **New**: Results grouped hierarchically: **Email → Ad Account → Campaign**
  - Each level is collapsible with chevron toggles
  - Multi-level selection: select all under an email, select all under an account
  - Checkbox cascading with indeterminate states
- Dedup preview and conflict warnings remain

### 2. Kết nối báo cáo — Two-Column Layout
**File**: `SandboxDetailView.tsx` → `ConnectionTab`

- **Left column**: Campaigns with "Connect" button at top
  - Each campaign card shows: status dot, name, badge, type, account, URL
  - Visual `→ Link Ref` pointer showing which link ref it connects to
  - Hover highlight syncs between campaign and its linked ref
  - Actions: Migrate, Disconnect
  - Compact metrics: Chi phí, Clicks, CTR

- **Right column**: Link Refs with "Thêm Link Ref" button at top
  - URL header with copy/edit actions
  - Stats: clicks, conversions, ref count total
  - Connected campaigns listed inline
  - **Inline Ref Count Entry** (7-day grid, see below)

- **Search bar**: Filters both campaigns and link refs simultaneously

### 3. Inline Ref Count Entry
**File**: `SandboxDetailView.tsx` → `RefCountCell`

- Each Link Ref card shows a **7-day grid** at the bottom
- Each cell shows the date (DD/MM) and current count value
- **Click a cell** → inline input appears → type number → press Enter or click ✓ to save
- Saved values dispatch `ADD_REF_COUNTS` action to the store
- Green checkmark feedback on save
- Existing values shown as clickable numbers, empty days shown as "—"

### 4. Tab Reordering & Data Enhancements
- **Tab order**: Chỉ số traffic → Kết nối báo cáo → Thông tin dự án
- Tab label changed from "Campaign & Link Ref" to "Kết nối báo cáo"
- Traffic tab enhanced with:
  - "Tổng Ref Count" and "Ref hôm nay" KPI cards
  - Ref Count trend chart (per-day using TrafficTrendChart)
  - Per-LinkRef breakdown table

### 5. Type & Data Updates
- `RefCountEntry` type: `{ date: string; count: number }`
- `LinkRef.refCounts: RefCountEntry[]` — daily counts
- `AdsCampaign.ownerEmail: string` — owner email
- `ADD_LINKREF` action — manual link ref creation with uniqueness validation
- `ADD_REF_COUNTS` action — merge/upsert entries by date
- Mock data: 8 days of ref counts per link ref, owner emails per campaign

## Verification
- ✅ TypeScript compiles clean (`tsc --noEmit`)
- ✅ Dev server running and compiling
- ✅ All existing functionality preserved (scenarios, sync animation, modals)
