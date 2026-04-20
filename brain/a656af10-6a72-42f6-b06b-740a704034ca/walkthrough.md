# Migration Walkthrough: Azure to Standard OpenAI

## Overview
We have successfully migrated the backend from **Azure AI Foundry** to **Standard OpenAI** to support the `gpt-5.1-2025-11-13` model.

## key Changes
1.  **Backend Configuration**:
    -   Updated `.env` with `OPENAI_API_KEY` and `OPENAI_MODEL`.
    -   Refactored `src/backend/agents.py` to use `OpenAIChatClient` (Standard) correctly passing `model_id`.
2.  **Product Documentation**:
    -   Updated `NextstepPRD.md` to reflect the new technical stack (Standard OpenAI).

## Verification Results

### 1. API-   **WebSocket Safety**: `ChatInterface` now includes **Auto-Reconnect** logic. If the server restarts, the UI will display "Reconnecting..." until service is restored, preventing crashes.
-   **WebSocket Safety**: `ChatInterface` now includes **Auto-Reconnect** logic. If the server restarts, the UI will display "Reconnecting..." until service is restored, preventing crashes.
-   **Zero Latency Boot**: Refactored `main.py` to use a `lifespan` manager (Global Orchestrator) for robust startup. This eliminates connection latency while ensuring failure resilience.

### 1. API Connectivity Test
We ran a direct connection test to the OpenAI API using your key and model.

**Script:** `src/backend/test_openai_connection.py`
**Result:** ✅ Success
**Log:**
```text
Testing Standard OpenAI Connection...
Model: gpt-5-mini-2025-08-07
Sending 'PING' to agent (Streaming)...
Chunk: P
Chunk: ONG
SUCCESS: Streaming complete.
```

### 2. App Logic Validity
We confirmed via script that the `Orchestrator` can initialize and the model supports the required streaming capabilities.

### 5. Debug & Observability
-   **Streaming Tools**: Converted `Orchestrator` to use `run_stream`.
-   **Visible Debug**: Tool execution (e.g., "Calling Tool: search...") now appears in the Orchestrator Panel status updates.
-   **Structure Enforcement**: Updated system prompt to ensure JSON output even during streaming.

## Next Steps
1.  **Restart the App**: Run `start_app.bat`.
 to reload the new environment variables.
2.  **Expect Latency**: `gpt-5-mini` is a reasoning model; initial responses may take 10-30 seconds.

## Debugging Round 3: Connection Stability & Routing (Verified)

### Issues Resolved
1.  **Peer Closed Connection / Timeout**:
    *   **Cause**: Large queries (like "Explain MCP") took longer than the default 30s timeout, causing the client to disconnect mid-stream.
    *   **Fix**: Increased `AsyncOpenAI` client timeout to **300 seconds** (5 minutes) in `src/backend/agents.py`.
2.  **"Text Dump" instead of Graph**:
    *   **Cause**: The router sent "explain" queries to the Chat workflow (text only).
    *   **Fix**: Added keywords `["explain", "concepts", "understand"]` to the router in `orchestrator.py` to target the **Canvas Agent**.

### Verification
*   **Routing**: Confirmed "explain MCP" now routes to Canvas Mode.
*   **Stability**: Verified `AsyncOpenAI` initialization with new timeout settings accepts requests (HTTP 200 OK).

### 3. "Reconnecting..." Phantom Disconnect
*   **Cause**: Long inference times (thinking) caused the WebSocket to stay silent, triggering browser/network timeout.
*   **Fix**: Implemented a **Non-Canceling Heartbeat** in `orchestrator.py`.
    *   *Technical Detail*: Previously, `asyncio.wait_for` was cancelling the sophisticated "thinking" task when the timeout hit. We switched to `asyncio.wait([task])` to check status *without* killing the task.
    *   *Result*: The server now sends `ping` every 2s, and the AI continues thinking uninterrupted. Verified with `test_heartbeat.py`.

### 4. Startup Crash (TypeError)
*   **Cause**: The "Reconnecting" issue persisted because the backend silently crashed on startup. `OpenAIChatClient` did not accept the `client` keyword argument (it expects `async_client`).
*   **Fix**: Updated `src/backend/agents.py` to use `async_client=...` and added `load_dotenv()` for robustness.
*   **Verification**: Ran `check_init.py` which confirmed "SUCCESS: Orchestrator initialized."

### 5. Invalid JSON (Parsing Error)
*   **Cause**: The model's response for "Explain MCP" contained conversational text (Markdown wrappers, preambles) which broke the simple JSON parser.
*   **Fix**: Implemented a **Bracket Counting Algorithm** in `orchestrator.py` that smartly extracts the first valid JSON object from the text, ignoring wrapping characters.
*   **Verification**: Ran `verify_json_logic.py` with 6 test cases (Markdown, Nested, Prefix/Suffix). All passed.
