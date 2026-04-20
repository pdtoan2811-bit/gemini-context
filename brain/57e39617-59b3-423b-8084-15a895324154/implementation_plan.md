# Debug & UI/UX Revamp: Ad Optimization Workflow

Ensure the "Deep Dive" trigger consistently shows the to-do list confirmation and revamp the task management experience to be "WOW" and premium.

## User Review Required
> [!IMPORTANT]
> I am revamping the to-do list to be more immersive and tactile. This includes transition animations and a "Control Center" feel for AI-generated actions.

## Proposed Changes

### [Logical Fix & Final Polish]

#### [MODIFY] [SmartTaskCard.jsx](file:///c:/Users/ADMIN/Desktop/adecos-mvp-mockup/frontend/src/components/workflow/SmartTaskCard.jsx)
- Redefine checkbox: Signifies "Review Confirmed" rather than "Finished".
- Visual change: Remove strikethrough; use green glowing border and highlight for confirmed items.

#### [MODIFY] [CompactWorkflowMessage.jsx](file:///c:/Users/ADMIN/Desktop/adecos-mvp-mockup/frontend/src/components/agent/CompactWorkflowMessage.jsx)
- UX Writing: "Hoàn tất" -> "Đã xác nhận".
- UX Writing: "Tiến độ thực thi" -> "Mức độ duyệt".

#### [MODIFY] [TodoList.jsx](file:///c:/Users/ADMIN/Desktop/adecos-mvp-mockup/frontend/src/components/workflow/TodoList.jsx)
- Similar logical alignment for confirmation during review.

## Verification Plan

### Automated Tests
- N/A (Manual UI verification)

### Manual Verification
1. Click "Deep Affiliate Research" on a campaign.
2. Verify the workflow appears with a "WOW" task list.
3. Verify the "Approval" bar is clearly visible and sticky (if applicable).
4. Review the SMART detail animations and tactile feedback.
