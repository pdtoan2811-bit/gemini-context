# Fix Runtime Error in StandupInspector

The user reported a runtime error when adding a meeting note: `Element type is invalid: expected a string... but got: undefined`. This was traced to `ChevronDown` being used but not imported in `src/components/inspector/StandupInspector.tsx`.

## Proposed Changes

### [Component Name] Inspector

#### [MODIFY] [StandupInspector.tsx](file:///c:/Users/Admin/Desktop/Sprintdebug/sprint-relay/src/components/inspector/StandupInspector.tsx)
- Add `Check` and `ChevronDown` to the named imports from `lucide-react`.

## Verification Plan

### Manual Verification
- The user should be able to open the `StandupInspector` and add/edit meeting notes without the "undefined" element error occurring at line 433 or 455.
