# Walkthrough - DataToCharts Web UI

I have built a complete, modern Web UI for your CrewAI agent.

## Features
- **FastAPI Backend**: Wraps your CrewAI agent (`src/data_to_charts_automation/api.py`).
- **Modern React UI**: Built with Vite + Tailwind CSS.
- **Dual Input Modes**:
    1.  **Text Mode**: Paste essays, reports, or raw text.
    2.  **File Mode**: Upload CSV files for analysis.
- **Premium Design**: Dark mode, glassmorphism effects, and smooth animations.

## How to Run

1.  **Double-click** `run_app.bat` in the project root.
    - This will open two terminal windows (Backend & Frontend).
2.  Open your browser to `http://localhost:5173`.

## Verification Results
- **Dependencies**: Installed `fastapi`, `uvicorn`, `python-multipart` (Python) and `tailwindcss`, `lucide-react` (Node).
- **Backend**: Verified `api.py` handles both form text and file uploads.
- **Frontend**: Verified `CommandCenter` component sends correct requests to `http://localhost:8000/analyze`.

## Next Steps
- The agent currently uses `gemini-2.5-flash` as requested.
- Ensure your `OPENAI_API_KEY` (or Google key if using Gemini via OpenAI shim) is set in `.env` or environment variables for the agent to work.
