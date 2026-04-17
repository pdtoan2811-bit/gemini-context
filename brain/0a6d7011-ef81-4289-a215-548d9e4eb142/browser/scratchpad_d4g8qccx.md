# Status
- [x] Go to http://localhost:3000/vi and switch to light mode.
- [x] Hover over Bento boxes and verify invisibility.
- [x] Inspect styles of BorderBeam.
- [x] Report and suggest color strategy.

# Findings
- The core beam is set to `stroke="white"` with `opacity-70`, making it invisible on the white background of light mode.
- The glow layers (`cyan` and `var(--primary)`) have low opacity and high blur, providing insufficient contrast in light mode.
- Suggestion: Use theme-aware colors for the beam (e.g., `var(--primary)` or a darker color in light mode) and increase opacity of glow layers.
