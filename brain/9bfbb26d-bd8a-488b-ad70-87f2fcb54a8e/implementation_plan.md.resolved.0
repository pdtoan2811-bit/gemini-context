# V2 News Short Template — Word-Synced Subtitles + Natural Pacing

## Problem Statement

The current `TrumpIranApr14` composition has two critical issues:

1. **Fake word sync**: Captions use a fixed `WORD_DELAY = 3 frames` between words — every word appears at a constant rate regardless of how fast the narrator actually speaks. This means subtitles drift out of sync with the voiceover.
2. **Abrupt scene gaps**: Scenes cut directly from one voiceover clip to the next with zero breathing room. The transitions feel robotic and immediately identifiable as AI-generated.

## User Review Required

> [!IMPORTANT]
> **New ElevenLabs API calls required.** The `/with-timestamps` endpoint returns both audio AND character-level timing in a single response. This means we must **re-generate all voiceover files** for the Apr14 composition (8 scenes). The API cost is identical to the original generation — same text, same model, same character count. The only difference is the response format includes timing data.

> [!WARNING]
> **Breaking change to voiceover script interface.** The new script outputs both `.mp3` and `.json` per scene (e.g., `s01-dateline.mp3` + `s01-dateline.json`). Existing MP3 files will be overwritten. The composition component will require the JSON sidecar files to exist.

## Proposed Changes

### 1. Voiceover Generation — Word Timestamps

#### [MODIFY] [generate-voiceover-apr14.ts](file:///c:/Users/ADMIN/Desktop/AInewsvideo/scripts/generate-voiceover-apr14.ts)

**What changes:**
- Switch API endpoint from `/v1/text-to-speech/{voice_id}` to `/v1/text-to-speech/{voice_id}/with-timestamps`
- Response is now JSON with `audio_base64` + `alignment.characters[]` + `alignment.character_start_times_seconds[]` + `alignment.character_end_times_seconds[]`
- Decode `audio_base64` → write `.mp3` file (same as before)
- Aggregate character-level timing into **word-level timing** by detecting space/punctuation boundaries
- Write word-level timing as `.json` sidecar file

**Output JSON format per scene:**
```json
{
  "words": [
    { "word": "April", "startMs": 0, "endMs": 320 },
    { "word": "fourteenth,", "startMs": 320, "endMs": 680 },
    { "word": "twenty", "startMs": 720, "endMs": 950 }
  ]
}
```

**Voice settings update for natural pacing:**
```ts
voice_settings: {
  stability: 0.60,        // was 0.55 — slightly more stable for formal tone
  similarity_boost: 0.80,  // unchanged
  style: 0.15,            // was 0.20 — less stylistic variation = fewer rushed words
  use_speaker_boost: true,
}
```

**SSML-style pauses in script text:**
Add natural breathing pauses using ElevenLabs break tags between sentences:
```
"April fourteenth, twenty twenty-six. <break time=\"0.6s\" /> The United States and Iran have entered the most dangerous phase of their confrontation in decades."
```
This creates ~600ms of silence between sentences, eliminating the "machine gun" delivery.

---

### 2. Remotion Composition — True Word Sync

#### [NEW] [WordTimestamp.ts](file:///c:/Users/ADMIN/Desktop/AInewsvideo/src/lib/WordTimestamp.ts)

**Shared types + loader utility:**
```ts
export type WordTiming = {
  word: string;
  startMs: number;
  endMs: number;
};

export type SceneTimings = {
  words: WordTiming[];
};
```

Provides a `loadWordTimings()` function that fetches the JSON sidecar from `staticFile()` and returns parsed `SceneTimings`.

---

#### [NEW] [NewsShortV2.tsx](file:///c:/Users/ADMIN/Desktop/AInewsvideo/src/components/NewsShortV2.tsx)

A new composition built on the `TrumpIranApr14` foundation but with these key upgrades:

**A. True word-by-word sync (replaces fake WORD_DELAY)**

The `CaptionLowerThird` component receives word timing data and uses the **actual millisecond timestamps** from ElevenLabs:

```tsx
// OLD: word appears at frame = wordIndex * WORD_DELAY (fake)
// NEW: word appears at frame = (wordTiming.startMs / 1000) * fps (real)

const wordStartFrame = (wordTiming.startMs / 1000) * fps;
const wordEndFrame = (wordTiming.endMs / 1000) * fps;
const isActive = frame >= wordStartFrame && frame < wordEndFrame;
const isPast = frame >= wordEndFrame;

// Word springs in at its real start time
const wordProgress = spring({
  frame: frame - wordStartFrame,
  fps,
  config: { stiffness: 350, damping: 22, mass: 0.6 },
});
```

