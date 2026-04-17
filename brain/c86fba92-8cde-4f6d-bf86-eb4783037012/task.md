# Sprint Start & Record Link Features

## Feature 1: Sprint Start Status Snapshot
- [x] Create `useSprintStart` hook for persistence (read/write via `/api/data`)
- [x] Add sprint-start data computation logic (find earliest timestamp per sprint where sprint & status are both non-null)
- [x] Create `SprintStartManager` component with table view: task ID, name, auto-detected status, editable status override
- [x] Add filtering by sprint, bulk edit, confirm/save functionality
- [x] Add a new "Sprint Start" tab in the main page tab navigation
- [x] Wire everything together in `page.tsx`

## Feature 2: Record Link in Task Detail
- [x] Add a "Record Link" section to `StandupInspector.tsx` that displays and links to the `recordLink` URL
- [x] Source from both `segment.recordLink` and `taskAnalysis.recordLink`
