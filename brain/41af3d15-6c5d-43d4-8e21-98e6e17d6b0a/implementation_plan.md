# Implementation Plan: NextStep v3.0

## Goal
Pivot the existing "Maestro" architecture to use the **Microsoft Agent Framework (Semantic Kernel)** as the orchestration engine, enabling better RAG, planning, and robustness. Simultaneously, upgrade the Frontend to an "Infinite Canvas" experience.

## Phase 1: The Core Refactor (Backend)
**Objective**: Replace the custom `MaestroOrchestrator` with Microsoft Semantic Kernel.

- [ ] **Dependencies**: Install `semantic-kernel`, `google-generativeai`.
- [ ] **Kernel Setup**: Create `backend/kernel/setup.py` to initialize the Kernel with Gemini.
- [ ] **MCP Bridge**: Implement `MCPPlugin` that dynamically converts MCP Tools into Kernel Functions.
- [ ] **Orchestrator**: Rewrite `orchestrator.py` to use `Kernel` for executing plans.
- [ ] **Verify**: Ensure "Research" flow works using the new Kernel backend.

## Phase 2: The Infinite Canvas (Frontend)
**Objective**: Enable "Paste-to-Node" and "Glassmorphism" UI.

- [ ] **Paste Handler**: Implement global paste listener in `Canvas.tsx`.
    - [ ] Detect URL -> Create `LinkNode`.
    - [ ] Detect Text -> Create `NoteNode`.
    - [ ] Detect Image -> Create `ImageNode`.
- [ ] **Data Ingestion**: Create backend endpoints to accept these pasted inputs and process them (e.g., scrape URL).
- [ ] **Node Types**: Create specialized React components for `LinkNode` (preview), `VideoNode` (embed), `PDFNode`.
- [ ] **Selection Context**: Implement "Lasso" selection and global "Selected Items" state.

## Phase 3: RAG & Context (Memory)
**Objective**: "Razor Sharp" context management.

- [ ] **Vector Store**: Integrate a local vector DB (Simple Volatile memory or ChromaLite) via Kernel Memory.
- [ ] **Ingestion Pipeline**: When content is added to canvas, chunk and vectorize it.
- [ ] **Context Chat**: Update `generate_reply` to look at `selected_node_ids`, fetch their memory chunks, and stuff context.

## Phase 4: The Agent Playlist & Visuals
**Objective**: Visual management and reproducibility.

- [ ] **Playlist UI**: Visualize the Kernel's `Plan` object as a list of steps.
- [ ] **Visual MCP**: Create a "Settings" or "Marketplace" panel to toggle MCP servers.
- [ ] **Animations**: Polish transitions using Framer Motion.

## Verification
- **Test 1**: Paste a Wikipedia URL. Node appears. Content is scraped.
- **Test 2**: Select the Node. Ask "Summarize this". Agent replies using *only* that page.
- **Test 3**: Ask "Research competitors". Kernel creates a multi-step plan and executes it via Google Search MCP.
