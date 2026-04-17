# Remove Workflow Legend Section

The goal is to remove the "Workflow Legend" sidebar from the dashboard to provide more horizontal space for the main interaction areas (Daily Meeting, Squad Planner, etc.).

## Proposed Changes

### [Dashboard]

#### [MODIFY] [page.tsx](file:///c:/Users/Admin/Desktop/Sprintdebug/sprint-relay/src/app/page.tsx)
- Remove the `WorkflowLegend` component import.
- Remove the `<aside>` element containing the `WorkflowLegend`.
- Update the layout grid to allow the main interaction card to occupy the full width of the container.

#### [DELETE] [WorkflowLegend.tsx](file:///c:/Users/Admin/Desktop/Sprintdebug/sprint-relay/src/components/dashboard/WorkflowLegend.tsx)
- Delete the component file as it is no longer used.

## Verification Plan

### Manual Verification
- Open the application in the browser at `http://localhost:3000/`.
- Verify that the "Workflow Legend" sidebar is no longer visible on the right side.
- Verify that the main interaction area (containing Daily Meeting, Squad Planner, etc.) now expands to the full width of the screen.
- Verify that all tabs (Daily Meeting, Squad Planner, Daily Recap, Personnel, Tasks, Sprint Start, Sandbox) still function correctly and their layouts are preserved.
