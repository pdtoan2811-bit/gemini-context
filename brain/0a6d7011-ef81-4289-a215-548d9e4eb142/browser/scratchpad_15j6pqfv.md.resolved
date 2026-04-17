# Task: Diagnose "Searchlight Disaster" in Bento Boxes

## Status Checklist
- [x] Go to http://localhost:3000/vi
- [x] Observe the "Searchlight Disaster"
- [x] Inspect the `BorderBeam` component in the DOM
- [x] Verify if the rotating gradient covers the whole box
- [x] Identify why masking is failing
- [x] Capture a screenshot of the broken state

## Findings
- Observe: Confirmed huge blue light sweep across the entire bento box area on hover.
- Inspect: Identified the masked wrapper with `mask` shorthand and `mask-composite`.
- Verification: Yes, the gradient is huge (`300%` width/height) and the mask meant to confine it to the border is not working.
- Masking issue cause: The `mask` style is resolving incorrectly. The gradient `linear-gradient(#000 0 0)` is becoming `linear-gradient(rgb(0, 0, 0) 0px, rgb(0, 0, 0) 0px)`. More importantly, the `mask-composite: exclude` and `-webkit-mask-composite: destination-out` pairing is likely failing due to shorthand property conflicts or incorrect layer ordering for the webkit-specific property.
