# Sprint Relay Debugger Implementation Plan

## Goal Description
Build a "Sprint Relay Debugger" application using Next.js, Tailwind CSS, and Shadcn UI. This tool will shift sprint tracking from Kanban to a flow-based Timeline visualization to expose personnel bottlenecks, wait times, and handoffs. It features a manual annotation layer for daily standups to explicitly document blockers and dependencies.

## User Review Required
> [!NOTE]
> Let me know if you have a specific Google Apps Script URL with actual JSON data you want to use, or if I should generate mock data that matches the specified schema (`timestamp`, `taskId`, `taskName`, `recordLink`, `status`, `sprintGoal`, `sprint`, `person`, `module`, `screen`).

## Proposed Changes

### Project Foundation
- Initialize Next.js app (`sprint-relay`) with App Router, TypeScript, and TailwindCSS.
- Set up Shadcn UI.

### Data & Logic
#### [NEW] `src/lib/types.ts`
- Define TypeScript interfaces for the raw log event and the transformed timeline segment.

#### [NEW] `src/lib/api.ts`
- Implement fetching service and data transformation logic.
- Group chronological logs into continuous timeline segments.
- Calculate durations and define success logic (`latest_status == sprintGoal`).

### State Management
#### [NEW] `src/lib/hooks/useNotes.ts`
- Custom React hook to sync "Standup Notes" to `localStorage` using the composite key: `${taskId}_${timestamp}`.

### Core Views
#### [NEW] `src/app/page.tsx`
- Global Dashboard layout with a dark-mode, premium dev-tool aesthetic.

#### [NEW] `src/components/timeline/PersonnelSwimlane.tsx`
- Main visualization component.
- Y-Axis: Personnel. X-Axis: Time.
- Plots task segments as horizontal blocks. Color codes by module/taskId and adds a visual indicator for incomplete tasks.

#### [NEW] `src/components/inspector/StandupInspector.tsx`
- Shadcn `Sheet` component sliding from the right.
- Displays segment data and contains the form for adding manual annotations ("Blocked By", etc.).

## Verification Plan

### Manual Verification
1. Run `npm run dev`.
2. Open the browser and verify the mock data securely correctly populates the Personnel Swimlane layout.
3. Test interaction: Click on a task segment to ensure the Standup Inspector slides out.
4. Test persistence: Add a "Standup Note", refresh the page, and verify the note is still present (loaded from `localStorage`).
