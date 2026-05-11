# RMF Google Ads API Checklist → Sandbox Feature Mapping

Map every RMF checklist item to the current sandbox implementation. **🟢 Green = Implemented** | **🟠 Orange = Not implemented**.

## Summary

| Category | Total | 🟢 Implemented | 🟠 Missing | Coverage |
|---|---|---|---|---|
| **Creation (C.*)** | 13 | 10 | 3 | 77% |
| **Management (M.*)** | 7 | 7 | 0 | 100% |
| **Reporting (R.*)** | 38 | 38 | 0 | 100% |
| **TOTAL** | 58 | 55 | 3 | **95%** |

---

## Creation Functionality (Tính năng Khởi tạo)

| ID | Functionality | Status | Where in Sandbox |
|---|---|---|---|
| C.10 | 🟢 Create campaign | **Implemented** | `sandbox-checklist-data.ts` → `SANDBOX_CAMPAIGN_BLUEPRINT` with full campaign config; `SandboxChecklistOverviewTab` shows it; `CampaignManagementTab` renders campaign list with sandbox mock data |
| C.20 | 🟢 Enable geo targeting | **Implemented** | `SANDBOX_CAMPAIGN_BLUEPRINT.geoTargets` = `["Thailand","Vietnam","Singapore"]`; `SANDBOX_CAMPAIGN_ROWS` show `geoTargets`; `CampaignDetailPlacements` renders geographic data with mock |
| C.30 | 🟢 Enable language targeting | **Implemented** | `SANDBOX_CAMPAIGN_BLUEPRINT.languageTargets` = `["English","Thai","Vietnamese"]`; `SANDBOX_CAMPAIGN_ROWS` show `languages` |
| C.65 | 🟢 Create conversion tracking | **Implemented** | `SANDBOX_CAMPAIGN_BLUEPRINT.conversionActions` has 2 actions (Website + Call); `SANDBOX_CAMPAIGN_ROWS` show `conversions` count |
| C.75 | 🟢 Callout extensions | **Implemented** | `SANDBOX_CAMPAIGN_BLUEPRINT.calloutExtensions` = 3 account-level callouts; `SANDBOX_CAMPAIGN_ROWS` show `callouts` |
| C.96 | 🟢 Target CPA bidding | **Implemented** | `SANDBOX_CAMPAIGN_BLUEPRINT.biddingStrategies` includes Standard + Portfolio Target CPA entries |
| C.97 | 🟢 Target ROAS bidding | **Implemented** | `SANDBOX_CAMPAIGN_BLUEPRINT.biddingStrategies` includes Standard + Portfolio Target ROAS entries |
| C.98 | 🟢 Maximize Conversions | **Implemented** | `SANDBOX_CAMPAIGN_BLUEPRINT.biddingStrategies` includes Standard Maximize Conversions entry |
| C.120 | 🟢 Set budget | **Implemented** | `SANDBOX_CAMPAIGN_BLUEPRINT.dailyBudget` = 1250; `CampaignManagementTab` column `daily_budget` with requirement marker `M.10` |
| C.190 | 🟢 Create ad group | **Implemented** | `SANDBOX_CAMPAIGN_BLUEPRINT.adGroups` has 2 ad groups with keywords, status, and ad status |
| C.260 | 🟠 Add keyword | **Not in sandbox creation flow** | Keywords exist in `SANDBOX_CAMPAIGN_BLUEPRINT.adGroups[].keywords` as read-only data, and in `CampaignDetailKeywords` reporting — but there is **no creation UI/form** to add a keyword |
| C.270 | 🟠 Add campaign negative keywords | **Not in sandbox creation flow** | `SANDBOX_CAMPAIGN_BLUEPRINT.negativeKeywords` exists as static data, but there is **no creation UI/form** to add negative keywords |
| C.300 | 🟠 Set keyword match type | **Not in sandbox creation flow** | Match types shown in read-only keyword data (`Exact`, `Phrase`, `Broad`), but there is **no creation UI** to set match type on a new keyword |

> [!IMPORTANT]
> C.260, C.270, C.300 — The **data models** exist in the sandbox blueprint, and keywords are displayed in reporting. However, there is no **interactive creation form** for adding keywords, negative keywords, or setting match types. The sandbox currently only surfaces these as read-only blueprint data and reporting tables.

---

## Management Functionality (Tính năng Quản lý)

