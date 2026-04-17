# Replace Testimonial Section with Use Cases

Since the Adecos platform currently does not have real customers or partner brands, displaying a dummy Testimonial and Partner Brands section is misleading. We will replace it with a new `LandingUseCases` section that outlines what users can do on the platform. 

This plan leverages the pre-existing translation keys (`landing.useCases`) found in the `en` and `vi` locale configurations so that dual language support is seamlessly maintained.

## Proposed Changes

### `src/containers/landing/LandingUseCases.tsx`
- **[NEW]** Create a new premium, high-fidelity `LandingUseCases` component.
- Implement an animated timeline or interactive card layout highlighting the 5 key workflows in Adecos AI.
- Utilize Framer Motion for smooth scroll-based animations, matching the dark mode and glassmorphism styling of the rest of the page.
- Integrate `next-intl` hooks to fetch the `landing.useCases` keys to ensure English and Vietnamese versions render correctly.

### `src/app/[locale]/(landing)/page.tsx`
- **[MODIFY]** Remove the `<LandingTestimonial />` import and component instance.
- **[MODIFY]** Inject the new `<LandingUseCases />` component exactly where the testimonials were, maintaining the overall page flow.

## Open Questions

> [!IMPORTANT]  
> Are there any specific animations you want for the Use Cases section (like a vertical animated timeline, or a masonry grid pattern)? If not, I will design a modern interactive vertical checklist that glows as the user scrolls.

> [!WARNING]  
> There is also an unused `LandingWhatWeDo` component in the codebase. However, its copy overlaps significantly with the existing `LandingFeatures` section (AI Agent, Deep Research, Analytics). I assume `LandingUseCases` (which focuses on active tasks like "Find top affiliate programs") is the better replacement here. Let me know if you would rather use `LandingWhatWeDo` instead!

## Verification Plan

### Automated/Manual Verification
- Verify that the `LandingUseCases` section renders beautifully in both Light and Dark modes.
- Toggle between English and Vietnamese on `localhost:3000/en` and `localhost:3000/vi` to ensure all 5 use case strings translate seamlessly.
- Verify that the page loads without layout shifts or Framer Motion animation bugs.
