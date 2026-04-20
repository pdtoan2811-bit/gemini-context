# V2 News Short — Execution Tracker

## Phase 1: Documentation (Sync Engine — docs before code)
- [ ] Update BRD.md — add word-sync success criterion
- [ ] Update PRD.md — add F7 word-synced subtitle feature
- [ ] Update SRS.md — add V2 architecture, new files, timestamp pipeline

## Phase 2: Voiceover Script (with-timestamps)
- [ ] Modify `generate-voiceover-apr14.ts` — switch to `/with-timestamps` endpoint
- [ ] Add word-level timing aggregation logic
- [ ] Add SSML break tags for natural pauses
- [ ] Run the script to generate new MP3 + JSON files

## Phase 3: Shared Types
- [ ] Create `src/lib/WordTimestamp.ts` — types + loader

## Phase 4: Composition Component
- [ ] Create `src/components/NewsShortV2.tsx` — full composition
  - [ ] True word-sync caption rendering
  - [ ] Inter-scene breathing pad
  - [ ] Layout upgrades (header, waveform, segmented progress)
  - [ ] Audio-reactive waveform bar

## Phase 5: Registration
- [ ] Update `Root.tsx` — register `news-short-v2` composition

## Phase 6: Verification
- [ ] Run voiceover generation script
- [ ] Launch Remotion Studio and verify
- [ ] Create walkthrough
