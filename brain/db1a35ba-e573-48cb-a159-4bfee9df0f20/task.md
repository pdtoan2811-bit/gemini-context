# Refactoring Plan

- [x] Read agent skill: code refactor
- [x] Analyze `DailyMeetingView.tsx` and `NextSprintPlanningView.tsx`
- [x] Draft an implementation plan
- [x] Get user approval
- [x] Refactor `DailyMeetingView.tsx`
- [x] Refactor `NextSprintPlanningView.tsx`
- [x] Verify refactor functionality
- [x] Investigate sprint filter leak ("tasks from other sprint")
- [x] Fix missing `activeSprint` filter in `NextSprintPlanningView.tsx`
- [x] Final verification of sprint filtering
- [x] Apply strict global sorting on `analyses` ignoring date ranges via `page.tsx`
- [x] Remove `sprint` query parameter from `fetchLogs` to bypass backend date-range truncation and retrieve full task histories
