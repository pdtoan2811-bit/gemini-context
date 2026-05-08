# Ads Management Sandbox Walkthrough

I have successfully implemented the **Ads Management Sandbox**, turning it into an interactive prototype that closely mimics the Project Management Sandbox.

## What was Accomplished

1. **Robust State Management**: Implemented `useAdsSandboxStore.tsx` using React Context and `useReducer` to manage the sandbox state (Accounts, Events, Scenarios) completely client-side without relying on real API endpoints.
2. **Production-Matched Mock Data**: Created `mock-ads-sandbox-data.ts` containing initial data that strictly conforms to the production `AdsAccountItem` interface (including mapping dummy campaigns and budgets).
3. **Interactive List View**: Built `AdsListPanel.tsx` using `DataTable`. It features:
   - A Scenario selector to instantly trigger state simulations (e.g. Budget Exhausted, Auto Suspend).
   - Quick action buttons on each row ("Nạp tiền", "Tạm Ngưng") to manually dispatch state changes.
   - Live visual updates when state changes (e.g., Budget updates, Status badges change colors).
4. **Detailed Drill-Down View**: Built `AdsDetailView.tsx` to visualize individual account metrics. It features:
   - Spend progress bars.
   - An event timeline logger (simulating a system audit log/history of the sandbox).

## Validation

The Sandbox is completely isolated from production APIs. All state mutations trigger `ADD_EVENT` actions so you can visually verify the system log update when you interact with the UI. 

You can test this right now by navigating to **`/vi/ads/sandbox`** in your browser. Try selecting a scenario from the dropdown to see the Sync Animations and automated event logging in action.

## Rendered Changes
render_diffs(file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/src/types/ads-sandbox-types.ts)
render_diffs(file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/src/data/mock-ads-sandbox-data.ts)
render_diffs(file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/src/hooks/useAdsSandboxStore.tsx)
render_diffs(file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/src/containers/ads-sandbox/AdsListPanel.tsx)
render_diffs(file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/src/containers/ads-sandbox/AdsDetailView.tsx)
render_diffs(file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/src/app/[locale]/(admin)/ads/sandbox/page.tsx)
