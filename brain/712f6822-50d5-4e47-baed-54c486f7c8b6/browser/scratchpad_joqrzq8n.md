# Sprint Relay Debugging Plan

- [x] Navigate to http://localhost:3000
- [x] Open and check console logs for errors (Failed to load data, Migration failed, 404/500 for /api/data)
    - Findings: No explicit fetch errors, but [Fast Refresh] "unrecoverable error" warning found.
- [x] Check if Sprint Settings modal (gear icon) can be opened
    - Findings: Modal opens successfully.
- [x] Verify dates in Sprint Settings modal against DEFAULT_CONFIG
    - Findings: /api/data response body is MISSING `sprint_configs` key, only contains `sprint_relay_meeting_notes`. Dates shown in modal (7-12) are likely hardcoded defaults.
- [x] Report Findings
