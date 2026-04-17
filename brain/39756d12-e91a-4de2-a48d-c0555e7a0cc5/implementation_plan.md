# Goal: Dynamic Squad View

## Context
The current `SquadsView` only shows a static list of tasks grouped by exact same assignees, but it doesn't support interactive daily planning for combinations of people (e.g., tester + backend). The user wants a dynamic 2-column UI where they can gradually select personnel, and the UI will intelligently group tasks to show:
1. Tasks shared among the selected personnel
2. Individual tasks for each selected person
3. Tasks by others that are blocking the selected personnel

This will allow the user to effectively plan an integrated "Squad Plan" by moving tasks from the backlog (Column 1) to the squad's to-do list (Column 2).

## Proposed Changes

### 1. `src/components/dashboard/DailyMeetingView.tsx`
Replace the implementation of the `SquadsView` component (or add a new view entirely, reusing the "Squads" tab) to be a dynamic 2-column layout similar to `PersonSingleView`, but supporting multiple people.

**Features of the New `DynamicSquadView`:**
- **Personnel Selector:** A horizontal list of avatars/badges of all personnel. Clicking one toggles them in the current `selectedPersons` set.
- **Left Column (Squad Backlog):**
  Aggregates tasks for all `selectedPersons` and groups them intelligently:
  - **Shared Tasks:** Tasks assigned to more than 1 of the `selectedPersons`.
  - **Individual Tasks:** Tasks assigned to exactly 1 of the `selectedPersons`.
  - **Blocking Tasks:** Tasks currently blocking any of the `selectedPersons` (determined via `meetingNotes` stalls).
  *Each group will be an accordion or visually separated list so it's easy to read.*
- **Right Column (Squad's Today's Plan):**
  - Displays the combined `dailyTodos` for all `selectedPersons`.
  - Also grouped by "Shared Tasks", "Individual Tasks", etc., or clearly tagged with assignees to show "who is doing what together".
  - Allows drag-and-drop from the Backlog to the Plan. When a shared task is dropped, it gets planned for *all* involved selected people.

## Verification Plan
### Manual Verification
1. Start the React app.
2. Go to the Daily Meeting view and click on the "Squads" tab.
3. Select 1 person (e.g., a Backend Developer). Verify the Backlog correctly shows their individual tasks and any tasks blocking them.
4. Select a 2nd person (e.g., a Tester). Verify the Backlog dynamically updates to show:
   - Tasks shared between BE and Tester
   - Tasks only for BE
   - Tasks only for Tester
   - Tasks blocking either of them
5. Drag a shared task to the "Squad's Today's Plan" column. Verify it is added to the plan and correctly synced across the selected individuals.
6. Verify the UI updates organically without breaking existing views (`PersonSingleView`, `AllPersonsView`, etc.).
