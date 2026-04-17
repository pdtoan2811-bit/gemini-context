# Layout & Language Compatibility Fix

This plan addresses the broken Bento Grid layout and incomplete Vietnamese translations reported by the user.

## User Review Required

> [!IMPORTANT]
> **Layout Shift**: I will transition the Bento Grid from a fixed row height (`auto-rows-[20rem]`) to a flexible height system (`min-h-[20rem]`). This will ensure that longer Vietnamese translations do not cause text to overlap or spill out of their containers. 

## Proposed Changes

### [Core Components] Grid Flexibility
#### [MODIFY] [BentoGrid.tsx](file:///c:/Users/Admin/Desktop/prod-2-adecos/src/components/BentoGrid.tsx)
- Remove `md:auto-rows-[20rem]` from the `BentoGrid` container.
- Add `min-h-[20rem]` to `BentoGridItem` to maintain the visual rhythm while allowing expansion for localized content.

### [Localization] Complete Translation Pass
#### [MODIFY] [vi/client.json](file:///c:/Users/Admin/Desktop/prod-2-adecos/messages/vi/client.json)
- Localize Bento Grid titles:
    - "AI Agent" → "Trợ lý AI"
    - "Deep Research" → "Nghiên cứu sâu"
    - "Project Management" → "Quản lý dự án"
- Translate Hero section strings:
    - "Everything you need to grow" → "Mọi thứ bạn cần để phát triển"
    - "Powerful tools designed to elevate..." → "Các công cụ mạnh mẽ được thiết kế để nâng tầm marketing của bạn."
- Translate Testimonial lead:
    - "Performance Marketing Lead" → "Trưởng bộ phận Performance Marketing"

### [Page Components] Animation Refinement
#### [MODIFY] [LandingFeatures.tsx](file:///c:/Users/Admin/Desktop/prod-2-adecos/src/containers/landing/LandingFeatures.tsx)
- Adjust the code to use the flexible grid.
- Ensure the `DeepResearchPreview` animation uses localized sub-strings correctly.

## Verification Plan

### Automated Tests
- Use browser subagent to record both `/en` and `/vi` features sections to confirm no overlaps exist.
- Verify that every string in the features section is correctly translated.

### Manual Verification
- Manually switch between themes (Light/Dark) in Vietnamese to ensure contrast remains correct with the new localized strings.