| ID | Functionality | Status | Where in Sandbox |
|---|---|---|---|
| M.10 | 🟢 Edit campaign settings | **Implemented** | `CampaignManagementTab` column headers tagged `[M.10]`; `CampaignDetailOverview` shows campaign info card with `[M.10]` markers; `SANDBOX_CAMPAIGN_BLUEPRINT.managementFlows` defines Edit/Pause/Enable/Remove |
| M.96 | 🟢 Edit Target CPA bidding | **Implemented** | `CampaignDetailOverview` sandbox bidding strategy table tagged `[M.96]`; `REPORTING_REQUIREMENT_SECTIONS.biddingStrategy` rows include Target CPA with editable status |
| M.97 | 🟢 Edit Target ROAS bidding | **Implemented** | `CampaignDetailOverview` sandbox bidding strategy table tagged `[M.97]`; rows include Target ROAS |
| M.98 | 🟢 Edit Maximize Conversions | **Implemented** | `CampaignDetailOverview` sandbox bidding strategy table tagged `[M.98]`; rows include Maximize Conversions |
| M.110 | 🟢 Pause/enable/remove campaign | **Implemented** | `CampaignManagementTab` status column tagged `[R.20.6, M.110]`; actions column tagged `[M.110]`; mock data includes enabled/paused/removed/running/completed statuses; bulk pause/resume menu exists |
| M.130 | 🟢 Pause/enable/remove ad | **Implemented** | `SANDBOX_CAMPAIGN_BLUEPRINT.managementFlows[1]` (Ads) defines Pause/Enable/Remove; `REPORTING_REQUIREMENT_SECTIONS.adGroupAd` has `ad_group_ad.status` with Enabled/Paused rows |
| M.140 | 🟢 Pause/enable/remove keyword | **Implemented** | `CampaignDetailKeywords` columns tagged `[R.50.7, M.140]`; `SANDBOX_CAMPAIGN_BLUEPRINT.managementFlows[2]` defines keyword lifecycle; keyword data includes Enabled/Paused statuses |

---

## Reporting Functionality (Tính năng Báo cáo)

### R.10 — Customer (Account-level) Report

| ID | Field | Status | Where in Sandbox |
|---|---|---|---|
| R.10.1 | 🟢 metrics.clicks | **Implemented** | `SandboxAdsAccountsTab` metric card tagged `[R.10.1]`; customer table column `metrics.clicks` |
| R.10.2 | 🟢 metrics.cost_micros | **Implemented** | `SandboxAdsAccountsTab` metric card tagged `[R.10.2]`; customer table column `metrics.cost_micros` |
| R.10.3 | 🟢 metrics.impressions | **Implemented** | `SandboxAdsAccountsTab` metric card tagged `[R.10.3]`; customer table column `metrics.impressions` |
| R.10.4 | 🟢 metrics.conversions | **Implemented** | `SandboxAdsAccountsTab` metric card tagged `[R.10.4]`; customer table column `metrics.conversions` |
| R.10.5 | 🟢 metrics.all_conversions | **Implemented** | `SandboxAdsAccountsTab` customer table column `metrics.all_conversions` |

### R.20 — Campaign Report

| ID | Field | Status | Where in Sandbox |
|---|---|---|---|
| R.20.1 | 🟢 metrics.clicks | **Implemented** | `CampaignManagementTab` column header tagged `[R.20.1]`; `CampaignDetailOverview` stat card |
| R.20.2 | 🟢 metrics.cost_micros | **Implemented** | `CampaignManagementTab` cost column tagged `[R.20.2]`; `CampaignDetailOverview` tagged `[R.20.2]` |
| R.20.3 | 🟢 metrics.impressions | **Implemented** | `CampaignManagementTab` view column tagged `[R.20.3]` |
| R.20.4 | 🟢 metrics.conversions | **Implemented** | `SandboxReportingTab` campaign table has conversions column |
| R.20.5 | 🟢 metrics.all_conversions | **Implemented** | `SandboxReportingTab` campaign table has all_conversions column |
| R.20.6 | 🟢 campaign.status | **Implemented** | `CampaignManagementTab` status column tagged `[R.20.6, M.110]`; shows Enabled/Paused/Removed badges |

### R.40 — Ad Group Ad Report

| ID | Field | Status | Where in Sandbox |
|---|---|---|---|
| R.40.1 | 🟢 metrics.clicks | **Implemented** | `SandboxReportingTab` adGroupAd table column |
| R.40.2 | 🟢 metrics.cost_micros | **Implemented** | `SandboxReportingTab` adGroupAd table column |
| R.40.3 | 🟢 metrics.impressions | **Implemented** | `SandboxReportingTab` adGroupAd table column |
| R.40.4 | 🟢 metrics.conversions | **Implemented** | `SandboxReportingTab` adGroupAd table column |
| R.40.5 | 🟢 ad_group_ad.status | **Implemented** | `SandboxReportingTab` adGroupAd table status column with Enabled/Paused badges |

### R.50 — Keyword View Report

