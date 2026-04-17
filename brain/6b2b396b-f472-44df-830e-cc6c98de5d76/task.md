# Dynamic Squad Planning Feature Tasks

- [x] Modify `DailyMeetingView.tsx` to add "Squads" view mode
- [x] Implement `SquadsView` internal component in `DailyMeetingView.tsx`
- [x] Update `PersonSingleView`
- [x] Update `DraggableTaskCard`

## Phase 2: Shared Sync and Filtering

- [x] Implement Task Syncing Dropdown in `PersonSingleView` Today's Plan
  - [x] Add `allPersons` prop to `PersonSingleView`
  - [x] Inside the "Today's Plan" loop, add a `SyncDropdown` popover component next to or on the `DraggableTaskCard`.
  - [x] The dropdown should allow selecting multiple people.
  - [x] Apply the sync by calling `dailyTodos.addTodo(person, todayStr, taskId)` for each selection.
- [x] Implement Squads View Multi-Person Filter
  - [x] Pass `allPersonData` mapped down to just names to `SquadsView`
  - [x] Add a `squadFilter` state array (string[]) to `SquadsView`
  - [x] Render a multi-select dropdown to choose people.
  - [x] Filter the rendered `squads` based on whether the members match the selected filter.
