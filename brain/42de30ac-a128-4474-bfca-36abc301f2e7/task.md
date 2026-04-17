# Next Sprint Planning Feature

- [x] Investigate `page.tsx` (Daily Meeting View) to understand the "squads and individual approach" for task to-do lists.
- [x] Understand how current tasks are fetched, filtered by sprint, and displayed by personnel/squad.
- [x] Design the UI/UX for the "Next Sprint Planning" feature:
    - Should it be a new route (e.g., `/planning`) or a tab in the current view?
    - How to select "the sprint I choose"?
    - How to filter "tasks from current sprint that are not completed"?
    - How to assign tasks to personnel (individual/squad approach)?
    - How to draft the status, target sprint, and sprintGoal.
- [x] Create an Implementation Plan.
- [x] Get User Approval.
- [x] Implement the UI components.
- [x] Implement the bulk Lark webhook update logic.
## Next Sprint Planning Phase 2: Dynamic Squads
- [x] Refactor `useNextSprintPlan.ts` to store drafts keyed by `taskId` instead of `person`, or manage a global squad draft state.
- [x] Add a visual Squad Selector (multi-person select) at the top of `NextSprintPlanningView`.
- [x] When a squad is selected, show a combined "Squad Backlog" separated into "Shared Tasks" and "Individual Tasks".
- [x] Add a Global "Squad Planning Board" that collects drafts for the chosen squad.
- [x] Add "Bulk Edit" inputs for setting Target Sprint, Target Status collectively for selected drafts.
- [x] Implement a global "Confirm & Sync" button that sends the bulk move payload to Lark via the webhook.
