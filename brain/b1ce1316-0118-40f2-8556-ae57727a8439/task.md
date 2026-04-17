# Sprint Debugger: Workflow Anatomy & Use Cases

## Planning
- [x] Audit existing codebase
- [x] Write implementation plan
- [x] Get user approval

## Execution

### 1. Data Layer & Types
- [x] Define workflow status constants & bottleneck metadata
- [x] Add `TaskAnalysis` type (doom loop count, risk level, reprocess count)
- [x] Add `InterrogationLogEntry` type (timestamped manual notes per task)
- [x] Add `highRisk` flag to task-level localStorage data
- [x] Extend `RawLogEvent` processing with status index mapping

### 2. Workflow Engine (`src/lib/workflow-engine.ts`) [NEW]
- [x] Status-to-index mapping (0-9 statuses)
- [x] Bottleneck classifier (statuses 3, 4, 7)
- [x] Doom loop detector (cycle: Reprocess/Bug Fixing → Ready for Test → Testing → Reprocess)
- [x] Risk level escalation (reprocess count > 1 = escalated risk)
- [x] Staleness detector (tasks unchanged for 24h)
- [x] Priority suggestion rules engine (Use Case 3)

### 3. Personnel Overview (Use Case 1: Standup View)
- [x] Build `PersonnelOverview` component with per-person task grouping
- [x] Show delta/split view: tasks unchanged in 24h flagged
- [x] Visual indicators for bottleneck states (3, 4, 7)
- [x] Priority suggestion alerts next to person names

### 4. Task Overview (Use Case 2: Interrogation Log)
- [x] Enhance `StandupInspector` → full task detail pane
- [x] Add timestamped interrogation log input
- [x] Add "High Risk" toggle switch
- [x] Pin high-risk tasks to top of dashboard
- [x] Persist interrogation logs in localStorage

### 5. Main Dashboard Overhaul
- [x] Add tab navigation: Personnel Overview / Task Overview
- [x] Integrate workflow status legend with bottleneck indicators
- [x] Show doom loop visual escalation on timeline segments
- [x] Show pinned high-risk tasks at top
- [x] Update header with enhanced metadata

### 6. Verification
- [x] Visual browser testing of all three use cases
- [x] Test doom loop detection with sample data
- [x] Test localStorage persistence for notes and high-risk flags
