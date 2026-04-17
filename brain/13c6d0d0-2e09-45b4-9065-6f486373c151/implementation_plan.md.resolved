# UI/UX Density Optimization Plan

Optimize the application UI to handle a large number of tasks more efficiently by reducing excessive white space and overly large border radiuses, while maintaining the "premium" and "readable" feel.

## Proposed Changes

### Global Design Tokens
#### [MODIFY] [globals.css](file:///c:/Users/Admin/Desktop/Sprintdebug/sprint-relay/src/app/globals.css)
- Reduce base `--radius` from `0.6rem` to `0.4rem` for a more professional, compact look.
- This will automatically affect all components using `rounded-lg`, `rounded-md`, etc.

---

### Dashboard Components
#### [MODIFY] [DailyMeetingView.tsx](file:///c:/Users/Admin/Desktop/Sprintdebug/sprint-relay/src/components/dashboard/DailyMeetingView.tsx)
- **Container Radius**: Change `rounded-3xl` and `rounded-[2.5rem]` to `rounded-2xl` or `rounded-xl`.
- **Padding**: Reduce main container padding from `p-8` to `p-5` or `p-6`. Reduce smaller container padding from `p-6` to `p-4`.
- **Spacing**: Tighten `gap-8` to `gap-5` and `gap-6` to `gap-4`.
- **Header area**: Reduce vertical padding and margins in section headers.
- **Personnel Selector**: Reduce padding and gap in the personnel selector row.

#### [MODIFY] [TaskCard.tsx](file:///c:/Users/Admin/Desktop/Sprintdebug/sprint-relay/src/components/dashboard/TaskCard.tsx)
- **Card Radius**: Change `rounded-2xl` to `rounded-xl`.
- **Card Padding**: Reduce `px-4 py-3.5` to `px-3 py-2.5`.
- **Internal Spacing**: Tighten gaps between icons, text, and badges.
- **Font Size**: Consider reducing task name font size slightly if it helps with line-length on small cards.

#### [MODIFY] [DailyRecapView.tsx](file:///c:/Users/Admin/Desktop/Sprintdebug/sprint-relay/src/components/dashboard/DailyRecapView.tsx)
- Apply similar spacing and radius reductions to match the new design system.

---

## Verification Plan

### Automated Verification
- I will use the browser tool to capture screenshots before and after changes to ensure the "premium feel" is preserved while density is increased.
- Check for any layout regressions or overflowing text.

### Manual Verification
1.  Navigate through "Daily Meeting", "All Persons", and "Squads" views.
2.  Verify that a large list of tasks is more readable and requires less scrolling.
3.  Ensure interactive elements (buttons, drag-and-drop) still have sufficient hit areas.
