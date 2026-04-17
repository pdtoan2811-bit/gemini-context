# Walkthrough: Dynamic Blocker Person

## Overview
I updated the workflow engine to dynamically track and assign blocked tasks to the person blocking them based on the latest daily meeting notes.

## What changed
- **Types**: Added `blockedBy?: string` to the `TaskAnalysis` type in `types.ts`.
- **Workflow Engine**: 
  - Updated `analyzeTask` to scan the provided `MeetingNotes` for a task and pick the newest one. If it identifies the task as stalled, it extracts the `blockedBy` value.
  - Updated `getPersonSummaries` to attribute a task specifically to the `blockedBy` person, if present. This allows the bottleneck to properly roll up under the person actually responsible for the holdup.
- **UI & Display**:
  - `page.tsx` now passes the live meeting notes down to the workflow engine.
  - `PersonnelOverview.tsx` displays a "Blocked by: [Name]" pill on the task card when a block exists.

## Validation
These changes ensure that PMs can use the Meeting Notes feature to dynamically override assignees during Standups, and the dashboard will correctly reflect who the task is currently waiting on.
