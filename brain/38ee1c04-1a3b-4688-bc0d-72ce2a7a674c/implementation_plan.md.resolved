# Terms and Conditions Page Implementation Plan

This plan aims to implement the "Terms and Conditions" page as part of the Adecos Landing section. The page is required by Google for application assessment, fully supporting English and Vietnamese via i18n, and fully supporting Light and Dark modes.

## User Global Rules Compliance ("No Spec, No Service")

To adhere to the user's explicit directive to synchronize Truth and Code:
1. **Update `docs/landing-content.md`**: Instantiate the exact text structures for the terms and conditions.
2. **Update `adecos mvp/docs/PRD.md`**: Emphasize the UI Specifications (spacing, typography parameters) for the new page.

## User Review Required

> [!IMPORTANT]
> The text included in this plan is primarily standard legal boilerplate adapted for Adecos (an AI-powered SaaS). Please review if any specific clauses for Adecos must be added before deploying it to production.

## Proposed Changes

---

### Specifications

#### [MODIFY] `c:\Users\ADMIN\Desktop\adecos mvp\docs\PRD.md`
- Append the UI specs for standard legal pages (elegant serif headings, relaxed sans-serif body, `max-w` constraint for readability, glassmorphism UI touch).

#### [MODIFY] `docs/landing-content.md`
- Detail the layout mapping for the legal pages mapping to `landing.terms`. Includes: Introduction, User Accounts, Intellectual Property, Limitation of Liability.

---

### i18n Data (Translations)

#### [MODIFY] `messages/en/client.json`
Append `"terms"` to the `"landing"` object.
- Include standard titles, subtitles, and section content corresponding to the specs.

#### [MODIFY] `messages/vi/client.json`
Append `"terms"` translated blocks to the `"landing"` object.

---

### Components & Pages

#### [NEW] `src/app/[locale]/(landing)/terms/page.tsx`
Create the Server Component for the Terms and Conditions page.
- Layout: Re-uses the main `(landing)/layout.tsx` (has Header & Footer).
- Container: Uses an elegant `<article />` structure using Tailwind 4 (`max-w-4xl`, `mx-auto`, `px-6`, `py-24`).
- Typography: Focuses heavily on high-readability (`leading-8`, `text-lg`, `tracking-tight` on headings).
- Dark/Light mode: Adapts automatically via text-foreground, muted-foreground tailwind utilities.

## Open Questions

> [!WARNING]
> Do we want to include `@tailwindcss/typography` plugin via `npme install` to automatically format the markdown/text blocks, or should I manually craft semantic HTML elements with Tailwind classes? *My current plan proposes manual crafted utility arrays to avoid unnecessary package bloat, since the scope is limited to one page.*

## Verification Plan

### Automated/Code Verifications
- `npm run lint` or `eslint` to ensure no Typescript/Linting errors.
- Verify `next-intl` can successfully resolve the new keys.

### Manual Verification
1. Open up the application landing page.
2. Navigate to `localhost:3000/en/terms` and `localhost:3000/vi/terms`.
3. Toggle between Dark mode and Light mode to ensure visually pleasing typography and correct contrast ratios.
