# Task Checklist: v3.0 Migration

## Phase 1: Microsoft Agent Framework Migration
- [ ] **Install Dependencies**: `semantic-kernel` and configured environment.
- [ ] **Kernel Initialization**: Create `KernelFactory` to load Gemini.
- [ ] **MCP Bridge**: Implement the adapter to load MCP tools into the Kernel.
- [ ] **Refactor Orchestrator**: Update `orchestrator.py` to use `Kernel.invoke`.
- [ ] **Verify Basic Search**: Ensure the "Research" agent still works via the Kernel.

## Phase 2: Infinite Canvas Core
- [ ] **Paste Logic**: Handle pasting URLs/Text on Canvas.
- [ ] **Node Ingestion**: Backend endpoints to process pasted content.
- [ ] **Rich Node Components**: `LinkNode`, `NoteNode` UI.

## Phase 3: Context & RAG
- [ ] **Memory Setup**: Initialize Vector store.
- [ ] **Context Chat Endpoint**: Chat using selected nodes.

## Phase 4: Polish
- [ ] **Glassmorphism UI**: Refine CSS.
- [ ] **Animations**: Framer Motion integration.
