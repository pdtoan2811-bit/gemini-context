# Show Shared Squad Progress in Daily Recap View

## Goal Description
When a user selects multiple people to form a squad in the `DailyRecapView`, they want an overview of the *squad's shared progress* on tasks they are working on together, similar to how it's done in the `DailyMeetingView`. The current view simply shows all Selected Persons side-by-side, which becomes noisy for understanding collective effort. The goal is to present a unified "Squad Progress" block summarizing tasks touched by >1 selected person.

## Proposed Changes

### `src/components/dashboard/DailyRecapView.tsx`
- **Data Derivation for Shared Tasks**:
  - Introduce `sharedMovementData`, which computes tasks that are shared among the *currently selected personnel*.
  - A task is "shared" if it appears in the daily movement data (forward, backward, same, or no change) of **at least 2** distinct persons *currently selected in the filter*.
  - To do this, we'll iterate through all tasks in `filteredMovementData.personMovements`, count the occurrences of each `taskId` within the selected group, and preserve the task movement objects for any task that has a count >= 2.
- **Component Additions**:
  - If `selectedPersonsFilter.size > 1` (more than one person selected) and there are shared tasks, we'll render a new section specifically for "Shared Squad Progress".
  - This section will act similarly to a "PersonCard", but representing the "Squad" as the entity. It will aggregate the unique shared tasks into `Moved Forward`, `Moved Backward`, `Same Status`, and `No Change` categories.
  - We'll construct a mock `PersonDailyMovement` object called `squadData` that contains these aggregated shared tasks.
  - We'll pass `squadData` into a `PersonCard` component directly, leveraging the existing robust rendering logic. We'll give it a special visual distinctiveness (e.g., a "Squad Tasks" header with an indigo dot).
- **Placement**:
  - The "Shared Squad Progress" section will be placed right above the individual `PersonCards` grid, acting as a top-level summary for the group.

## Verification Plan
1. Launch the app and go to the Daily Recap view.
2. Select *one* person. Verify that the "Shared Squad Progress" block does *not* appear.
3. Select a *second* person.
4. Verify that the "Shared Squad Progress" block appears (if they share any tasks).
5. Ensure the Shared block correctly groups and deduplicates tasks that both members touched that day (e.g., if one moved it forward and another added activity, it should probably be recorded based on the overall task movement). We will use the task movement object from the perspective of the task itself (or simply pick one of the person's movement objects for that task, since the task's start/end status and movement type are identical regardless of who touched it).
6. Verify individual person cards still show below the shared squad summary.
