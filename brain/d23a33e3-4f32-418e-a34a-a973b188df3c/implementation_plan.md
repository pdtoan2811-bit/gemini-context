# Implementation Plan - Structured JSON Side Generation

## Problem Reference
The current Markdown-based slide generation is fragile and relies on regex parsing (`---` delimiters), which often fails with AI models. We need to implement a robust structured data model (JSON) as required by the SRS updates.

## User Review Required
> [!IMPORTANT]
> This change modifies the internal data format returned by the AI. Ensure that the consuming components (`App.js` or `SlideViewer`) are capable of handling the `Slide[]` object directly (which they seem to do already via the parser, but we are bypassing the parser).

## Proposed Changes

### [Service Layer]
#### [MODIFY] [gemini.js](file:///c:/Users/ADMIN/Desktop/ai_slides_shows/src/services/gemini.js)
- Update `SYSTEM_PROMPT` to enforce JSON array output.
- Remove `parseMarkdownToSlides` call for the initial generation.
- Implement JSON parsing with error handling (handling potential markdown code block wrappers).

## Verification Plan

### Manual Verification
1.  **Generate Slides**:
    -   Run the app (User to verify).
    -   Enter a prompt (e.g., "Plan a marketing strategy").
    -   Verify that slides are generated correctly with Titles and Content separated.
    -   Verify that no "split" errors occur (common with the old parser).
2.  **Console Output**:
    -   Check console logs for "Raw AI JSON" to confirm structure.
