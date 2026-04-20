# Implementation Plan - Project SpecOps

## Goal Description
Build "Project SpecOps," an adversarial design sparring partner. It takes a raw idea and subjects it to a critique loop by AI agents (Strategist, Architect) before generating a polished PRD.
**Key Feature**: Real-time visibility into the "war room" (agent thoughts) and a living document that updates as they decide things.

## User Review Required
> [!IMPORTANT]
> **CrewAI Architecture**: We will use a custom loop wrapping CrewAI tasks to ensure we can stream "thoughts" via WebSockets effectively. Pure `Process.hierarchical` can be opaque with streaming, so we might implement a custom callback handler to push updates to the generic WebSocket.

## Proposed Changes

### Structure
The project will be a monorepo-style setup in `c:\Users\ADMIN\Desktop\crewai`:
- `backend/`: Python/FastAPI/CrewAI
- `frontend/`: Next.js/React

### Backend (`backend/`)

#### [NEW] [main.py](file:///c:/Users/ADMIN/Desktop/crewai/backend/main.py)
- FastAPI entry point.
- WebSocket endpoint `/ws/{client_id}` to handle bi-directional communication (User interrupts, Agent streams).

#### [NEW] [agents.py](file:///c:/Users/ADMIN/Desktop/crewai/backend/agents.py)
- Definitions for:
    - `Strategist`: The Skeptic (High Temp).
    - `Architect`: The Builder (Low Temp).
    - `Manager`: The Bridge.

#### [NEW] [crew_orchestrator.py](file:///c:/Users/ADMIN/Desktop/crewai/backend/crew_orchestrator.py)
- Manages the CrewAI execution.
- Defines Custom Callback implementation to stream `on_tool_start`, `on_text`, etc., to the WebSocket.

### Frontend (`frontend/`)

#### [NEW] [page.tsx](file:///c:/Users/ADMIN/Desktop/crewai/frontend/app/page.tsx)
- Main entry point.
- Implements the Split-Pane layout.

#### [NEW] [components/WarRoom.tsx](file:///c:/Users/ADMIN/Desktop/crewai/frontend/components/WarRoom.tsx)
- Renders the streaming logs of the agents.
- props: `messages: AgentLog[]`

#### [NEW] [components/LivingDoc.tsx](file:///c:/Users/ADMIN/Desktop/crewai/frontend/components/LivingDoc.tsx)
- Renders the Markdown PRD.
- Auto-scrolls?

#### [NEW] [lib/socket.ts](file:///c:/Users/ADMIN/Desktop/crewai/frontend/lib/socket.ts)
- WebSocket connection logic.

## Verification Plan

### Automated Tests
- None planned for MVP P0.

### Manual Verification
1.  **Startup**: Run backend (`uvicorn`) and frontend (`npm run dev`).
2.  **Connection**: Open localhost:3000, check if WS connects (green indicator).
3.  **Flow**:
    - Input: "Uber for Dog Walking".
    - Observe "War Room": Strategist should roast the liability.
    - Observe "Living Doc": Sections should start appearing (Vision, Risks, Stories).
    - Interrupt: Click "Stop" during generation.
