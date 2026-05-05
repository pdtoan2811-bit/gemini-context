# Robust CRUD for Competitor Spy Tracking

## Goal

Replace the current search → card-grid → detail view flow with a proper **list ↔ detail** CRUD pattern matching the Project Sandbox module. Apply the SHE framework:
- **Simplicity**: DataTable for scanning, inline status, minimal modals
- **Hide**: Hover-reveal actions, collapsible sections, progressive disclosure
- **Embody**: Status dots, BadgeStatus, contextual actions — no labels needed

## Design Reference

The existing `ProjectListPanel` → `SandboxDetailView` pattern is the gold standard:

| Pattern | ProjectListPanel | Competitor Spy (proposed) |
|---|---|---|
| Top-level | List header + "Thêm" button | List header + "Thêm mục tiêu" button |
| Filtering | Tab bar (All / Running / Saved) | Tab bar (All / Domain / Media Buyer) |
| List view | `DataTable` with columns | `DataTable` with columns |
| Row actions | Eye (view), Spy button | Eye (view), Pause/Play, Delete |
| Detail view | `SandboxDetailView` (tabs + KPIs) | `SpyTargetDetailView` (info + ads gallery + alerts) |
| Navigation | `viewState: list ↔ detail` | Same pattern |
| Create | Modal with input | Modal with domain/buyer search + config |

## Proposed Changes

---

### 1. Store Enhancement

#### [MODIFY] [useCompetitorSpyStore.tsx](file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/src/hooks/useCompetitorSpyStore.tsx)

Add new actions:
- `UPDATE_SPY_TARGET` — edit alert frequency/types for existing target
- `ADD_NOTE_TO_TARGET` — add a note/tag to a target (for context)

Add new computed helpers:
- `getTargetWithDetails(targetId)` → returns target + resolved domain/buyer + ads count + last alert

---

### 2. Main Page — Rewrite with DataTable

#### [MODIFY] [CompetitorSpyPage.tsx](file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/src/containers/competitor-spy/CompetitorSpyPage.tsx)

**Current**: SimpleTabs switching between SearchTabContent, SpyTargetsList (full), SpyAlertsFeed.

**Proposed**: Same pattern as `ProjectListPanel`:

```
ViewState: "list" | { view: "detail", targetId }
```

**List view** (default):
- Header: "Theo dõi Đối thủ" + subtitle + "Thêm mục tiêu" Button
- Tab bar: Tất cả (N) | Domain (N) | Media Buyer (N)  
- **DataTable** columns:
  1. `select` — Checkbox
  2. `label` — Icon (Globe/User) + label + subtitle (advertiser name or email)
  3. `type` — BadgeStatus ("Domain" / "Buyer")
  4. `status` — Status dot (active=green, paused=gray)
  5. `adsCount` — Number of ads detected
  6. `alertFreq` — Frequency label
  7. `lastChange` — Relative time ("2 giờ trước")
  8. `unreadAlerts` — Red badge count (hidden if 0)
  9. `actions` — Eye (view detail), Pause/Play toggle, Delete (hover-reveal)
- Empty state: Info banner matching sandbox pattern
- Bulk actions bar (when checkboxes selected): Pause All, Delete All

**Detail view** (when a target is clicked):
- Back button ("← Quay lại danh sách")
- Header: Target name + BadgeStatus(active/paused) + Edit/Delete buttons
- Subtitle: type + frequency + created date
- KPI cards row: Tổng ads | Active ads | Media Buyers (for domain) or Domains (for buyer) | Cảnh báo chưa đọc
- SimpleTabs: Quảng cáo | Cảnh báo | Cấu hình
  - **Quảng cáo tab**: Filter bar (SimpleTabs for format/platform) + AdCreativeCard grid
  - **Cảnh báo tab**: SpyAlertsFeed filtered to this target
  - **Cấu hình tab**: Inline-editable frequency, alert types, notes, delete confirm

---

### 3. Add Target Modal — Unified Search-then-Configure

#### [MODIFY] [AddSpyTargetModal.tsx](file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/src/containers/competitor-spy/AddSpyTargetModal.tsx)

Two-step modal (like ConnectCampaignModal):
1. **Step 1 — Search**: Search input + results list (domains or media buyers). User clicks to select.
2. **Step 2 — Configure**: Selected target info card + frequency picker + alert type checkboxes + "Thêm" button.

If opened from a project "Spy" button, skip Step 1 (pre-selected).

---

### 4. Delete Files No Longer Needed

#### [DELETE] [DomainSpyView.tsx](file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/src/containers/competitor-spy/DomainSpyView.tsx)
#### [DELETE] [MediaBuyerSpyView.tsx](file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/src/containers/competitor-spy/MediaBuyerSpyView.tsx)
#### [DELETE] [SpyTargetsList.tsx](file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/src/containers/competitor-spy/SpyTargetsList.tsx)

These are replaced by the unified `SpyTargetDetailView` inside CompetitorSpyPage and the DataTable list view.

---

### 5. Retained Components (cleaned up)

#### [MODIFY] [AdCreativeCard.tsx](file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/src/containers/competitor-spy/AdCreativeCard.tsx)
- No structural changes, used as-is in the detail view's ads tab.

#### [MODIFY] [SpyAlertsFeed.tsx](file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/src/containers/competitor-spy/SpyAlertsFeed.tsx)
- Add `targetId` prop for filtered mode (only show alerts for one target).
- Keep existing "show all" mode for standalone use.

---

### 6. Type Updates

#### [MODIFY] [competitor-spy-types.ts](file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/src/types/competitor-spy-types.ts)

Add to `SpyTarget`:
```ts
notes?: string;       // User notes about this target
tags?: string[];       // Custom tags
```

Add action:
```ts
| { type: "UPDATE_SPY_TARGET"; targetId: string; updates: Partial<Pick<SpyTarget, "alertFrequency" | "alertTypes" | "notes" | "tags" | "status">> }
```

---

## SHE Framework Application

### Simplicity
- **One DataTable** replaces 3 separate views (search results, targets list, detail selection)
- Target management is the primary view — search is a modal action (like "Connect Campaign")
- Standard list ↔ detail pattern users already know from Project Management

### Hide  
- Row actions (pause, delete) appear **only on hover**
- Bulk actions bar appears **only when checkboxes are selected**
- Configuration is a **tab inside detail** — not a separate modal
- Alert badge count **hides when 0**

### Embody
- Status dot = active/paused (same colors as campaign status)
- BadgeStatus for target type (Domain/Buyer)
- Unread alert count uses destructive badge (same pattern as notifications)
- "Quét ngay" scan button uses the same outline+icon pattern as "Tải lại" in sandbox

---

## Verification Plan

### Automated Tests
- `npm run dev` — confirm no compilation errors
- Navigate to `/en/competitor-spy` — confirm 200 response

### Manual Verification
- DataTable renders with all 3 mock targets
- Tab filtering works (All/Domain/Buyer)
- Click target row → detail view with back button
- Add target modal: search → select → configure → add → appears in table
- Pause/play toggle updates status dot
- Delete removes row
- Detail view shows ads, alerts, config tabs
