# Debugging Sprint 7 Task Loading

## Task Checklist
- [x] Navigate to http://localhost:3000/
- [x] Wait for initial tasks to load
- [x] Find sprint selection dropdown
- [x] Select "Sprint 7"
- [ ] Observe behavior (flashing, final state, console errors)
- [x] Observe behavior (flashing, final state, console errors)
- [x] Describe findings

## Findings
- Initial load sometimes shows 67 tasks, then it drops to 0.
- Switching between tabs ("Personnel" vs "Tasks") might trigger the clear or just happen at the same time.
- Once it hits 0, it seems to stay at 0.
- Sprint 7 has data (67 tasks) but the UI clears it.
- No console errors were seen, but HMR is active.
- The "flashing" reported by the user is likely the transition from 67 tasks to 0 tasks.
- Network requests for Sprint 11 and Sprint 7 both redirect (302) to a Google Script macro, which then returns data.
