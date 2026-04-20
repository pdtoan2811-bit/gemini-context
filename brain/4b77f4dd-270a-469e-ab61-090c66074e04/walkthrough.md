# Universal Search & RAG Walkthrough

## Overview
The **Universal Search** feature allows Nexus to query the web using Google's Programmable Search Engine to answer user questions with up-to-date information, while also retrieving context from the local Knowledge Graph.

## Configuration
- **Engine**: Google Programmable Search Engine (CX: `61282f7fb738c4a1c`)
- **API Key**: Uses a standard Google Cloud API Key (Dual-configured for Custom Search API and Gemini API).
- **Frontend**: Toggled via the "Globe" icon in the chat bar.

## Architecture
1.  **Frontend**:
    - `api.js` points to `http://localhost:8000/api/v2`.
    - `isUniversalMode` flag routes chat to `/api/v2/chat/universal`.
2.  **Backend**:
    - `SearchAgent.py`: Prioritizes API-based search using `GOOGLE_CX` and `GOOGLE_API_KEY`.
    - `ChatBridge.py`:
        - Performs Search.
        - Ingests results as temporary nodes.
        - Retrieves local graph context.
        - Generates answer using `gemini-2.5-flash`.
        - **Robustness**: Includes try/except blocks to gracefully handle API limits or key errors.

## Troubleshooting
- **Network Error**: Usually caused by Port Mismatch (Frontend talking to 8002 instead of 8000). Fixed in `vite.config.js` and `api.js`.
- **500 Error**: Caused by Invalid API Key. Check `.env` and restart backend.

## Usage
1.  Click the **Globe** icon (turns Blue).
2.  Type a query (e.g., "Best smartphone 2025").
3.  Nexus searches Google, reads the top results, and answers with citations `[Source](url)`.
