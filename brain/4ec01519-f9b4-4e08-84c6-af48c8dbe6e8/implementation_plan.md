# Fix Sprint Filtering + Align Shared Task Logic

## Root Cause Analysis

### Sprint Filtering
The sprint field in `RawLogEvent` comes from Google Sheets JSON, where numeric sprint values are deserialized as **numbers** (e.g., `sprint: 9`), not strings. However, `activeSprint` from `useSprintConfig` is always a **string** (`"9"`). The strict inequality `task.sprint !== activeSprint` fails silently (`9 !== "9"` → `true` in JS), so all tasks get filtered out or no filtering happens at all depending on the guard condition.

**Fix**: Use `String()` coercion for robust comparison in all sprint comparison points:
- `analyzeTask` when setting `sprint` field
- `computePersonMeetingData` when filtering
- `SquadsView` when filtering planned tasks

### Shared Task Logic  
The SquadsView derives its backlog from `allPersonData` (indirect approach), while NextSprintPlanningView uses `task.currentPerson` directly to determine which squad members are involved. The direct approach from NextSprintPlanningView is cleaner and should be adopted.

## Proposed Changes

### [Workflow Engine]
#### [MODIFY] [workflow-engine.ts](file:///c:/Users/Admin/Desktop/Sprintdebug/sprint-relay/src/lib/workflow-engine.ts)
- Coerce `sprint` to `String()` in `analyzeTask`

### [Daily Meeting View]
#### [MODIFY] [DailyMeetingView.tsx](file:///c:/Users/Admin/Desktop/Sprintdebug/sprint-relay/src/components/dashboard/DailyMeetingView.tsx)
- Fix sprint comparison in `computePersonMeetingData` with `String()` coercion
- Align `SquadsView` backlog with NextSprintPlanningView's approach: use `task.currentPerson` directly to determine shared vs individual tasks
- Fix sprint comparison in `SquadsView` plan computation
