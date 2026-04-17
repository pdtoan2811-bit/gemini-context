# Sprint Handoff Diagnostic Tool Implementation Plan

## Goal Description
Build a React-based single-page application (Next.js, Tailwind CSS) to visualize personnel bottlenecks and task handoff latency. The application will fetch live sprint log data, process it to compute duration each person held a task, and render a personnel swimlane timeline. We will use `vis-timeline` (which has robust grouping and item rendering capabilities) for the core visualizer, overlaying custom handoff indicators. We will also implement a local-storage based annotation layer for audit notes.

## Proposed Changes
### Project Setup
- **Initialize Next.js App:** `npx create-next-app sprint-handoff -y --typescript --tailwind --eslint --app --src-dir --import-alias "@/*" --use-npm`
- **Dependencies:** Install `vis-timeline` and `moment` (or `date-fns`), `lucide-react` for icons, `clsx`, `tailwind-merge` for styling.

### Data Layer
#### [NEW] `src/lib/types.ts`
- Define types: `SprintLogEvent` (raw form), `ProcessedTaskSpan`, `AuditNote`.

#### [NEW] `src/lib/data-processor.ts`
- Function to parse chronological logs.
- Logic: Group logs by `taskId`. Order chronologically. A person holds a task from their assignment time until the next assignment time or 'Done' status time.

#### [NEW] `src/hooks/useSprintData.ts`
- Fetch from `GOOGLE_APPS_SCRIPT_URL` placeholder.
- Provide loading/error states and processed timeline data (groups for personnel, items for task spans).

#### [NEW] `src/hooks/useAuditNotes.ts`
- Manage notes in `localStorage` keyed by `${taskId}-${timestamp}`.

### UI Components
#### [NEW] `src/components/TimelineView.tsx`
- Integrate `vis-timeline`.
- **Y-Axis (Groups):** Personnel derived from processed data.
- **X-Axis (Time):** Configured via timeline options.
- **Items:** Task blocks colored dynamically by `sprintGoal`.
- **Handoffs (Connecting Lines):** Draw an SVG overlay on top of the timeline reacting to timeline scroll/zoom events to connect consecutive task spans of the same `taskId`.
- **Interactions:** OnClick event on items or gap lines to open the Audit Note modal. Indicators for existing notes.

#### [NEW] `src/components/AuditNoteModal.tsx`
- Modal dialog revealing raw log details and a `<textarea>` to add/update audit notes via `useAuditNotes`.

#### [NEW] `src/components/TopBar.tsx`
- Header with filters (Sprint dropdown, Module dropdown).

#### [MODIFY] `src/app/page.tsx`
- Assemble `TopBar`, `TimelineView`, and `AuditNoteModal`. Keep dark mode by default (`className="dark"` on `html` or root). 

## Verification Plan
### Automated Verification
- Next.js build: run `npm run build` to ensure no TS errors.
- Unit Testing (Optional but good): Test the `data-processor.ts` logic with mock chronological logs to ensure duration overlap and gaps are computed accurately.

### Manual Verification
- Start Next.js with `npm run dev`.
- Provide a mock JSON array simulating the Apps Script response.
- Visually verify:
  - Timeline groups by Person.
  - Task blocks have correct start/end times.
  - Colors distinct by `sprintGoal`.
  - Handoff lines draw correctly between people for the same task.
  - Clicking opens the modal, saving a note persists it across reloads.
