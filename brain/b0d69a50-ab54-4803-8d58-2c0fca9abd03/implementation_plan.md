# CanvasMind v2 Implementation Plan

## Goal Description
Enhance CanvasMind with "Advanced Agent Capabilities". This includes dynamic agent monitoring, deep/search-based content generation, and direct URL ingestion from the canvas.

## User Review Required
> [!IMPORTANT]
> **Search Provider**: I will implement a standard search tool interface. If "real" Google/Bing search is required, API keys will be needed. For now, I will simulate "Advanced Search" or use a free alternative (e.g., DuckDuckGo) if available in the installed packages, or fall back to high-quality LLM hallucination (strictly for "demo" purposes if keys aren't present).
> **URL Scraping**: This requires `beautifulsoup4` and `requests`.

## Proposed Changes

### Backend
#### [MODIFY] `models.py`
- Update `Node` model to include `thumbnail: Optional[str]` and `source_url: Optional[str]`.

#### [NEW] `tools.py`
- Implement `WebScraperTool`: Uses `BeautifulSoup` to extract text.
- Implement `SearchTool`: Interface for online search.

#### [MODIFY] `agents.py`
- **Refactor**: Create a base `AgentRegistry` to track active agents.
- **New Agent**: `IngestionAgent`. Specialized instructions: "Read raw HTML text, remove navigation/ads, rewrite into clean Markdown/Graph, DO NOT change meaning."
- **Update**: `GraphAgent`. Give it access to `SearchTool`. Update prompt to use "Online Sources" when answering.

#### [MODIFY] `server.py`
- Add `GET /agents` endpoint (Reads from Registry).
- Add `POST /ingest` endpoint (Triggers `IngestionAgent`).

### Frontend
#### [MODIFY] `App.tsx`
- Add `onPaste` handler to `div` wrapping the canvas.
- Detect URL -> Call `/ingest` -> Add resulting nodes to graph.

#### [MODIFY] `ConceptNode.tsx`
- Add `img` tag for thumbnail if present in data.
- Add small "Source" icon/link.

#### [NEW] `components/AgentMonitor.tsx`
- Small floating widget (top-right?) listing active agents.
- Polling or static list from `/agents`.

## Verification Plan
### Automated Tests
- Test `/ingest` with a sample URL.
- Test `/agents` returns the list.
### Manual Verification
- Paste a URL onto the canvas. Verify a new node appears with "Clean Markdown" content.
- Ask a question requiring outside knowledge. Verify "Search" is triggered (if keys provided) or response implies search depth.
- Check "Agent Monitor" UI sees the agents.
