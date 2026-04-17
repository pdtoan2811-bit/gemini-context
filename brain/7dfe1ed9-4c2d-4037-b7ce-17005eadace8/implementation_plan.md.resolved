# Bento Grid Dark Mode Contrast Fix (Part 2)

The goal is to fix text visibility issues in the Bento Grid animations by correcting the usage of the project's custom (inverted) neutral color scale and deepening the dark mode background.

## User Review Required

> [!IMPORTANT]
> I discovered that this project's dark theme uses a custom **inverted neutral scale** (e.g., `neutral-950` is White and `neutral-100` is Black). My previous fixes used standard Tailwind naming, which inadvertently made the text darker. I will now correct this to use the proper high-contrast values.

## Proposed Changes

### [Global CSS] Background and Theme Consistency

I will modify `globals.css` to ensure a consistent pitch-black experience.

#### [MODIFY] [globals.css](file:///c:/Users/Admin/Desktop/prod-2-adecos/src/app/globals.css)
- Update `:root:not(.light)` media query to use `--background: #000000` instead of `#0f0f0f` to ensure high contrast even when theme toggling is handled by the browser preference.

### [Component] Landing Features Contrast Fix

I will modify `LandingFeatures.tsx` to use the correct neutral values for dark mode.

#### [MODIFY] [LandingFeatures.tsx](file:///c:/Users/Admin/Desktop/prod-2-adecos/src/containers/landing/LandingFeatures.tsx)
- **AI Agent Animation**:
    - `chartSubtitle` ("CPC AI SaaS"): change `dark:text-neutral-400` to `dark:text-neutral-800` (Light Gray).
    - Chart X-axis labels ("T2, T3... CN"): change `dark:text-neutral-300` to `dark:text-neutral-800` (Light Gray).
- **Deep Research Animation**:
    - Research logs: change `dark:text-neutral-200` to `dark:text-neutral-900` (Near White).
    - Status badges: Ensure text is `dark:text-neutral-950` (Pure White) where needed.
- **Analytics Animation**:
    - KPI labels: Ensure headers and sub-headers use `dark:text-neutral-600` or higher for better contrast.

## Open Questions

- Should the overall section background be pure black (`#000000`) or "Vercel Black" (`#0a0a0a`)? I am currently opting for pure black to maximize the "pitch black" premium feel you requested.

## Verification Plan

### Manual Verification
- I will use the browser tool to confirm that `neutral-800/900` in dark mode actually results in light/white text.
- I will verify that the specific strings ("Đang quét...", "T2/T3", "CPC AI SaaS") are vividly readable in dark mode.
