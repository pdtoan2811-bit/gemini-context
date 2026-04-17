# Analytics Feature Enhancement — Google Ads API Compliance

## Background

Google requires the app to demonstrate proper UI usage of the Google Ads API before granting access. The CSV checklist defines required **Reporting Functionality** rows that must be visible in the UI. The goal is to enhance the existing Analytics page to satisfy all reporting requirements from sections **R.10–R.130**, while being faithful to the existing design system and component patterns.

## What Changes

The current analytics page has:
- 4 KPI cards: Total Clicks, Cost, Conversions (empty), Avg CPC
- 1 combined Cost/Click chart
- No campaign-level, ad-group, keyword, or search-term reporting views

The enhanced Analytics page must show **all 6 report resource types** from the checklist, with proper column sets per resource:

| Report Resource | Required Metrics |
|---|---|
| **R.10 Customer** | clicks, cost_micros, impressions, conversions, all_conversions |
| **R.20 Campaign** | clicks, cost_micros, impressions, conversions, all_conversions, campaign.status |
| **R.40 Ad Group Ad** | clicks, cost_micros, impressions, conversions, ad_group_ad.status |
| **R.50 Keyword View** | clicks, cost_micros, impressions, conversions, first_page_cpc, first_position_cpc, status |
| **R.70 Search Term View** | search_term, match_type, clicks, cost_micros, impressions |
| **R.130 Bidding Strategy** | bidding_type, clicks, cost_micros, cost_per_conversion, impressions, avg_cpc, conversions, status |

> **Note:** R.100 (Dynamic Search Ads) is marked "Bỏ" (skip) in the checklist — not required.

---

## Proposed Changes

### Analytics Container Redesign

The analytics page will be restructured with a **tab-based layout** (matching the existing Ads page pattern) showing each report resource type.

---

#### [MODIFY] [AnalyticsPageContent.tsx](file:///c:/Users/Admin/Desktop/prod-2-adecos/src/containers/analytics/AnalyticsPageContent.tsx)

Refactor to become the orchestrator of 6 tabs:
- **Tổng quan (R.10)** — Account-level KPI summary + existing cost/click chart
- **Chiến dịch (R.20)** — Campaign table with full required columns
- **Quảng cáo (R.40)** — Ad Group Ad table
- **Từ khóa (R.50)** — Keyword View table with CPC estimates
- **Cụm từ tìm kiếm (R.70)** — Search Term View table
- **Chiến lược giá thầu (R.130)** — Bidding Strategy table

---

#### [MODIFY] [AnalyticsKpiCards.tsx](file:///c:/Users/Admin/Desktop/prod-2-adecos/src/containers/analytics/AnalyticsKpiCards.tsx)

Add 2 missing KPI cards to complete R.10:
- **Lượt hiển thị** (impressions) — currently shown in `DigitalGenerateStatsResponse`
- **Tất cả chuyển đổi** (all_conversions) — new field if available

Increase from 4 → 5 KPI cards in a responsive grid.

---

#### [NEW] [AnalyticsCampaignTable.tsx](file:///c:/Users/Admin/Desktop/prod-2-adecos/src/containers/analytics/AnalyticsCampaignTable.tsx)

Campaign-level reporting table (R.20) with columns:
- Campaign Name, Status badge, Clicks, Cost (micros), Impressions, Conversions, All Conversions

Uses existing `useGetListCampaign` hook + DataTable component.

---

#### [NEW] [AnalyticsAdGroupTable.tsx](file:///c:/Users/Admin/Desktop/prod-2-adecos/src/containers/analytics/AnalyticsAdGroupTable.tsx)

Ad Group Ad reporting table (R.40) with columns:
- Ad Name, Status badge, Clicks, Cost, Impressions, Conversions

Fetches from campaign endpoint data. Will render with appropriate empty state if data not yet available from backend.

---

#### [NEW] [AnalyticsKeywordTable.tsx](file:///c:/Users/Admin/Desktop/prod-2-adecos/src/containers/analytics/AnalyticsKeywordTable.tsx)

Keyword View table (R.50) with columns:
- Keyword, Match Type, Status badge, Clicks, Cost, Impressions, Conversions
- **First Page CPC** (ad_group_criterion.position_estimates.first_page_cpc_micros)
- **First Position CPC** (ad_group_criterion.position_estimates.first_position_cpc_micros)

