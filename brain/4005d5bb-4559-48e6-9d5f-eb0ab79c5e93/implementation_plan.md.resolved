# Implementation Plan - UI/UX Overhaul & Agent Flow

# Goal Description
Transform the UI to an "Apple-level" premium aesthetic (Glassmorphism) and implement the "Playlist" visualization where Maestro generates a graph showing *Agents* working together, not just static data.

## User Review Required
> [!IMPORTANT]
> The graph generation logic will change. Instead of just outputting factual nodes (e.g., "Christopher Nolan"), Maestro will now output **Process Nodes** (e.g., "Maestro: Planning", "Researcher: Searching") connected to the data.

## Proposed Changes

### Frontend Design (Premium UI)
#### [MODIFY] [frontend/src/index.css](file:///c:/Users/ADMIN/Desktop/nextstep-ver1/frontend/src/index.css)
- Add global glassmorphism utilities (`.glass-panel`).
- Update fonts to `Inter` (ensure import) or system-ui stack with tight tracking.

#### [MODIFY] [frontend/src/App.jsx](file:///c:/Users/ADMIN/Desktop/nextstep-ver1/frontend/src/App.jsx)
- Redesign layout: Floating Chat Panel (Right), Floating Search (Top Left).
- Remove hard dividers. Use shadows and blurs.

#### [NEW] [frontend/src/components/CustomNodes.jsx](file:///c:/Users/ADMIN/Desktop/nextstep-ver1/frontend/src/components/CustomNodes.jsx)
- **AgentNode**: Icon + Status (Thinking/Done) + Agent Name.
- **DataNode**: Rich content card.
- **PlaylistNode**: Visual container for steps.

### Backend Logic (The Playlist)
#### [MODIFY] [backend/agents/maestro/agent.py](file:///c:/Users/ADMIN/Desktop/nextstep-ver1/backend/agents/maestro/agent.py)
- Update System Prompt to generate a **Meta-Graph**.
- Node Types: `agent_step`, `data_point`.
- Structure: User Node -> Maestro Node -> Researcher Node -> Data Nodes.

## Verification Plan
### Visual Inspection
- Check "Apple" aesthetic: Translucency, border-radius=12px+, subtle borders.
- Run "Research Christopher Nolan":
    - Expect to see a "Maestro" node connected to a "Researcher" node.
    - Expect "Researcher" node connected to "Nolan" data nodes.
