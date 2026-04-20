# Trump-Iran Crisis — 2-Minute YouTube Short

## Background & Goal

Create a high-retention, **2-minute (120 seconds)** YouTube Short covering the rapidly evolving Trump-Iran crisis as of April 14, 2026. The video will synthesize breaking news from major outlets (Washington Post, CFR, PBS, CBS) and Reddit public sentiment (r/worldnews, r/geopolitics) into a visually aggressive, audio-synced short-form video.

**Topic:** Collapse of Islamabad peace talks → Naval blockade of Strait of Hormuz → Oil price spike → Global reaction → Ceasefire countdown.

---

## User Review Required

> [!IMPORTANT]
> **10-scene structure.** A 2-minute video at 30fps = 3,600 frames. Each scene averages ~12 seconds of voiceover audio but `calculateMetadata` will dynamically size the composition to the actual audio duration. Review the scene script below for accuracy and tone.

> [!WARNING]
> **ElevenLabs API cost.** 10 scenes × ~30 words each ≈ 300 words of TTS. This will consume quota from your existing ElevenLabs key (`sk_c299...`).

> [!IMPORTANT]
> **No source video panel.** Unlike `AIEditorShort` which overlays a source YouTube video, this composition uses **AI-generated background images** (via `generate_image` tool) as visual backdrops per scene. No external video is needed.

---

## Proposed Changes

### Component 1: Documentation (Docs-First — per User Rules)

> Per the Initialization Protocol: "No Spec, No Service." Docs are updated before code.

#### [MODIFY] [BRD.md](file:///c:/Users/ADMIN/Desktop/AInewsvideo/docs/BRD.md)
- Add **F5: News Topic Shorts** — AI-curated news videos from web + Reddit sentiment, rendered as standalone compositions with AI-generated backgrounds.

#### [MODIFY] [PRD.md](file:///c:/Users/ADMIN/Desktop/AInewsvideo/docs/PRD.md)
- Add feature **F5: News-Driven Short Composition** — User provides a topic → system curates news + Reddit sentiment → generates 10-scene script → ElevenLabs voiceover → AI backgrounds → Remotion renders 2-min video.

#### [MODIFY] [SRS.md](file:///c:/Users/ADMIN/Desktop/AInewsvideo/docs/SRS.md)
- Add architecture for the `TrumpIranShort` composition (new component, voiceover generation script, image assets).

---

### Component 2: Scene Script (10 Scenes, ~120s total)

| # | Scene ID | Tag | Voiceover Script (~12s each) | Visual |
|---|---|---|---|---|
| 1 | `s01-hook` | 🔴 BREAKING | "Peace talks collapsed. A naval blockade is live. Oil prices are surging past one hundred dollars. This is the Trump-Iran crisis — and it's escalating fast." | Dark map with red pulse overlay |
| 2 | `s02-talks` | 🕊️ FAILED | "On April eleventh, Vice President JD Vance flew to Islamabad for 21 hours of marathon negotiations with Iran. The goal: stop uranium enrichment. The result: total deadlock." | Diplomatic meeting scene |
| 3 | `s03-demands` | ⚛️ NUCLEAR | "The US demanded a 20-year ban on all enrichment and the removal of Iran's stockpile. Iran countered with five years. Neither side budged." | Nuclear facility imagery |
| 4 | `s04-blockade` | 🚢 BLOCKADE | "Hours after the talks collapsed, Trump announced a full naval blockade of Iranian ports and the Strait of Hormuz — one of the world's most critical oil chokepoints." | Naval warships in strait |
| 5 | `s05-oil` | 📈 $104/BARREL | "Brent crude jumped seven percent. US oil hit one-hundred-four dollars a barrel. Analysts warn it could reach one-ten if the blockade holds." | Oil price chart surge |
| 6 | `s06-iran` | 🇮🇷 RESPONSE | "Iran called the blockade 'piracy' and warned of a forceful response. The regime says it will not be strangled into submission." | Iranian flag/response imagery |
| 7 | `s07-reddit` | 💬 THE PEOPLE | "On Reddit, the reaction is fear and frustration. Users on worldnews and geopolitics are calling this reckless — worried about civilian harm and a wider regional war." | Reddit comment montage |
| 8 | `s08-ceasefire` | ⏰ 7 DAYS LEFT | "A fragile ceasefire expires on April twenty-first. International mediators from Pakistan, Turkey, and Egypt are scrambling for a second round of talks." | Countdown clock visual |
| 9 | `s09-stakes` | 🌍 GLOBAL STAKES | "Twenty percent of the world's oil flows through Hormuz. If this escalates, every gas station, every grocery shelf, every economy on earth will feel it." | Globe with trade routes |
| 10 | `s10-cta` | 🔔 STAY INFORMED | "Follow for real-time updates. Like if this opened your eyes. Share this with someone who needs to see it." | Subscribe/like CTA |