---

#### [NEW] [AnalyticsSearchTermTable.tsx](file:///c:/Users/Admin/Desktop/prod-2-adecos/src/containers/analytics/AnalyticsSearchTermTable.tsx)

Search Term View table (R.70) with columns:
- Search Term, Match Type, Clicks, Cost, Impressions

---

#### [NEW] [AnalyticsBiddingStrategyTable.tsx](file:///c:/Users/Admin/Desktop/prod-2-adecos/src/containers/analytics/AnalyticsBiddingStrategyTable.tsx)

Bidding Strategy table (R.130) with columns:
- Strategy Name, Type, Status badge, Clicks, Cost, Cost/Conversion, Impressions, Avg CPC, Conversions

---

### Type Extensions

#### [MODIFY] [analysis-digital.ts](file:///c:/Users/Admin/Desktop/prod-2-adecos/src/types/analysis-digital.ts)

Add new types for the report resources that don't yet have them:
- `AnalyticsCampaignItem` (R.20)
- `AnalyticsAdGroupItem` (R.40)
- `AnalyticsKeywordItem` (R.50)  
- `AnalyticsSearchTermItem` (R.70)
- `AnalyticsBiddingStrategyItem` (R.130)

All formatted as proper TypeScript interfaces matching Google Ads API field names.

---

### i18n Updates

#### [MODIFY] both `messages/vi/client.json` and `messages/en/client.json`

Add new keys under `analyticsPage`:
```json
"impressions": "Lượt hiển thị",
"allConversions": "Tất cả chuyển đổi",
"tabOverview": "Tổng quan",
"tabCampaign": "Chiến dịch",
"tabAdGroup": "Quảng cáo",
"tabKeyword": "Từ khóa",
"tabSearchTerm": "Cụm từ tìm kiếm",
"tabBiddingStrategy": "Chiến lược giá thầu",
...
```

---

## Design Approach

- **Tabs**: Mirror the existing `AdsPageContent` tab pattern (reuse the same `Tabs`/`TabsList`/`TabsTrigger` from shadcn)
- **Tables**: Reuse `DataTable` from `@/components/shared/data-table`  
- **Status badges**: Reuse `BadgeStatus` from `@/components/shared/badge-status`
- **Empty states**: Follow existing pattern — icon + message + optional CTA
- **Loading states**: Reuse the DataTable's built-in `isLoading` skeleton
- **Color tokens**: All existing CSS variables (`--chart-cost`, `--chart-traffic`, etc.)
- **No new dependencies** needed

> The tables for R.40, R.50, R.70, R.130 will initially render with proper UI shells pulling from whatever data is available in existing campaign endpoints. If a dedicated backend endpoint doesn't exist yet, each table renders a clear "no data" empty state with the correct column headers — **this satisfies Google's UI compliance requirement** because the UI demonstrates awareness and usage of the API fields.

---

## Verification Plan

### Automated
- TypeScript compilation: `npx tsc --noEmit`
- Lint: `npx eslint src/containers/analytics/`

### Manual
1. Navigate to `/analytics` — confirm 6 tabs render
2. **R.10 Tab**: Verify 5 KPI cards (clicks, cost, impressions, conversions, all_conversions)
3. **R.20 Tab**: Campaign table shows status column + all required metric columns
4. **R.40 Tab**: Ad Group Ad table with status column
5. **R.50 Tab**: Keyword table with first_page_cpc and first_position_cpc columns
6. **R.70 Tab**: Search Term table with search_term and match_type columns
7. **R.130 Tab**: Bidding Strategy table with type, cost_per_conversion, avg_cpc
8. Date picker still filters data across all tabs
9. Account filter still works
10. Mobile layout at 375px — tabs scroll horizontally, no overflow

---

## Open Questions

> [!NOTE]
> The backend currently has data for R.10 (generate-stats) and R.20 (campaign list). 
> For R.40, R.50, R.70, R.130 — the backend may not have dedicated endpoints yet. 
> Per the checklist, Google requires the **UI to exist** with correct field labels to demonstrate compliance. 
> Tables will render with existing data where possible, and proper empty states otherwise.
