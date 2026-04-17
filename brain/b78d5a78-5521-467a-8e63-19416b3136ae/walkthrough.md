# Dynamic Roles Walkthrough

I've completed the implementation of the Member Roles feature, allowing you to assign roles to squad members and use those roles to dynamically sort and group data across the application.

## Changes Made

### 1. Data Layer & API
- Created `data/roles.json` to store member roles persistently, safely adhering to the requirement of **NOT** modifying the existing `db.json` file.
- Added a new API route `src/app/api/roles/route.ts` to fetch and update `roles.json`.
- Implemented `useRoles` hook in `src/lib/hooks/useRoles.ts` to manage the React state and trigger seamless optimisic UI updates.

### 2. DailyMeetingView & Squad View
- Added a **Member Roles Settings** button inside `DailyMeetingView`.
- This button opens a dynamic modal allowing you to flexibly assign each team member to one of the following roles:
  - `Tester`
  - `BE dev`
  - `FE dev`
  - `Team Leader`
- The `SquadsView` member selection row **automatically sorts your squad list** strictly by this role priority order (`Tester -> BE dev -> FE dev -> Team Leader -> Other`).

### 3. StandupInspector Blocked by Dropdown
- Modifed the `<StandupInspector />` to reference the dynamic roles instead of the hardcoded list of team leaders.
- The "Blocked by" `<select>` elements now use `optgroup` sections divided cleanly by the new member roles.

## Validation Results
- Verified that `npm run build` succeeds locally.
- Verified that component logic strictly adheres strictly to the constraints without editing `db.json`.

Please check the application locally to review and organize your team into the new squad view!
