# Deep Research Agent Implementation Plan

## Goal
Transform the simple "Search" feature into a "Deep Research" workflow that:
1.  **Expands** the user's query into multiple semantic search phrases.
2.  **Retrieves** a large volume of unique results (15+).
3.  **Digests** and **Rewrites** the content for quality.
4.  **Connects** the new nodes into the graph automatically.

## Configuration
#### [NEW] [backend/research_config.json](file:///c:/Users/ADMIN/Desktop/nexus-ver3/backend/research_config.json)
- `search_expansion_prompt`: The prompt used to generate search phrases.
- `num_search_queries`: Number of phrases to generate (Default: 3).
- `results_per_query`: Results per phrase (Default: 5).
- `max_total_results`: Cap on total nodes created (Default: 15).
- `rewrite_content`: Boolean to enable LLM summarization of pages.

## Architecture

### 1. Query Expansion (The "Search AI Agent")
- **File**: `backend/core/search_agent.py`
- **Logic**: New method `generate_search_queries(user_prompt)` using Gemini.
- **Input**: "How to build a rocket?"
- **Output**: `["rocket propulsion basics", "model rocket materials guide", "aerodynamics for rocketry"]`

### 2. Deep Search Loop
- **File**: `backend/core/search_agent.py`
- **Logic**: `perform_deep_research(user_prompt)`
- **Flow**:
    1.  Get Queries.
    2.  Parallel/Sequential Search for each using existing `search_google`.
    3.  Deduplicate URLs.
    4.  Fetch Content (Scrape/Parse).

### 3. Ingestion & Connection
- **File**: `backend/core/chat_bridge.py` (Orchestrator)
- **Logic**:
    - Iterate `unique_results`.
    - Create Node (Type: `External Resource`).
    - **Trigger**: `AutoLinker` (Connection Agent) on the batch of new nodes to link them to each other and existing graph.
    - **Return**: Summary for final Chat Answer.

## Proposed Changes
#### [MODIFY] [backend/core/search_agent.py](file:///c:/Users/ADMIN/Desktop/nexus-ver3/backend/core/search_agent.py)
- Import `GoogleGenerativeAI` (already available via `model` injection or fresh init).
- Add `DeepSearch` class or extend `SearchAgent`.

#### [MODIFY] [backend/core/chat_bridge.py](file:///c:/Users/ADMIN/Desktop/nexus-ver3/backend/core/chat_bridge.py)
- Update `perform_universal_chat` to accept a `deep_mode=True` flag (or auto-detect).
- Integrate the loop.

#### [MODIFY] [backend/core/api_agents.py](file:///c:/Users/ADMIN/Desktop/nexus-ver3/backend/core/api_agents.py)
- Ensure `ConnectionAgent` can accept a list of `node_ids` to process in batch.
