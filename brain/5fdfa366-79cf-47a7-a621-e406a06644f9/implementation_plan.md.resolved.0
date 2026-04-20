# Fix Landing Page i18n and Light/Dark Mode Compatibility

## Problem Summary

The landing page has two classes of issues:

### 1. Hardcoded Vietnamese strings (i18n broken)
Despite the project having a proper `next-intl` i18n system with EN/VI translation files, **several landing page components contain hardcoded Vietnamese text** that ignores the selected locale:

| Component | Hardcoded String | Location |
|---|---|---|
| `LandingFeatures.tsx` → `AIAgentPreview` | `"Hỏi tôi bất cứ điều gì..."` (input placeholder) | Line 282 |
| `LandingFeatures.tsx` → `DeepResearchPreview` | `"Top SaaS AI affiliate..."` (search text, 2 places) | Lines 313, 319 |
| `LandingFeatures.tsx` → `DeepResearchPreview` | `"Đang quét nguồn..."` (scanning state) | Line 341 |
| `LandingFeatures.tsx` → `DeepResearchPreview` | `"20% Định kỳ"` (commission text) | Line 375 |
| `LandingFeatures.tsx` → `DeepResearchPreview` | `"Đã xác minh"` (verified badge) | Line 389 |
| `LandingFeatures.tsx` → `AnalyticsPreview` | `"Thống kê AI SaaS"` (analytics title) | Line 435 |
| `LandingFeatures.tsx` → `AnalyticsPreview` | `"Doanh thu GPT"`, `"Lợi nhuận Copy"`, `"Hoa hồng Notion"`, `"CPA Trung bình"` (KPI labels) | Lines 454, 460, 466, 472 |
| `LandingFeatures.tsx` → `AnalyticsPreview` | `"Tăng trưởng CVR"` (chart label) | Line 489 |
| `Hero.tsx` | `"Trusted by 100+ brands worldwide"` and `"Learn more →"` (social proof badge) | Lines 55, 57 |

### 2. Light/Dark mode issues
Several components use hardcoded colors that don't adapt to theme changes. The project uses `next-themes` with class-based dark mode (`.dark` on `<html>`), and Tailwind `dark:` variants:

| Component | Issue | Location |
|---|---|---|
| `BentoGrid.tsx` | Hardcoded `bg-white` / `dark:bg-black` instead of theme-aware `bg-background` | Line 44 |
| `LandingUseCases.tsx` | Hardcoded `bg-white dark:bg-neutral-900` on cards | Line 112 |
| `LandingFeatures.tsx` → Multiple previews | Hardcoded `bg-white`, `bg-white/80`, `bg-white/90` without dark equivalents or using `bg-neutral-*` inconsistently | Lines 113, 155, 177, 281, 310, 371, 453, 459, 465, 471 |
| `LandingFeatures.tsx` → `AIAgentPreview` | Green dot border uses `border-white dark:border-[#0a0a0a]` — should use `border-background` | Line 119 |
| `LandingFeatures.tsx` → `AnalyticsPreview` | Shadow `shadow-[0_8px_30px_rgb(0,0,0,0.12)]` — too visible in dark mode | Line 281 |

> [!NOTE]
> Most components already use `text-foreground`, `text-muted-foreground`, `bg-background`, `border-border` correctly — the issues are isolated to the preview mockup sub-components and a few card containers.

## Proposed Changes

### Translation Files

#### [MODIFY] [client.json](file:///c:/Users/ADMIN/Desktop/prod-adecos/messages/en/client.json)
Add missing EN translation keys under `landing.features`:

```json
"deepResearch.animation.searchPlaceholder": "Top SaaS AI affiliate...",
"deepResearch.animation.scanning": "Scanning sources...",
"deepResearch.animation.commissionRecurring": "20% Recurring",
"deepResearch.animation.verified": "Verified",
"analytics.animation.analyticsTitle": "AI SaaS Analytics",
"analytics.animation.kpiGptRevenue": "GPT Revenue",
"analytics.animation.kpiCopyProfit": "Copy Profit",
"analytics.animation.kpiNotionComm": "Notion Commission",
"analytics.animation.kpiAvgCpa": "Avg CPA",
"analytics.animation.cvrGrowth": "CVR Growth",
"aiAgent.animation.inputPlaceholder": "Ask me anything..."
```

And under `landing.hero`:
```json
"socialProof": "Trusted by <b>100+</b> brands worldwide",
"learnMore": "Learn more →"
```

#### [MODIFY] [client.json](file:///c:/Users/ADMIN/Desktop/prod-adecos/messages/vi/client.json)
Add matching VI translation keys (Vietnamese equivalents already exist as hardcoded strings).

---

### Landing Components

#### [MODIFY] [Hero.tsx](file:///c:/Users/ADMIN/Desktop/prod-adecos/src/containers/landing/Hero.tsx)
- Replace hardcoded `"Trusted by 100+ brands worldwide"` and `"Learn more →"` with `t("socialProof")` and `t("learnMore")`.
- Use `dangerouslySetInnerHTML` or `rich()` for the `<b>` tag inside social proof text. Since next-intl supports rich text via `t.rich()`, we'll use that approach.

#### [MODIFY] [LandingFeatures.tsx](file:///c:/Users/ADMIN/Desktop/prod-adecos/src/containers/landing/LandingFeatures.tsx)
- **AIAgentPreview**: Replace hardcoded `"Hỏi tôi bất cứ điều gì..."` with `t("inputPlaceholder")`.
- **DeepResearchPreview**: Add `useTranslations` hook; replace all 4 hardcoded Vietnamese strings with translation keys.
- **AnalyticsPreview**: Add `useTranslations` hook; replace all 6 hardcoded Vietnamese strings with translation keys.
- Fix light/dark mode: Replace `bg-white` with `bg-card` or `bg-background` in preview mockups. Replace `dark:border-[#0a0a0a]` with `border-background`. Fix shadow that's too aggressive in dark mode.

#### [MODIFY] [BentoGrid.tsx](file:///c:/Users/ADMIN/Desktop/prod-adecos/src/components/BentoGrid.tsx)
- Replace `dark:bg-black` / `bg-white` with `bg-card` / `dark:bg-card` which follows the theme system.

#### [MODIFY] [LandingUseCases.tsx](file:///c:/Users/ADMIN/Desktop/prod-adecos/src/containers/landing/LandingUseCases.tsx)
- Replace `bg-white dark:bg-neutral-900` pattern with `bg-card` to follow the theme system.

## Verification Plan

### Automated Tests
- Build the project with `npm run build` to verify no TypeScript errors from the translation key changes.

### Manual Verification
- Switch the locale between `/en` and `/vi` on the landing page and verify **every visible string** is translated.
- Toggle light/dark mode and verify all landing page sections have proper contrast and backgrounds.
