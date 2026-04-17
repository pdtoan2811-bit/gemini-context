# Dynamic Squad Planning

This plan proposes how to add dynamic squad (combination of people) planning for daily meetings without needing an entirely new page or major structural changes. We will integrate it directly into the `DailyMeetingView` workflow.

## Proposed Changes

### `src/components/dashboard/DailyMeetingView.tsx`

1. **View Mode Expansion**: Update the `viewMode` state to include `'squads'` along with `'single'` and `'all'`. Add the corresponding toggle button in the control bar. *(Completed)*
2. **Squad Grouping Logic**: Implement a helper to group all active tasks (not fully completed) by their exact assignment combinations (e.g., tasks assigned to "Person A, Person B"). We will only surface combos that have 2 or more people. *(Completed)*
3. **`SquadsView` Component**: Add a new internal component within the file. It will display the extracted combos. For each combo, it will show the backlog of shared active tasks. *(Completed)*
4. **Squad Quick Add**: In the `SquadsView`, we'll provide a button to "Add to Squad's Today Plan" for a task. This will invoke `dailyTodos.addTodo(person, todayStr, taskId)` for every member of the squad. *(Completed)*
5. **Single Person View Quick Add**: In `PersonSingleView` (the left backlog column), if a task is assigned to multiple people, we will add an "Add to Squad" fast-action button next to "Add to Today" to quickly assign it to all involved. *(Completed)*
6. **Task Card Indicator**: Update `DraggableTaskCard` to accept a `showAssignees` boolean prop. When true, it displays a small badge `<Users className="w-2.5 h-2.5"/> {task.currentPerson}` to clearly identify the squad for block-level visibility. *(Completed)*

---

### New Requirements (Phase 2)

**7. Shared Task Syncing Dropdown**
- **Goal:** In the `PersonSingleView`'s right column ("Today's Plan"), allow the user to click a dropdown on a task card, select multiple team members, and sync that task to their daily to-do lists.
- **Implementation:** 
  - Update `DraggableTaskCard` to accept a new prop, `onSyncToOthers?: (persons: string[]) => void`, and `allPersons?: string[]`.
  - Add a **Sync dropdown menu** inside `DraggableTaskCard` (or specifically in the Today's Plan rendering loop inside `PersonSingleView`). 
  - To keep `DraggableTaskCard` clean, we might build the popover dropdown inside `PersonSingleView` instead, placed next to the `DraggableTaskCard`.
  - When the user selects members and clicks "Sync", we call `dailyTodos.addTodo(selectedPerson, todayStr, taskId)` for each selected member.

**8. Squads View Multi-Person Filter**
- **Goal:** Allow the PM to filter the `SquadsView` by selecting multiple specific people. Only squads that contain at least one of the selected people (or exactly those people, depending on logic) will be shown.
- **Implementation:**
  - In `SquadsView`, introduce a multi-select dropdown for `squadFilterPersons`.
  - Pass the list of all available personnel to `SquadsView`.
  - If the filter is empty, show all squads. If it has selections, filter the `squads` array to only those `squadKey`s that include the selected personnel.

## Verification Plan

### Automated Tests
- We will rely on TypeScript type checking (`npx tsc --noEmit`) to ensure our props and state modifications are sound.
- We will run the Next.js dev server and check for any build or runtime errors.

### Manual Verification
1. Run `npm run dev` and navigate to Daily Meeting.
2. In **Single Person View**:
   - Verify the new "Sync" dropdown exists on tasks in Today's Plan.
   - Select another team member from the dropdown and hit Sync.
   - Switch to that team member's view and verify the task was added.
3. In **Squads View**:
   - Verify the new multi-select filter dropdown for people.
   - Select one or more people and ensure only squads containing those people are displayed.
