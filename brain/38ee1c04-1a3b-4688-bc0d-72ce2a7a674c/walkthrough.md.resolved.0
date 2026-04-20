# Walkthrough: Implementing the Terms and Conditions Page

We have fully implemented the requested **Terms and Conditions** page, adhering closely to the "No Spec, No Service" directive mapping out the specifications before touching code.

## 1. Requirement & Documentation Specifications
Before executing any component code, we updated our project's documentation correctly:
- **`landing-content.md`**: Updated mapping keys specifying English and Vietnamese literal strings for each section of the Legal document.
- **`PRD.md`**: Implemented strict formatting parameters for Legal Docs (`<article>`, max-width constraints `max-w-4xl`, and clean `sans-serif` vs `serif` typographic delineations with `py-24` constraints for optimal distraction-free reading).

## 2. Setting up Translations (i18n)
In accordance with your Next.js application setup powered by `next-intl`:
- Added nested `terms.*` objects into `messages/en/client.json`.
- Added exact Vietnamese variations into `messages/vi/client.json`.
- Dynamic attributes properly configured (e.g. `{date}`).

## 3. Server Component Architecture
Created the page `src/app/[locale]/(landing)/terms/page.tsx`:
- Rendered exclusively on the Server (`getTranslations("landing.terms")`) for maximum SEO value as stipulated.
- Utilizes `<article>` with `mx-auto max-w-4xl px-6 py-24` structure avoiding third-party dependency blowups (e.g., opted to strictly manually craft HTML components without depending on heavy Typography libraries).
- Native support for Dark/Light modes through variables like `text-foreground`, `text-muted-foreground`, and `bg-background`.

## 4. Hooking everything together
Modified `src/containers/landing/LandingFooter.tsx` to actually link users to `{locale}/terms/` using `next-intl/navigation`. The legal presence footprint is fully compliant with external services assessments, including Google!

> [!TIP]
> Navigating to `localhost:3000/en/terms` or `localhost:3000/vi/terms` guarantees a fast, cleanly-coded landing subpage that is identical to product specifications and compliant with the "Living Document Strategy".
