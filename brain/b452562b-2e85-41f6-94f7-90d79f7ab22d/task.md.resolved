# Task Tracker — Sandbox UI/UX Revamp

## 1. Data Model Updates
- [x] Extend `RefCountEntry` with optional `campaignId`, `campaignName`, and `source` field
- [x] Add `BackdateCsvRow` type for 6-column CSV format
- [x] Add `BackdateImportRecord` type for CSV upload tracking

## 2. Visual Hierarchy — Project List
- [x] Improve tab active indicator (solid primary, animated spring)
- [x] Add badge-style count pills on tabs
- [x] Clean button styling (removed gradients)

## 3. Visual Hierarchy — Detail View
- [x] Cleaner CSV tab with 6-column format diagram + template download
- [x] Source column in ref count "all entries" table (subtle text labels)

## 4. CSV/Excel Backdate Upload Revamp
- [x] New 6-column CSV format parser (link ref, ref count, start, end, ID, campName)
- [x] Auto header detection and skip
- [x] Date range distribution (evenly across startTimestamp → endTimestamp)
- [x] Backward compatibility with legacy 2-column format
- [x] Template download button
- [x] Format info table in CSV tab

## 5. History Tab — Before/After Split
- [x] Split timeline at `CampaignConnection.connectedAt`
- [x] "Before Connection" section (muted, dashed border, faded events)
- [x] "After Connection" section (normal events, solid timeline)
- [x] Connection moment divider (subtle horizontal line + timestamp)
- [x] Professional tone-down: removed emojis, gradients, excessive colors

## 6. Verification
- [x] TypeScript compiles cleanly (no errors)
- [ ] Visual verification in browser
