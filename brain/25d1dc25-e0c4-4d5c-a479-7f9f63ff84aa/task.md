# Task: Implement Prompt Configuration UI

- [x] Planning
    - [x] Create implementation plan <!-- id: 0 -->
    - [x] Review plan with user <!-- id: 1 -->
- [x] Backend Implementation <!-- id: 2 -->
    - [x] Extract prompts to `backend/data/prompts.json` <!-- id: 3 -->
    - [x] Create `PromptService` to manage prompt I/O <!-- id: 4 -->
    - [x] Refactor `chains.py` to use dynamic prompts <!-- id: 5 -->
    - [x] Add API endpoints (`GET /api/prompts`, `POST /api/prompts`) in `main.py` <!-- id: 6 -->
- [x] Frontend Implementation <!-- id: 7 -->
    - [x] Create API client functions for prompts <!-- id: 8 -->
    - [x] Create Prompt Configuration Page (`/prompts`) <!-- id: 9 -->
    - [x] Add navigation to the new page <!-- id: 10 -->
- [x] Verification <!-- id: 11 -->
    - [x] Verify prompts are loaded from JSON <!-- id: 12 -->
    - [x] Verify UI updates reflect in backend JSON <!-- id: 13 -->
    - [x] Run chains to ensure they still work with loaded prompts <!-- id: 14 -->
