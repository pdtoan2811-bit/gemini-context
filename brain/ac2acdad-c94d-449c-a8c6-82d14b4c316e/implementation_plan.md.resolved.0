# Sandbox Ads Management

Create a sandbox version of the Ads Management module that uses mock data matching all production API fields, enabling full UI testing without backend connectivity.

## Scope

The production `/ads` module has **two main tabs**:
1. **Email Management** — CRUD for delegation emails (with nested account drill-down)
2. **Campaign Management** — Campaign listing with filtering, sorting, date range

The sandbox will mirror these exactly, plus the **Accounts/ID tab** (currently redirecting to Email), using mock data that matches every field from the production types.

## Proposed Changes

### Mock Data Layer

#### [NEW] [mock-ads-sandbox-data.ts](file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/src/data/mock-ads-sandbox-data.ts)

Comprehensive mock data file containing:

- **`MOCK_ADS_ACCOUNTS: AdsAccountItem[]`** — 12 accounts matching all 27+ fields from `AdsAccountItem` type:
  - `id`, `account_type`, `ads_id`, `name_ads`, `id_mail`, `budget_paid`, `budget_used`, `budget_remaining`
  - `user_id_manage`, `created_at`, `created_by`, `updated_at`, `updated_by`
  - `resource`, `resource_account`, `mail`, `staff_account`
  - `campaign[]`, `campaigns[]`, `status_ads`, `account_staff_name`, `digital_staff_name`
  - `invoice_source_management_info`

- **`MOCK_CAMPAIGNS: CampaignListItem[]`** — 20 campaigns matching all fields from `CampaignListItem`:
  - `id`, `account_id`, `account_name`, `status_campaign`, `name_campaign`, `code_campaign`
  - `start_date`, `target_url`, `budget`, `campaign_type`, `account_type`, `account_ads`, `account_status`
  - `cost`, `click`, `view`, `cpc`, `cpa`, `cpm`, `ctr`
  - `daily_budget`, `currency_code`, `timezone`
  - `data_from`, `data_to`, `clicktracker_integrated`, `clicktracker_integrated_at`

- **`MOCK_DIGITAL_MAILS: DigitalMailItem[]`** — 8 emails matching all fields from `DigitalMailItem`:
  - `id`, `mail`, `password`, `two_fa`, `recovered`, `mail_type`
  - `manage_user_id`, `vps_id`, `proxy_id`, `account_quantity`, `campaign_quantity`, `accounts_count`
  - `is_delegated`, `allow_refetch`, `created_at`, `updated_at`, `created_by`, `updated_by`
  - `digital_staff_name`, `digital_staff_email`, `account_staff_name`, `account_staff_email`, `account_staff_id`
  - `vps: DigitalMailVps | null`, `proxy: DigitalMailProxy | null`

- **`MOCK_CAMPAIGN_DETAIL: CampaignDetailResponse`** — Full campaign detail with series data for charts

- **`MOCK_STATISTICS`** — Statistics responses: by-status, by-burden-and-cost, account statistics

- Helper functions: `getMockAccountsList()`, `getMockCampaignsList()`, `getMockEmailsList()` with pagination/filter support

---

### Sandbox Page Container

#### [NEW] [AdsSandboxPageContent.tsx](file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/src/containers/ads-sandbox/AdsSandboxPageContent.tsx)

Main sandbox content component, mirroring `AdsPageContent.tsx` but with:
- Same 2-tab layout (Email / Campaign) + restored Accounts/IDs tabs  
- 🧪 Sandbox badge (matching project sandbox style)
- Uses mock data instead of API hooks
- All tabs fully functional with local state management

#### [NEW] [SandboxEmailManagementTab.tsx](file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/src/containers/ads-sandbox/SandboxEmailManagementTab.tsx)

Mirrors `EmailManagementTab.tsx` — table of emails with:
- Same columns: select, no, email, totalBudget, totalSpent, totalRemaining, idCamp, delegationStatus, actions
- Local CRUD operations (add, delete, send delegation — toast notifications)
- Filter by delegation status
- Uses existing `EmailManagementTable` component or a sandbox version

#### [NEW] [SandboxCampaignManagementTab.tsx](file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/src/containers/ads-sandbox/SandboxCampaignManagementTab.tsx)

Mirrors `CampaignManagementTab.tsx` — campaign table with:
- All 19 columns: select, no, id, name_campaign, account_name, account_status, status_campaign, campaign_type, time, timezone, daily_budget, cost, click, view, cpc, cpa, cpm, ctr, start_date, actions
- Local filtering, sorting, date range selection
- Client-side pagination
- Campaign actions (alert settings, click tracker integration simulation)

#### [NEW] [SandboxAccountsTab.tsx](file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/src/containers/ads-sandbox/SandboxAccountsTab.tsx)

Mirrors `AdsAccountsTab.tsx` — accounts table with:
- KPI cards: total deposited, total spent, balance, total accounts
- All columns: stt, id, name, status, email, time, depositedBudget, spentBudget, balance
- Uses existing `AdsAccountsTable` component with mock `AdsAccountListResponse`

---

### Route

#### [NEW] [page.tsx](file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/src/app/[locale]/(admin)/ads/sandbox/page.tsx)

New route at `/ads/sandbox` — renders `AdsSandboxPageContent` with sandbox badge.

---

### Sidebar Navigation

#### [MODIFY] [DashboardSidebar.tsx](file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/src/containers/dashboard/DashboardSidebar.tsx)

Add a nav item for `/ads/sandbox` with `🧪` badge text (matching the `/projects/sandbox` pattern).

## Verification Plan

### Manual Verification
- Navigate to `/ads/sandbox` in the browser
- Verify all 4 tabs render correctly with mock data
- Verify table pagination, column toggling, and filtering work with mock data
- Verify KPI cards display correct aggregated values
- Verify the sandbox badge is displayed
- Compare field-by-field that mock data matches all production types
