# Sprint Relay Visual Audit Task List

- [x] Navigate to `http://localhost:3000` (Encountered Build Error)
- [ ] Verify "Daily Meeting" view:
    *   [ ] Navy blue accent (#1D3557) in headers/buttons.
    *   [ ] Task cards have "Module" and "Screen" info.
    *   [ ] "Sync Squad" button is gone.
    *   [ ] Status badges have high contrast.
- [ ] Verify "Daily Recap" view:
    *   [ ] Navy blue theme applied to filters and headers.
- [ ] Verify "Next Sprint Squad Planning" view:
    *   [ ] Unified `TaskCard` is used and looks correct.
- [ ] Verify "Personnel Overview":
    *   [ ] Unified `TaskCard` is used and looks correct.
- [ ] Take screenshots of these views.
- [ ] Return a summary.

### Findings
- Build Error: `Export priorityDotColor doesn't exist in target module ./src/components/dashboard/daily-meeting/HistoricalView.tsx (6:1)`.
- The export `priorityDotColor` was not found in `./src/components/dashboard/daily-meeting/utils.tsx`.
- Cannot proceed with visual audit until build is fixed.
- [ ] Verify "Daily Recap" view:
    *   [ ] Navy blue theme applied to filters and headers.
- [ ] Verify "Next Sprint Squad Planning" view:
    *   [ ] Unified `TaskCard` is used and looks correct.
- [ ] Verify "Personnel Overview":
    *   [ ] Unified `TaskCard` is used and looks correct.
- [ ] Take screenshots of these views.
- [ ] Return a summary.
