# Refactoring Plan for Dashboard Views

## Goal Description
The goal is to refactor `DailyMeetingView.tsx` and `NextSprintPlanningView.tsx` to get better structured code. This will reduce the context size needed for AI to understand the files and will make future coding implementations easier and faster, without breaking any existing functionality. 

### Diagnosis (Code Smells Identified):
- **Monolithic Components**: `DailyMeetingView.tsx` is over 3,000 lines and contains multiple large sub-components (`PersonSingleView`, `HistoricalView`, `CompareView`, `DraggableTaskCard`, `SyncTaskDropdown`).
- **Mixed Concerns**: It mixes complex data transformation logic (e.g., `computePersonMeetingData`, webhook formatting) with UI rendering.
- **High Cognitive Load**: The sheer file size makes it hard for AI models (and humans) to quickly grok the context.

## Proposed Changes

We will apply the "Extract Method" and "Extract Class/Module" refactoring patterns to break down the monolithic files into cohesive, smaller modules.

### Component: Daily Meeting View
We will create a new directory `src/components/dashboard/daily-meeting/` to house the extracted chunks.

#### [NEW] `src/components/dashboard/daily-meeting/types.ts`
- Move shared types (`CategoryFilterKey`, `PersonMeetingData`, `TaskCategory`, `TodoWebhookItem`, `TodoWebhookPayload`, etc.) here.

#### [NEW] `src/components/dashboard/daily-meeting/utils.ts`
- Extract pure helper functions such as `getLatestMeetingNote`, `hasActivityInSprint`, `computePersonMeetingData`, `getVisibleTaskCount`, `priorityDotColor`, `statusBadge`, `formatStaleHours`, `formatCorporateName`, `formatTodoListForDM`, `formatTodoListForWebhook`, and `sendTodoListToWebhook`.

#### [NEW] `src/components/dashboard/daily-meeting/DraggableTaskCard.tsx`
- Extract the `DraggableTaskCard` component and its props interface.

#### [NEW] `src/components/dashboard/daily-meeting/SyncTaskDropdown.tsx`
- Extract the `SyncTaskDropdown` component.

#### [NEW] `src/components/dashboard/daily-meeting/PersonSingleView.tsx`
- Extract the `PersonSingleView` component.

#### [NEW] `src/components/dashboard/daily-meeting/HistoricalView.tsx`
- Extract the `HistoricalView` component.

#### [NEW] `src/components/dashboard/daily-meeting/CompareView.tsx`
- Extract the `CompareView` component.

#### [MODIFY] `src/components/dashboard/DailyMeetingView.tsx`
- Refactor the main file to act purely as an aggregator, importing the extracted types, utilities, and sub-components. This should reduce its size dramatically (by ~70%).

### Component: Next Sprint Planning View
We will create a new directory `src/components/dashboard/next-sprint/` to better organize it.

#### [NEW] `src/components/dashboard/next-sprint/types.ts`
- Extract types like `SyncTaskStatus`, `VerifyStatus`, `SyncTaskResult`, `VerificationResult`, `SyncProgress`.

#### [NEW] `src/components/dashboard/next-sprint/utils.ts`
- Extract helper functions `priorityDotColor` and `statusBadge` (or we could even share a common utility folder in `src/components/dashboard/common/` if appropriate, to avoid duplication).

#### [MODIFY] `src/components/dashboard/NextSprintPlanningView.tsx`
- Refactor the component to use the extracted types and utilities.

## Verification Plan

### Automated Tests
- If there are existing unit tests or build commands, run them (`npm run build`, `npm run lint` or `npx tsc --noEmit`) to verify that imports and types are fully intact.

### Manual Verification
- We will locally host the dev server.
- The user is requested to verify that the Daily Meeting view still works seamlessly:
  - Verify dragging and dropping tasks between Backlog and Today's Plan.
  - Verify syncing tasks and sending webhook functionalities.
  - Verify checking Historical and Compare Views.
- For Next Sprint Planning view, verify that drafting tasks to the squad plan and verifying google sheets works exactly as before.
