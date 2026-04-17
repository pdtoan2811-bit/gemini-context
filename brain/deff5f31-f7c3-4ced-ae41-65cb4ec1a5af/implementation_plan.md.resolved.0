# Implementation Plan - Contact & Booking Section

Integrate a premium "Contact & Booking" section on the landing page that allows users to reach out via Zalo or schedule a call using Cal.com.

## User Review Required

> [!IMPORTANT]
> I will use placeholder links for Zalo and Cal.com. Please provide your actual Zalo phone number/ID and Cal.com booking link so I can update them.
> - **Zalo**: `https://zalo.me/[YOUR_PHONE]`
> - **Cal.com**: `https://cal.com/[YOUR_USERNAME]`

## Proposed Changes

### Landing Page Components

#### [NEW] [LandingContact.tsx](file:///c:/Users/Admin/Desktop/prod-2-adecos/src/containers/landing/LandingContact.tsx)
Create a new section component featuring:
- **Heading & Subheading**: Professional copy inviting users to connect.
- **Zalo Card**: High-fidelity card with a Zalo-themed icon, title, description, and "Message Now" button.
- **Cal.com Card**: High-fidelity card with a calendar icon, title, description, and "Book a Call" button.
- **Styling**: `framer-motion` animations, glassmorphism, and responsive grid layout matching the `LandingFeatures` design.

#### [MODIFY] [page.tsx](file:///c:/Users/Admin/Desktop/prod-2-adecos/src/app/[locale]/(landing)/page.tsx)
- Import and insert the `LandingContact` component between `LandingFAQ` and `LandingFooter`.

### Translations

#### [MODIFY] [en.json](file:///c:/Users/Admin/Desktop/prod-2-adecos/messages/en/landing.json) (and `vi.json`)
- Add new translation keys for the Contact section title, subtitle, card titles, descriptions, and button labels.

## Verification Plan

### Automated Tests
- I will use the browser tool to verify the landing page renders correctly and the new section is visible.
- Check hover effects and responsiveness in the browser.

### Manual Verification
- Verify that the Zalo and Cal.com links open in new tabs correctly.
- Ensure the design is consistent with the rest of the landing page in both Light and Dark modes.
