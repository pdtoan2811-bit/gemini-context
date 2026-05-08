# Ads Management Sandbox Implementation Plan

This document outlines the approach for building an interactive sandbox for Ads Management, mirroring the architecture and aesthetic of the existing Project Management Sandbox. It will use mock data that strictly adheres to the production `AdsAccountItem` interface.

## Goal Description

The goal is to create a fully functional, interactive prototype (Sandbox) for the Ads Management module. It will feature real-time state management using React Context and `useReducer` to simulate interactions like adding budget, changing account statuses, and tracking system events (e.g., Google Ads API syncs). The data structures will match the production environment's `AdsAccountItem` to ensure the prototype can easily be transitioned into the real backend implementation later.

> [!IMPORTANT]
> **User Review Required**
> Please review the proposed simulation scenarios below. Are there any other specific "mock interactions" you'd like to test in this sandbox? 
> Also, confirm if the location `src/app/[locale]/(admin)/ads/sandbox` is correct for this new page.

## Proposed Simulation Scenarios (Scenarios)

To make it an interactive prototype, we will implement these quick-test scenarios:
1. **Auto-suspend**: Simulate Google Ads suspending an account due to policy violations (Status changes to `suspended`).
2. **Budget Exhausted**: Simulate campaign spending depleting the budget (Status changes to `inactive` / `paused`, `budget_remaining` reaches 0).
3. **Deposit Success**: Simulate a successful top-up of budget (`budget_paid` increases, `budget_remaining` updates).
4. **Link New Campaign**: Simulate a new campaign being spun up under the Ad account.

## Proposed Changes

---

### 1. Types and Mock Data

#### [NEW] `src/types/ads-sandbox-types.ts`
- Define the sandbox-specific state types, action types (`AdsSandboxState`, `AdsSandboxAction`, `AdsEvent`).
- Ensure it uses the existing `AdsAccountItem` from `src/types/ads.ts`.

#### [NEW] `src/data/mock-ads-sandbox-data.ts`
- Generate realistic mock data for ~10 Ad Accounts that match the `AdsAccountItem` interface precisely.
- Include varied statuses (`active`, `suspended`, `pending`), budgets, and mapped campaigns.
- Define `DEFAULT_ADS_STATE`.

---

### 2. State Management

#### [NEW] `src/hooks/useAdsSandboxStore.tsx`
- Implement a `useReducer` and React Context based store (similar to `useProjectCampaignStore.tsx`).
- Support actions like `DEPOSIT_BUDGET`, `CHANGE_STATUS`, `ADD_EVENT`, `LOAD_SCENARIO`, `EDIT_ACCOUNT`.
- Provide convenience selectors for active, suspended, and pending accounts.

---

### 3. UI Components (Ads Sandbox Layout)

#### [NEW] `src/containers/ads-sandbox/AdsListPanel.tsx`
- The main data table view for the sandbox, mimicking the production `AdsAccountsTable.tsx` but wired up to the sandbox store.
- Include tabs to filter by "Tất cả", "Hoạt động", "Tạm ngưng".
- Add a "Scenario" runner banner at the top to trigger the interactive scenarios.

#### [NEW] `src/containers/ads-sandbox/AdsDetailView.tsx`
- A detailed drill-down view when clicking an Ad Account.
- Displays budget progress bars, connected campaigns, and an Event Log (Timeline) of what happened to this account.

#### [NEW] `src/containers/ads-sandbox/DepositModal.tsx`
- A modal to simulate depositing money into the ad account.

#### [NEW] `src/containers/ads-sandbox/EventLogPanel.tsx` (Optional/Reused)
- A panel to show the history of simulated events.

---

### 4. Routing

#### [NEW] `src/app/[locale]/(admin)/ads/sandbox/page.tsx`
- The main entry point for the Sandbox.
- Wraps the components in `AdsSandboxProvider` and mounts `AdsListPanel`.

## Verification Plan

### Manual Verification
1. Navigate to `/vi/ads/sandbox` in the browser.
2. Verify that the table renders the mock data correctly and matches the visual style of the production Ads Table.
3. Test the "Scenario" triggers to ensure the state updates globally, budget changes are calculated correctly, and events are logged in the event timeline.
4. Verify that no real API requests are made and everything is contained within the sandbox state.