---

### Component 3: Image Generation (10 AI backgrounds)

#### [NEW] `public/images/trump-iran-short/` (directory)
- 10 AI-generated background images (1080×1920 portrait) using `generate_image` tool
- Each scene gets a unique, dramatic visual backdrop

---

### Component 4: Voiceover Generation

#### [NEW] [generate-voiceover-trump-iran.ts](file:///c:/Users/ADMIN/Desktop/AInewsvideo/scripts/generate-voiceover-trump-iran.ts)
- ElevenLabs TTS script following the existing `generate-voiceover-editor.ts` pattern
- Voice: "Adam" (`pNInz6obpgDQGcFmaJgB`) — authoritative, news-anchor tone
- Model: `eleven_flash_v2_5`
- Output: `public/voiceover/trump-iran-short/s01-hook.mp3` through `s10-cta.mp3`

---

### Component 5: Remotion Composition

#### [NEW] [TrumpIranShort.tsx](file:///c:/Users/ADMIN/Desktop/AInewsvideo/src/components/TrumpIranShort.tsx)
Architecture mirrors `AIEditorShort.tsx` but replaces the source video panel with AI-generated background images:

**Layer Stack (per scene, bottom to top):**
1. **AI Background Image** — Full-bleed `<Img>` with subtle Ken Burns (scale 1.00→1.06 over scene duration)
2. **Dark gradient overlay** — Bottom-to-top vignette for text readability
3. **Kinetic gradient** — Slow-drifting radial gradient using scene accent color
4. **Floating particles** — 14 particles with per-frame position mutation
5. **Tag badge + scene counter** — Spring-animated pill badges
6. **Caption block** — Word-by-word reveal with hostile spring (stiffness: 380, damping: 18), audio-reactive chromatic aberration
7. **Light leak** — Hard flash on scene cuts
8. **Grain overlay** — Animated per-frame SVG noise
9. **Audio** — `<Audio>` component playing scene voiceover

**Mastermind Protocol Compliance:**
- Cut Frequency: 10 scenes in 120s = avg 12s/scene with ≥4 visual changes per cut
- Hostile Easing: `Easing.bezier(0.1, 1, 0, 1)`, spring stiffness ≥ 300
- Audio-Reactive: Bass amplitude drives caption scale + chromatic aberration
- Visual Anchor: Caption block locked in bottom-third safe zone
- Zero-Boring-Intro: First 3s = 4+ hard visual changes (light leak, tag slide, zoom, word reveal)
- Density via Layering: 9 stacked layers per scene, animated grain + particles always on

**Palette (10 scenes):**
```
s01: accent=#ef4444 (red/urgent)     s06: accent=#f97316 (orange/warning)
s02: accent=#8b5cf6 (purple/diplo)   s07: accent=#06b6d4 (cyan/social)  
s03: accent=#fbbf24 (amber/nuclear)  s08: accent=#f43f5e (rose/countdown)
s04: accent=#3b82f6 (blue/naval)     s09: accent=#22c55e (green/global) 
s05: accent=#facc15 (yellow/money)   s10: accent=#a855f7 (purple/CTA)  
```

#### [MODIFY] [Root.tsx](file:///c:/Users/ADMIN/Desktop/AInewsvideo/src/Root.tsx)
- Register new `<Composition id="trump-iran-short">` with `calculateMetadata` for dynamic audio-based duration
- 1080×1920, 30fps

---

## Open Questions

> [!IMPORTANT]
> **Scene scripts — any edits?** Review the 10 voiceover scripts above. Want to change wording, add/remove scenes, or adjust the tone?

> [!IMPORTANT]
> **Video length.** You said 2 minutes. YouTube Shorts max is now 3 minutes. Confirm 2 minutes (~120s) is the target, not shorter (60s)?

---

## Verification Plan

### Automated Tests
1. Run `npx tsx scripts/generate-voiceover-trump-iran.ts` — verify 10 MP3 files created
2. Run `npm run dev` — verify Remotion Studio loads `trump-iran-short` composition
3. Preview in Remotion Studio — verify all 10 scenes play with correct audio, images, and animations

### Manual Verification
- Visual check in Remotion Studio browser preview
- Confirm audio sync and scene transitions
- Verify total duration ≈ 120 seconds
