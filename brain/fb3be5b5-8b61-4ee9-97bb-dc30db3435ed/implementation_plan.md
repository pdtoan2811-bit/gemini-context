# Fix Squad Shared Tasks & Sprint Goal Calculation

Two bugs in the squad/daily meeting task planning features.

---

## Proposed Changes

### Bug 1: Shared Tasks Must Require ALL Squad Members

Currently, when 3 people are selected as a squad, any task shared by **2 of 3** appears as a "shared task." The user wants shared tasks to mean **all selected members** share the task.

#### [MODIFY] [DailyRecapView.tsx](file:///c:/Users/Admin/Desktop/Sprintdebug/sprint-relay/src/components/dashboard/DailyRecapView.tsx)

Two locations to fix:

1. **Recap mode** (line 627): Change `taskPersonCounts[taskId].size > 1` → `taskPersonCounts[taskId].size === selectedPersonsFilter.size` so shared tasks require ALL selected people.

2. **Squad todo mode** (line 982): Change `persons.size >= 2` → `persons.size >= selectedPersonsFilter.size` for consistency.

3. **Empty-state text** (lines 435, 449, 993): Update helper text from "at least two" → "all selected people."

---

### Bug 2: Flexible Sprint Goal Met Calculation

Currently, sprint goal is checked via exact match (`currentStatus === sprintGoal`). If a task's status has **progressed beyond** the sprint goal (e.g., goal is "Testing" but status is "Completed"), it should still count as "met."

#### [MODIFY] [utils.ts](file:///c:/Users/Admin/Desktop/Sprintdebug/sprint-relay/src/lib/utils.ts)

Add a shared helper function `hasMetSprintGoal(currentStatus, sprintGoal)` that:
- Returns `false` if no sprint goal is set
- Looks up the workflow index of both statuses using `WORKFLOW_STATUSES`
- Returns `true` if `currentStatusIndex >= sprintGoalIndex` (at or beyond the goal)
- Falls back to exact string match if either status is not in the workflow

#### [MODIFY] [api.ts](file:///c:/Users/Admin/Desktop/Sprintdebug/sprint-relay/src/lib/api.ts)

Line 64: Replace `latestLog.status === latestLog.sprintGoal` with `hasMetSprintGoal(...)`.

#### [MODIFY] [TaskOverview.tsx](file:///c:/Users/Admin/Desktop/Sprintdebug/sprint-relay/src/components/dashboard/TaskOverview.tsx)

Lines 67-68, 101, 166: Replace all `currentStatus === sprintGoal` with `hasMetSprintGoal(...)`.

#### [MODIFY] [DailyMeetingView.tsx](file:///c:/Users/Admin/Desktop/Sprintdebug/sprint-relay/src/components/dashboard/DailyMeetingView.tsx)

Lines 683-684, 690, 1257-1258, 1264: Replace `task.currentStatus === task.sprintGoal` with `hasMetSprintGoal(...)` in the `DraggableTaskCard` component and `SquadsView` component.

#### [MODIFY] [workflow-engine.ts](file:///c:/Users/Admin/Desktop/Sprintdebug/sprint-relay/src/lib/workflow-engine.ts)

Line 145: Replace `latest.status === 'Completed' || latest.status === 'Staging Passed'` with `hasMetSprintGoal(...)` for staleness check to be consistent (keeping current hardcoded statuses as fallback).

---

## Verification Plan

### Manual Verification

1. Open the app at `localhost:3001`
2. **Bug 1 — Squad of 3**:
   - Go to Daily Recap View
   - Select exactly 3 people as a squad
   - Verify only tasks shared by **all 3** appear in "Shared Effort" section and "Squad Shared To‑Do" tab
   - Select 2 people — verify tasks shared by **both** appear
3. **Bug 2 — Sprint Goal**:
   - Go to Task Overview
   - Find a task whose current status is **beyond** its sprint goal (e.g., goal = "Testing", status = "Completed")
   - Verify it shows the green ✓ "MET" badge instead of the gray target icon
   - Check the Met Goal count in the summary stats
