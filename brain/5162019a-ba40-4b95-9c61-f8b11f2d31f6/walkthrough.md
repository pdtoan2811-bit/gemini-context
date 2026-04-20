# Content Momentum Engine - Walkthrough

## System Overview
The engine consists of two parts:
1.  **Backend (FastAPI)**: Handles ingestion, Playwright scraping, and LangChain orchestration.
2.  **Frontend (Next.js)**: A premium "Director's Dashboard" for managing content.

## Prerequisites
- **OpenAI API Key**: Ensure `OPENAI_API_KEY` is set in your environment or `.env`.
- **Auth State**: For LinkedIn scraping, ensure `auth.json` is present in `backend/` (or scraping will use public access/fail).

## Startup Instructions

### 1. Start the Backend
Open a terminal in `nexuslite/backend`:
```powershell
cd backend
pip install -r requirements.txt
uvicorn main:app --reload
```
*Server will start at `http://localhost:8000`*

### 2. Start the Frontend
Open a NEW terminal in `nexuslite/frontend`:
```powershell
cd frontend
npm run dev
```
*App will start at `http://localhost:3000`*

## Usage Flow
1.  **Configure**: Click the "Settings" icon (Top Right) to set your Brand Name and Tone.
2.  **Ingest**: Paste a URL or Text in the left column.
3.  **Direct**: Add an "Angle" (e.g., "Roast this").
4.  **Generate**: Click "Ignite Engine".
5.  **Refine**: View and edit the drafts in the center column.
