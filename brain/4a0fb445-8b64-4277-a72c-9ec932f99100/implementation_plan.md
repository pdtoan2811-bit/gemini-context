# Elegant Typography Implementation Plan

Introduction of **Lora** (serif) for headings and **Inter** (sans-serif) for body text to create an elegant typographic hierarchy with full Vietnamese support.

## User Review Required

> [!NOTE]
> I've chosen **Lora** as the serif font because it's highly elegant and has excellent Vietnamese support. **Inter** will remain the primary sans-serif font for body text to ensure maximum legibility.

Please let me know if you prefer a different serif font (like *Playfair Display* for more drama) or if you want certain specific elements to be serif.

## Proposed Changes

### Core Styles

#### [MODIFY] [layout.tsx](file:///c:/Users/Admin/Desktop/Sprintdebug/sprint-relay/src/app/layout.tsx)
- Import `Lora` from `next/font/google` with `vietnamese` subset.
- Define `--font-lora` variable and apply it to the `body` class list.

#### [MODIFY] [globals.css](file:///c:/Users/Admin/Desktop/Sprintdebug/sprint-relay/src/app/globals.css)
- Add `--font-serif: var(--font-lora)` to the `@theme` block.
- Update global heading styles (`h1` through `h6`) to use the serif font.
- Ensure `body` continues to use the sans-serif font for readability.

### Component Refinement

#### [MODIFY] [Any specific components](file:///c:/Users/Admin/Desktop/Sprintdebug/sprint-relay/src/components/...)
- Review components like `DailyMeetingView`, `NextSprintPlanningView` to ensure titles look good with the new serif font.
- Specifically, the main page titles or modal headers might benefit from the serif treatment.

## Verification Plan

### Manual Verification
- Run `npm run dev` (already running).
- Use the browser tool to navigate to `http://localhost:3000/`.
- Verify that headings (`h1`, `h2`, etc.) are rendered in the elegant serif font (Lora).
- Verify that body text remains in the clean sans-serif font (Inter).
- Check for any Vietnamese character rendering issues (ensure no fallback fonts are used).
- Take screenshots of the 'Daily Meeting View' and 'Next Sprint Planning View' to confirm the aesthetic improvement.
