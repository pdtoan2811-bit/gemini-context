# Task Breakdown

- [x] Remove Interrogation Log from `StandupInspector.tsx`
- [x] Remove Standup Notes from `StandupInspector.tsx`
- [x] Add Edit and Delete support for Daily Meeting Notes in `StandupInspector.tsx`
  - [x] Add `onUpdateMeetingNote(note: MeetingNote)` and `onDeleteMeetingNote(id: string)` to `EnhancedInspectorProps`
  - [x] Update `StandupInspector` UI to support editing and deleting notes
  - [x] Find where `StandupInspector` is used, and pass the new update/delete handlers down
  - [x] Ensure the parent component correctly implements the update/delete functionality for meeting notes
