# Sprint Filtering + Shared Tasks Fix

## Issue 1: Sprint 8 tasks still showing

**Root cause**: Google Sheets JSON returns `sprint` as a number (e.g., `9`), but `activeSprint` is always a string (`"9"`). JavaScript strict inequality `9 !== "9"` is `true`, causing the filter to never match correctly.

**Fix**: Applied `String()` coercion in all sprint comparison points:

```diff
-if (activeSprint && task.sprint !== activeSprint) return;
+if (activeSprint && String(task.sprint) !== String(activeSprint)) return;
```

Files changed:
- [workflow-engine.ts](file:///c:/Users/Admin/Desktop/Sprintdebug/sprint-relay/src/lib/workflow-engine.ts) — `String(latest.sprint || '')` in `analyzeTask`
- [DailyMeetingView.tsx](file:///c:/Users/Admin/Desktop/Sprintdebug/sprint-relay/src/components/dashboard/DailyMeetingView.tsx) — Fixed 4 sprint comparison points

## Issue 2: SquadsView shared tasks aligned with NextSprintPlanningView

Refactored `SquadsView` backlog computation to match `NextSprintPlanningView`:

| Before | After |
|--------|-------|
| Derived tasks from `allPersonData` indirectly | Uses `analyses` directly with sprint + status filter |
| Checked task membership via `allPersonData.allTasks` | Uses `currentPerson` split directly (like NextSprintPlanningView) |
| Depended on `categoryFilter` | Filters uncompleted + sprint-matching tasks only |
