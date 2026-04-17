# Sprint Debugger: Workflow Anatomy, Bottleneck Detection & PM Use Cases

Implement workflow status awareness, doom loop detection, and three PM use cases (Personnel Overview, Interrogation Log, Priority Whisperer) into the existing Sprint Relay Debugger app.

## Proposed Changes

### Data Layer

#### [MODIFY] [types.ts](file:///c:/Users/Admin/Desktop/Sprintdebug/sprint-relay/src/lib/types.ts)
- Add `WorkflowStatus` enum (0–9: Not Started → Completed)
- Add `TaskAnalysis` interface: `{ taskId, reprocessCount, doomLoopCount, riskLevel, isStale, currentStatus, statusHistory }`
- Add `InterrogationLogEntry` interface: `{ id, taskId, timestamp, text }`
- Add `PersonSummary` interface for the personnel overview: `{ person, tasks, blockingTasks, staleTasks, suggestion }`

---

### Workflow Engine [NEW]

#### [NEW] [workflow-engine.ts](file:///c:/Users/Admin/Desktop/Sprintdebug/sprint-relay/src/lib/workflow-engine.ts)
Core analysis engine with pure functions:
- **Status constants** — Map status strings to indices 0–9 with bottleneck metadata (isBottleneck, severity)
- **`analyzeTask(logs: RawLogEvent[])`** — For a single task's chronological logs, compute:
  - `reprocessCount` — number of times task entered "Reprocess" status
  - `doomLoopDetected` — true if Reprocess→Ready for Test→Testing→Reprocess cycle detected
  - `riskLevel` — `'normal' | 'elevated' | 'critical'` based on reprocess count (>1 = elevated, >2 = critical)
  - `isStale` — true if the latest status change was >24h ago and task is not Completed
  - `currentStatus` — latest status string
  - `statusHistory` — ordered array of `{ status, timestamp }`
- **`analyzeAllTasks(logs: RawLogEvent[])`** — Groups by taskId, returns `Record<taskId, TaskAnalysis>`
- **`getPersonSummaries(logs, analyses)`** — Groups tasks by person, computes blocking/stale task counts, generates priority suggestion text
- **`generateSuggestion(personTasks, analyses)`** — Rules engine: if any task in Reprocess(7) or Waiting to Integrate(3), suggest clearing blocking tasks before pulling new work
- **`isBottleneckStatus(status)`** — Returns true for statuses 3 (Waiting to Integrate), 4 (Reviewing), 7 (Reprocess)

---

### Hooks

#### [NEW] [useHighRisk.ts](file:///c:/Users/Admin/Desktop/Sprintdebug/sprint-relay/src/lib/hooks/useHighRisk.ts)
- localStorage-backed hook for manually flagged high-risk task IDs
- `{ highRiskIds, toggleHighRisk, isHighRisk }`

#### [NEW] [useInterrogationLog.ts](file:///c:/Users/Admin/Desktop/Sprintdebug/sprint-relay/src/lib/hooks/useInterrogationLog.ts)
- localStorage-backed hook for timestamped log entries per task
- `{ logs, addLogEntry, getLogsForTask }`

---

### Components

#### [NEW] [PersonnelOverview.tsx](file:///c:/Users/Admin/Desktop/Sprintdebug/sprint-relay/src/components/dashboard/PersonnelOverview.tsx)
**Use Case 1: "Cut the Noise" Standup View**
- Table/card grid grouped by person
- Each person card shows:
  - Current active tasks with status badges
  - Visual highlight (pulsing red/amber border) for tasks in bottleneck states (3, 4, 7)
  - "Stale" badge for tasks unchanged in 24h
  - Priority suggestion alert (Use Case 3) shown as a banner below person name
- Clicking a task opens the task detail pane

#### [NEW] [TaskOverview.tsx](file:///c:/Users/Admin/Desktop/Sprintdebug/sprint-relay/src/components/dashboard/TaskOverview.tsx)
**Use Case 2: "Interrogation Log" Task View**
- Sortable table of all tasks
- High-risk pinned tasks shown at top with a distinct visual treatment
- Each row shows: taskId, taskName, person, current status, doom loop indicator, risk level badge
- Clicking a row opens the enhanced detail pane

#### [MODIFY] [StandupInspector.tsx](file:///c:/Users/Admin/Desktop/Sprintdebug/sprint-relay/src/components/inspector/StandupInspector.tsx)
Enhanced to support Use Case 2:
- Add **Interrogation Log** section: timestamped text input, "Add Entry" button, scrollable log history
- Add **High Risk toggle** switch at top of panel
- Show **Doom Loop indicator** with visual escalation (cycle count badge, color escalation)
- Show **Status history** timeline within the panel
- Keep existing standup notes functionality intact

#### [MODIFY] [PersonnelSwimlane.tsx](file:///c:/Users/Admin/Desktop/Sprintdebug/sprint-relay/src/components/timeline/PersonnelSwimlane.tsx)
- Color-code segments by **bottleneck severity** instead of only module:
  - Bottleneck statuses (3, 4): amber pulsing border
  - Major bottleneck (7 - Reprocess): red pulsing border with hatch pattern
  - Doom loop tasks: escalating glow (orange → red → magenta based on cycle count)
- Show doom loop count badge overlay on affected segments

#### [NEW] [WorkflowLegend.tsx](file:///c:/Users/Admin/Desktop/Sprintdebug/sprint-relay/src/components/dashboard/WorkflowLegend.tsx)
- Updated legend showing all 10 workflow statuses with bottleneck indicators
- Doom loop visual explanation

---

### Main Page

#### [MODIFY] [page.tsx](file:///c:/Users/Admin/Desktop/Sprintdebug/sprint-relay/src/app/page.tsx)
- Add tab navigation: **Personnel Overview** | **Task Overview** | **Timeline** (existing swimlane)
- Run workflow engine on loaded data to produce `TaskAnalysis` map
- Pass analyses + high-risk data to child components
- Accept `taskId` click events from all views to open the enhanced inspector
- Show pinned high-risk tasks banner at top when in Task Overview

#### [MODIFY] [globals.css](file:///c:/Users/Admin/Desktop/Sprintdebug/sprint-relay/src/app/globals.css)
- Add keyframe animations for bottleneck pulse effects
- Add doom loop escalation glow styles

---

## Verification Plan

### Browser Testing
Since this is a UI-heavy feature with live data from Google Apps Script, I will verify using the browser tool:
1. Navigate to `http://localhost:3000`
2. Verify the tab navigation renders and switches between Personnel Overview, Task Overview, and Timeline views
3. Verify bottleneck status highlighting appears on tasks in states 3, 4, 7
4. Verify doom loop detection escalates visual indicators for tasks that have hit Reprocess multiple times
5. Click a task to open the inspector and verify the interrogation log input, high-risk toggle, and status history are present
6. Add an interrogation log entry, toggle high-risk, and verify persistence after page reload
7. Verify priority suggestion alerts appear next to personnel with blocking tasks
8. Take screenshots to document final state