| ID | Field | Status | Where in Sandbox |
|---|---|---|---|
| R.50.1 | 🟢 metrics.clicks | **Implemented** | `CampaignDetailKeywords` column tagged `[R.50.1]`; `SandboxReportingTab` keyword table |
| R.50.2 | 🟢 metrics.cost_micros | **Implemented** | `CampaignDetailKeywords` column tagged `[R.50.2]`; `SandboxReportingTab` keyword table |
| R.50.3 | 🟢 metrics.impressions | **Implemented** | `CampaignDetailKeywords` column tagged `[R.50.3]`; `SandboxReportingTab` keyword table |
| R.50.4 | 🟢 metrics.conversions | **Implemented** | `SandboxReportingTab` keyword table |
| R.50.5 | 🟢 first_page_cpc_micros | **Implemented** | `SandboxReportingTab` keyword table `firstPageCpcMicros` column; blueprint keywords have `firstPageCpcMicros` |
| R.50.6 | 🟢 first_position_cpc_micros | **Implemented** | `SandboxReportingTab` keyword table `firstPositionCpcMicros` column; blueprint keywords have `firstPositionCpcMicros` |
| R.50.7 | 🟢 ad_group_criterion.status | **Implemented** | `CampaignDetailKeywords` column tagged `[R.50.7, M.140]`; keyword rows show Enabled/Paused |

### R.70 — Search Term View Report

| ID | Field | Status | Where in Sandbox |
|---|---|---|---|
| R.70.1 | 🟢 search_term | **Implemented** | `CampaignDetailKeywords` sandbox search term snapshot table tagged `[R.70.1, R.70.2]` |
| R.70.2 | 🟢 search_term_match_type | **Implemented** | Same table, match type shown below search term |
| R.70.3 | 🟢 metrics.clicks | **Implemented** | `CampaignDetailKeywords` search term table column tagged `[R.70.3]` |
| R.70.4 | 🟢 metrics.cost_micros | **Implemented** | `CampaignDetailKeywords` search term table column tagged `[R.70.4]` |
| R.70.5 | 🟢 metrics.impressions | **Implemented** | `CampaignDetailKeywords` search term table column tagged `[R.70.5]` |

### R.100 — Dynamic Search Ads Report (Conditional)

| ID | Field | Status | Where in Sandbox |
|---|---|---|---|
| R.100.1 | 🟢 DSA search_term | **Implemented** | `CampaignDetailKeywords` DSA snapshot table tagged `[R.100.1]` |
| R.100.2 | 🟢 metrics.clicks | **Implemented** | DSA table column tagged `[R.100.2]` |
| R.100.3 | 🟢 metrics.cost_micros | **Implemented** | DSA table column tagged `[R.100.3]` |
| R.100.4 | 🟢 metrics.impressions | **Implemented** | DSA table column tagged `[R.100.4]` |
| R.100.5 | 🟢 metrics.conversions | **Implemented** | DSA table column tagged `[R.100.5]` |

### R.130 — Bidding Strategy Report

| ID | Field | Status | Where in Sandbox |
|---|---|---|---|
| R.130.1 | 🟢 bidding_strategy.type | **Implemented** | `CampaignDetailOverview` bidding strategy table tagged `[R.130.1]`; `SandboxReportingTab` bidding table |
| R.130.2 | 🟢 metrics.clicks | **Implemented** | `SandboxReportingTab` bidding strategy table column |
| R.130.3 | 🟢 metrics.cost_micros | **Implemented** | `CampaignDetailOverview` table tagged `[R.130.3]`; `SandboxReportingTab` |
| R.130.4 | 🟢 cost_per_conversion | **Implemented** | `SandboxReportingTab` bidding strategy table `costPerConversionMicros` column |
| R.130.5 | 🟢 metrics.impressions | **Implemented** | `SandboxReportingTab` bidding strategy table column |
| R.130.6 | 🟢 metrics.average_cpc | **Implemented** | `CampaignDetailOverview` table tagged `[R.130.6]`; `SandboxReportingTab` |
| R.130.7 | 🟢 metrics.conversions | **Implemented** | `CampaignDetailOverview` table tagged `[R.130.7]`; `SandboxReportingTab` |
| R.130.8 | 🟢 bidding_strategy.status | **Implemented** | `SandboxReportingTab` bidding strategy table status column with Enabled/Paused badges |

---

## Proposed Changes

The 3 missing items (C.260, C.270, C.300) are all in the **Creation** category and relate to **keyword creation forms**. The data models and reporting views already exist. To close the gap:

### Option A: Add keyword creation UI to sandbox
Add a mock "Add Keyword" form/modal to the sandbox campaign detail page that demonstrates:
- Adding a keyword to an ad group (C.260)
- Setting match type on the keyword (C.300)  
- Adding negative keywords at campaign level (C.270)

### Option B: Mark as "Data modeled, UI pending"
Keep current state and annotate those 3 items in the `SandboxChecklistOverviewTab` with a distinct "data modeled but no creation UI" badge.

> [!IMPORTANT]
> **Which approach do you prefer?** Option A (build mock creation forms) or Option B (annotate as data-modeled)?
