# Aesthetics Refinement: Dark Mode & Premium Effects

This plan outlines the steps to resolve specific dark mode contrast issues caused by our previous monochromatic update, and to introduce "Hero-matched" premium lighting effects to the Features section.

## User Review Required
> [!IMPORTANT]
> The Hero component uses a `<div />` with a `radial-gradient(..., var(--primary))` and `blur(120px)` to create its subtle spotlight. I plan to introduce a similar, but slightly lower-opacity ambient spotlight to the background of the Bento grid container (`LandingFeatures.tsx`) to pull the design together without overriding the monochrome aesthetic of the cards themselves. I will also upgrade the Bento Box borders to use a soft glassmorphic blend. 
> 
> Please confirm if this ambient primary glow is precisely the "premium effect" you are envisioning.

## Proposed Changes

### `src/containers/landing/LandingFeatures.tsx`

**1. Premium Spotlight Integration (Ambient Hero Effect)**
- Inject a `pointer-events-none` background layer behind the `<BentoGrid>` wrapper.
- Use `radial-gradient(circle at 50% 0%, var(--primary), transparent 60%)` with `opacity-10 dark:opacity-20` and `filter: blur(100px)` to emulate the high-end glowing orb from the Hero banner.
- Apply a slight `backdrop-blur-md` and `bg-card/60` (glassmorphism) to the Bento grid containers to allow the subtle background glow to permeate through the cards professionally.

**2. Dark Mode Contrast Fixes**
The previous monochromatic refactoring accidentally introduced low-contrast situations in dark mode where dark grey text (`neutral-500`) sits heavily on dark grey cards (`neutral-900` or `black`). This will be fixed systematically:
- **AIAgentPreview:** Update `dark:text-neutral-500` in the "Action Plan" tasks to `text-muted-foreground` to ensure sufficient legibility against `dark:bg-neutral-900`. 
- **ProjectManagementPreview:** Enhance the text ratio of the connecting state tabs from `text-neutral-400 dark:bg-neutral-800` to `text-muted-foreground dark:bg-neutral-800/50`.
- **DeepResearchPreview:** Fix the tracking metrics text `text-[9px] text-neutral-500` to `text-muted-foreground`.
- **AnalyticsPreview:** Update the small metric text labels from `text-neutral-500` to `text-muted-foreground`.

## Verification Plan

### Manual Verification
1. Open the landing page and switch the theme toggle to **Dark Mode**.
2. Inspect the "Action Plan" checkboxes, "Analytics" axis texts, and "Project Management" connected states. Confirm the text is clearly readable (high contrast).
3. Scroll from the Hero section down to the Bento boxes. Confirm the subtle primary-color spotlight continues organically behind the bento boxes.
