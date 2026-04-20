# Intelligent Image Integration Plan

## Goal
Replace the current "round-robin" blind image assignment with an intelligent, AI-driven selection process. This ensures that images crawled from grounded sources are semantically relevant to the specific slide content they are placed on.

## User Review Required
> [!IMPORTANT]
> This change introduces a **second API call** to Gemini for every presentation generation. This will increase latency (~2-3 seconds extra) and token usage.

## Proposed Changes

### `src/services`

#### [MODIFY] [gemini.ts](file:///c:/Users/ADMIN/Desktop/ai_slideshow/src/services/gemini.ts)
- **Refactor `generateSlides`**:
    1.  **Stage 1 (Text)**: Generate initial slide content with grounding (unchanged).
    2.  **Stage 2 (Crawl)**: extract URLs and crawl for images (unchanged).
    3.  **Stage 3 (Fusion - NEW)**:
        - Construct a prompt containing:
            - The generated slides JSON.
            - The simplified list of available image URLs.
        - Call `genAI.getGenerativeModel({ model: 'gemini-2.0-flash-exp' })`.
        - Request the model to map specific URLs to slides based on semantic relevance.
        - Return the "fused" JSON.
    - **Fallback**: Implementing a try/catch block around Stage 3 to revert to round-robin assignment if the fusion step fails (e.g. rate limits or parsing errors).

## Verification Plan

### Manual Verification
1.  **Launch App**: `run_app.bat`.
2.  **Generate Presentation**: Topic "Elon Musk Companies" (this ensures distinct topics per slide like Tesla, SpaceX, X).
3.  **Observe Logs**: Watch the terminal for "Refining image selection with AI..."
4.  **Validate Result**:
    - "Tesla" slide should have a car image.
    - "SpaceX" slide should have a rocket image.
    - Ensure no broken images or completely irrelevant assignments (e.g. Rocket on the Twitter/X slide).
