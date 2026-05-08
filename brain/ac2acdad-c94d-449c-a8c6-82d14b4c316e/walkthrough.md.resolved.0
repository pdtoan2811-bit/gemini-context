# Ads Management Sandbox — Walkthrough

## What was built

A fully self-contained sandbox replica of the **Quản lý Ads** module, accessible at `/ads/sandbox`. It mirrors the production ads management UI but runs entirely on local mock data — no API calls.

## Files Created

| File | Purpose |
|------|---------|
| [mock-ads-data.ts](file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/src/data/mock-ads-data.ts) | Mock data: 6 emails, 15 accounts, 15 campaigns matching all production types |
| [AdsSandboxPageContent.tsx](file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/src/containers/ads-sandbox/AdsSandboxPageContent.tsx) | Top-level layout with 🧪 Sandbox badge and 3 tabs |
| [SandboxEmailManagementTab.tsx](file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/src/containers/ads-sandbox/SandboxEmailManagementTab.tsx) | Email tab with expandable table, search, delegation filter |
| [SandboxCampaignManagementTab.tsx](file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/src/containers/ads-sandbox/SandboxCampaignManagementTab.tsx) | Campaign tab with full column set, search, filters, date picker, pagination |
| [SandboxAdsAccountsTab.tsx](file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/src/containers/ads-sandbox/SandboxAdsAccountsTab.tsx) | Accounts tab with 4 stats cards, table, search, status filter |
| [page.tsx](file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/src/app/%5Blocale%5D/(admin)/ads/sandbox/page.tsx) | Route at `/ads/sandbox` |

## What was verified

- **TypeScript**: Clean build, zero errors
- **Browser**: All 3 tabs render correctly with mock data populated

## Demo recording

![Ads Sandbox Browser Test](C:\Users\Admin\.gemini\antigravity\brain\ac2acdad-c94d-449c-a8c6-82d14b4c316e\ads_sandbox_verify_1778217387461.webp)

## Production files unchanged

All existing `src/containers/ads/*` files were left untouched. The old `AdsSandboxTable.tsx` stub was replaced by the comprehensive new sandbox.
