# Implementation Plan - Task Status Enhancement

This plan outlines the changes required to add two new statuses, `Designing` and `Ready for dev`, between `Not Started` and `In Process`.

## Proposed Changes

### Core Types & Logic

#### [MODIFY] [types.ts](file:///c:/Users/Admin/Desktop/Sprintdebug/sprint-relay/src/lib/types.ts)
- Update `WORKFLOW_STATUSES` to include:
    - `{ index: 1, name: 'Designing', isBottleneck: false, severity: 'normal' as const }`
    - `{ index: 2, name: 'Ready for dev', isBottleneck: false, severity: 'normal' as const }`
- Shift indices for subsequent statuses (e.g., `In Process` becomes index 3).

#### [MODIFY] [status-utils.tsx](file:///c:/Users/Admin/Desktop/Sprintdebug/sprint-relay/src/lib/status-utils.tsx)
- Update `priorityDotColor` to support new statuses:
    - `Designing`: `bg-sky-500`
    - `Ready for dev`: `bg-indigo-400`

#### [MODIFY] [utils.tsx](file:///c:/Users/Admin/Desktop/Sprintdebug/sprint-relay/src/components/dashboard/daily-meeting/utils.tsx)
- Add `Designing` and `Ready for dev` to `ACTIVE_STATUSES` set so they appear in "In Progress" section of Daily Meeting.

### UI Improvements

#### [MODIFY] [TaskOverview.tsx](file:///c:/Users/Admin/Desktop/Sprintdebug/sprint-relay/src/components/dashboard/TaskOverview.tsx)
- Improve status sorting logic to use `WORKFLOW_STATUSES` indices instead of alphabetical string comparison.

## Verification Plan

### Automated Tests
- I will check for existing unit tests for `analyzeTask` or workflow logic.
- If they exist, I will update them to include the new statuses.
- Run `npm test` if applicable.

### Manual Verification
1.  Verify the "Daily Meeting" view shows tasks in `Designing` and `Ready for dev` in the active categories.
2.  Verify the "Task Overview" table sorts by status correctly (following the workflow order).
3.  Check `TaskCard` displays the correct dot colors for the new statuses.
