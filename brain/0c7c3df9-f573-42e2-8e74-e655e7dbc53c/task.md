# Task: Implement dynamic blocker person from meeting notes

[x] Add `blockedBy?: string` to `TaskAnalysis` in `types.ts`
[x] Update `analyzeAllTasks` in `workflow-engine.ts` to accept `notes: Record<string, MeetingNote[]>` and extract `blockedBy` from the latest note
[x] Update `getPersonSummaries` to attribute a blocked task to the `blockedBy` person
[x] Update `page.tsx` to pass `notes` into `analyzeAllTasks` and `getPersonSummaries`
[x] Update `PersonnelOverview.tsx` to show "Blocked by: X" on the task row and ensure the task is counted as a `blockingTask` for person X.
