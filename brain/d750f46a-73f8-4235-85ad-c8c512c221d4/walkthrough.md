# V3 Hybrid System Walkthrough 🚀

You have successfully upgraded to the **Client-First Hybrid Architecture**. This system now runs a local server for parsing, keeping all data flow under your control, and uses the n8n Agent strictly for "Deep Research".

## 1. Start the Local Parser Server (New!)
We created a dedicated Express server to handle URL parsing locally (replacing Jina).
1.  Open a terminal in `flowstep-ver2/server`.
2.  Install dependencies (if you haven't):
    ```bash
    npm install
    ```
3.  Start the server:
    ```bash
    npm start
    ```
    > You should see: `Server-Side Parser running on http://localhost:3001`

## 2. Start the Client
1.  Open a terminal in `flowstep-ver2/client`.
2.  Run the dev server:
    ```bash
    npm run dev
    ```

## 3. Configure n8n Backend
1.  Open your n8n Editor.
2.  Import `agent_workflow_v3_hybrid.json` (Found in your project root).
3.  **Activate** the workflow.
4.  Ensure your `Tavily` and `Gemini` credentials are set in n8n.

## 4. How to Use
### A. Instant "Read Mode"
1.  Paste a URL (e.g., a blog post) into the Client input.
2.  **Wait ~1s**: The generic "Thinking..." UI will appear.
3.  **Result**: The Node appears instantly with a clean summary.
4.  **Click "Read More"** (Maximize Icon on the node):
    *   Opens the **Reader Modal**.
    *   Click **"AI Refine (Make Beautiful)"** to have Gemini strip away footer/menu noise and format it as clean Markdown.

### B. Deep Research (The n8n Agent)
1.  Toggle **"Auto-Deep Expand"** ON (Bottom Right of Input).
2.  Paste a topic or URL.
3.  **Watch**:
    *   Client creates the Seed Node immediately.
    *   Wait a few seconds...
    *   **BOOM**: The n8n Agent (via Webhook) will research the topic using Tavily (Top 2 results) and generate a **MECE** cluster of related nodes.

## Troubleshooting
*   **"Could not fetch content"**: Ensure the Server is running on Port 3001.
*   **n8n errors**: Check the n8n Execution log. Ensure `agent_workflow_v3_hybrid.json` is active.
