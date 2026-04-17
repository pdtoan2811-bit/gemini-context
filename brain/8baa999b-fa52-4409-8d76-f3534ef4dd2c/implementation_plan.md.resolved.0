# Implementation Plan: Project Synthetica MVP

This document outlines the architecture, components, and phases required to develop the MVP for Project Synthetica, a Context Management System designed to extract and structure intelligence from fragmented social media feeds.

## User Review Required

> [!IMPORTANT]
> **Integration Strategy**: Project Synthetica focuses on an entirely separate persona (Strategist/Synthesizer) compared to the current `Adecos` project (E-commerce Ad optimization). Should Project Synthetica be built as a brand new standalone project, or should it be a specialized module integrated into the existing `adecos` ecosystem (reusing the React + FastAPI architecture)? This plan assumes a similar tech stack (React + FastAPI) but awaits confirmation on where the code should live.

## Proposed Architecture & Tech Stack

To meet the demands of rapid AI parsing and dynamic polymorphic views:
- **Frontend**: React (Vite) or Next.js, Framer Motion (for smooth semantic transitions between views), Vanilla CSS / Tailwind.
- **Backend / AI Engine**: Python (FastAPI), LangChain/Agent Framework, LLM (Gemini 3.1 Pro/High).
- **Database**: PostgreSQL (for tracking user topic weights, followed entities, and stored structured insights).

## Proposed Changes / Project Structure

### 1. Ingestion & Prioritization Engine (Data Layer)
The system to capture raw material and prioritize it against user vectors.
- **`[NEW] backend/services/ingestion/`**: Modules to interface with YouTube transcripts (yt-dlp or APIs), Reddit (PRAW), and mock/API integrations for FB/Instagram.
- **`[NEW] backend/services/scoring.py`**: A scoring engine matching incoming content against User-Defined Topic Hierarchies (e.g., *Priority 1: SaaS, Priority 2: AI*).

### 2. The Semantic Refinery (AI Layer)
The engine translating raw "hot takes" into structured intelligence.
- **`[NEW] backend/ai/refinery.py`**: Extracts the core thesis and strips rhetorical fluff.
- **`[NEW] backend/ai/lateral_context.py`**: The "Zoom Out" module, automatically pulling in historical statements from the author or generating macro-economic context.

### 3. Polymorphic Consumption Formats (UI/UX)
The frontend displaying the dynamic, premium interfaces.
- **`[NEW] frontend/src/pages/SyntheticaFeed.jsx`**: Main routing and format mode selector.
- **`[NEW] frontend/src/components/synthetica/NytView.jsx`**: Deep Read mode (long-form editorial layout with sidebars).
- **`[NEW] frontend/src/components/synthetica/InstaScrollView.jsx`**: Glanceable mode (Carousel cards: Quote -> Translation -> Macro Impact).
- **`[NEW] frontend/src/components/synthetica/TiktokTextView.jsx`**: High Velocity mode (Auto-advancing single-screen).

### 4. Context Management API
- **`[NEW] backend/api/routes/rag_export.py`**: Provides the structural JSON (Link, Thesis, Analysis, Timestamp) for users to pipe into external agentic workflows.

## Open Questions

> [!WARNING]
> 1. **Project Location**: Would you like to build this inside the current `adecos` repository (e.g., as a new tab/sub-app) or initialize a completely new workspace/repository?
> 2. **Ingestion Sources for MVP**: Real-time scraping of platforms like X or Facebook is often brittle or blocked without paid enterprise APIs. For Phase 1, would you prefer to mock the incoming data stream, or focus on open platforms like YouTube transcripts / Reddit?
> 3. **Tech Stack**: Do you want to stick with Vite + React SPA, or switch to a framework like Next.js given the content-heavy nature of the NYT View?

## Verification Plan

### Automated Tests
- Test AI structure schemas (Pydantic/LangChain outputs) to guarantee stable JSON parsing for the API mode.
- Mock the ranking system to ensure high-priority topics reliably bubble to the top.

### Manual Verification
- Review the aesthetic and flow of the 3 Polymorphic Views on various screen sizes to ensure the "premium, dynamic design" standard is met.
- Run a live YouTube transcript through the Semantic Refinery to verify the transformation from "rant" to "structured insight".