**Active word highlight**: The currently-spoken word gets a bright accent color + subtle scale bump. Past words dim to 85% opacity. Future words are invisible until their timestamp arrives.

**B. Natural inter-scene breathing (replaces hard cuts)**

Each scene gets a configurable `SCENE_PAD_FRAMES = 18` (0.6s at 30fps) appended to its audio duration. During this pad:
- Caption fades out smoothly (spring exit animation)  
- Background Ken Burns continues drifting
- A subtle vignette darkens the edges
- Next scene's light leak begins during the transition overlap

This creates the perception of a **thoughtful pause** rather than an abrupt AI cut.

```ts
// In calculateMetadata:
const SCENE_PAD_FRAMES = 18; // 0.6s breathing room
const sceneDurations = durations.map(
  (d) => d.durationInSeconds * FPS + SCENE_PAD_FRAMES
);
```

**C. Layout upgrades (formal broadcast feel)**

| Element | Current (Apr14) | V2 |
|---|---|---|
| Header | Static dateline text | Network-style logo bar with animated accent underline |
| Scene tag | Pill badge, left-aligned | Frosted glass card with icon + label, slides from left |
| Captions | Glassmorphic card, bottom | Split: **headline word** (large, center) + **context line** (smaller, below) |
| Source bar | Small text at bottom | Animated ticker-style source crawl |
| Progress | Thin line at very bottom | Segmented progress (one segment per scene, accent-filled) |
| Waveform | None | Real-time audio waveform bar between video and captions |

**D. Audio waveform visualization**

A sleek horizontal waveform bar (using `visualizeAudio`) sits between the background image and the caption card. This gives visual feedback that the narration is "live" and adds density without chaos.

---

#### [MODIFY] [Root.tsx](file:///c:/Users/ADMIN/Desktop/AInewsvideo/src/Root.tsx)

Register the new `NewsShortV2` composition:
```tsx
<Composition
  id="news-short-v2"
  component={NewsShortV2}
  durationInFrames={60 * FPS}
  fps={FPS}
  width={1080}
  height={1920}
  defaultProps={{ sceneDurations: [], wordTimings: [] }}
  calculateMetadata={v2CalculateMetadata}
/>
```

---

### 3. Documentation Updates

Per the Sync Engine protocol, documentation must be updated **before** code changes.

#### [MODIFY] [BRD.md](file:///c:/Users/ADMIN/Desktop/AInewsvideo/docs/BRD.md)
- Add success criterion: "News shorts render with word-level subtitle sync matching voiceover timing"

#### [MODIFY] [PRD.md](file:///c:/Users/ADMIN/Desktop/AInewsvideo/docs/PRD.md)
- Add **F7: Word-Synced Subtitle System** feature describing the ElevenLabs timestamp pipeline
- Update F6 to reference V2 as the improved implementation

#### [MODIFY] [SRS.md](file:///c:/Users/ADMIN/Desktop/AInewsvideo/docs/SRS.md)
- Add `WordTimestamp.ts` to project structure
- Add `NewsShortV2.tsx` to project structure
- Add Section 4.6: NewsShortV2 Composition Architecture (word timing flow, inter-scene padding, layout stack)
- Update voiceover generation script description to include `/with-timestamps` endpoint

---

## Open Questions

> [!IMPORTANT]
> **Scene content reuse or fresh content?** Should the V2 template reuse the same 8 scenes from `trump-iran-apr14` (same text, same images), or should we create a fresh news topic? Reusing lets us validate the subtitle sync system immediately; fresh content means we'd need new research + image generation first.

> [!IMPORTANT]
> **Break tag support.** ElevenLabs break tags (`<break time="0.6s" />`) require the text to be sent as SSML, not plain text. The `eleven_flash_v2_5` model supports this. Should we keep using `eleven_flash_v2_5` or upgrade to `eleven_multilingual_v2` for better prosody control? Flash is faster and cheaper; multilingual has richer intonation.

## Verification Plan

### Automated Tests
1. **Voiceover generation**: Run `npx tsx scripts/generate-voiceover-apr14.ts` and verify both `.mp3` and `.json` files are created for all 8 scenes
2. **JSON schema validation**: Verify each `.json` file contains `words[]` with valid `startMs`/`endMs` values
3. **Remotion Studio**: Run `npm run dev` and visually verify:
   - Words appear exactly when spoken (scrub timeline to verify frame-level sync)
   - Active word is highlighted, past words are dimmed
   - Inter-scene pauses feel natural (0.6s breathing room)
   - Waveform bar reacts to audio
   - Segmented progress bar advances correctly

### Manual Verification
- Render final video with `npx remotion render news-short-v2` and watch at 1× speed
- Compare subtitle timing against audio — words should never lead or lag the narration
- Verify no "machine gun" pacing between sentences
