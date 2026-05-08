# Ads Management Sandbox

Create a fully self-contained sandbox replica of the "Quản lý Ads" module with mock data. The sandbox mirrors the production ads module (2 tabs: Email Management + Campaign Management) and stats cards, but runs entirely on local mock data with no API calls. This enables interactive prototyping for UI/UX changes before touching production code.

## Proposed Changes

### Mock Data Layer

#### [NEW] [mock-ads-data.ts](file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/src/data/mock-ads-data.ts)

Comprehensive mock data file covering all entities used by the ads module:

- **`MOCK_ADS_EMAILS`**: 6 emails with full `DigitalMailFullItem` shape (mail, accounts, delegation status, budgets). Covers delegated + non-delegated states.
- **`MOCK_ADS_ACCOUNTS`**: 12 ad accounts with full `AdsAccountItem` shape (ads_id, ads_name, status_ads, budget_paid/used/remaining, mail, digital_staff_name, created_at, campaigns array, etc). Covers all statuses: enabled, closed, suspended, canceled, pending.
- **`MOCK_CAMPAIGNS`**: 15 campaigns with full `CampaignListItem` shape (id, name_campaign, account_name, account_ads, status_campaign, campaign_type, cost, click, view, cpc, cpa, cpm, ctr, daily_budget, currency_code, timezone, start_date). Covers types: SEARCH, DISPLAY, PERFORMANCE_MAX, VIDEO. Covers statuses: ENABLED, PAUSED, REMOVED.
- **`MOCK_STATISTICS`**: Pre-computed aggregate stats matching `AdsStatisticsAdsAccountByStatusResponse`.

---

### Sandbox Container Components

#### [NEW] [AdsSandboxPageContent.tsx](file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/src/containers/ads-sandbox/AdsSandboxPageContent.tsx)

Top-level page component — mirrors `AdsPageContent.tsx` structure:
- Title with 🧪 Sandbox badge
- `LineTabs` with Email + Campaign tabs
- Renders sandbox tab components instead of production ones

#### [NEW] [SandboxEmailManagementTab.tsx](file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/src/containers/ads-sandbox/SandboxEmailManagementTab.tsx)

Sandbox replica of `EmailManagementTab.tsx`:
- Uses `MOCK_ADS_EMAILS` instead of API hooks
- Retains full column config, toolbar with search/filter, column picker
- Renders `EmailManagementExpandableTable` with mock rows
- All modals/actions wired to local state (add email, delete, send delegation)

#### [NEW] [SandboxCampaignManagementTab.tsx](file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/src/containers/ads-sandbox/SandboxCampaignManagementTab.tsx)

Sandbox replica of `CampaignManagementTab.tsx`:
- Uses `MOCK_CAMPAIGNS` instead of `useGetListCampaign`
- Full column set (select, STT, ID, name, account, account_status, campaign_status, campaign_type, time, timezone, budget, cost, click, view, CPC, CPA, CPM, CTR, start_date, actions)
- Client-side search, filter, sort, pagination
- Date range picker (filtering mock data client-side)

#### [NEW] [SandboxAdsAccountsTab.tsx](file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/src/containers/ads-sandbox/SandboxAdsAccountsTab.tsx)

Sandbox replica of `AdsAccountsTab.tsx`:
- Stats cards (Tổng đã nạp, Tổng chỉ tiêu, Số dư, Tổng tài khoản) from mock statistics
- Uses `MOCK_ADS_ACCOUNTS` for table data
- Client-side search + filter (platform, status)

---

### Route / Page

#### [NEW] [page.tsx](file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/src/app/[locale]/(admin)/ads/sandbox/page.tsx)

Next.js page at `/ads/sandbox`:
- Renders `AdsSandboxPageContent`
- No server-side data fetching needed

---

### Existing Files (Untouched)

All production `src/containers/ads/*` files remain untouched. The sandbox uses the same shared UI components (`DataTable`, `TableToolbar`, `BadgeStatus`, `LineTabs`, `FilterPopover`, `Combobox`, `EmailManagementExpandableTable`) but feeds them mock data directly.

The existing `AdsSandboxTable.tsx` (an earlier stub that's just a copy of `AdsAccountsTable.tsx`) will be replaced since the new sandbox is comprehensive.

## Verification Plan

### Automated Tests
- Run `npm run build` to verify TypeScript compilation
- Navigate to `/ads/sandbox` in browser to verify rendering

### Manual Verification
- Compare sandbox visually with production `/ads` page
- Verify all tabs render with data
- Verify search, filter, pagination work client-side
- Verify stats cards show correct aggregated values
