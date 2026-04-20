# Remotion Prompt-to-Video Setup

## Overview

Set up a Remotion project in `c:\Users\ADMIN\Desktop\AInewsvideo` for programmatic, prompt-driven AI news video generation, and install a matching Antigravity skill so the agent knows Remotion conventions natively.

## Proposed Changes

### 1. Remotion Project Bootstrap

#### [NEW] `c:\Users\ADMIN\Desktop\AInewsvideo\` — via `npx create-video@latest`

- Template: **Hello World** (TypeScript, Vite-based)
- Package manager: `npm`
- Post-install: add `@remotion/transitions` and `@remotion/media` packages

**Resulting structure:**
```
AInewsvideo/
├── public/              # Static assets (images, audio, video clips)
├── src/
│   ├── Root.tsx         # Composition registry
│   ├── MyComposition.tsx# Default starter composition
│   └── index.ts         # Entry point
├── remotion.config.ts   # Remotion config
├── package.json
└── tsconfig.json
```

---

### 2. Antigravity Workspace Skill

#### [NEW] `c:\Users\ADMIN\Desktop\AInewsvideo\.agents\skills\remotion\SKILL.md`

A single consolidated skill file (Antigravity format) that aggregates all 35+ Remotion rules from the official repo, translated into Antigravity skill format. Covers:

| Rule | Content |
|---|---|
| `compositions` | `<Composition>`, `<Still>`, `<Folder>`, `calculateMetadata` |
| `animations` | `useCurrentFrame`, `interpolate`, `Easing` — CSS animations FORBIDDEN |
| `timing` | Bézier easing, preset curves, composing interpolations |
| `sequencing` | `<Sequence>`, `<Series>`, premounting, nested sequences |
| `audio` | `<Audio>`, trim, delay, volume, loop, pitch |
| `videos` | `<Video>`, sizing, volume, playback rate, loop |
| `assets` | `public/` folder, `staticFile()`, remote URLs |
| `transitions` | `<TransitionSeries>`, overlays, slide/fade/wipe |
| `text-animations` | Word-by-word, character-by-character patterns |
| `subtitles` | `@remotion/captions`, SRT import, word-level rendering |
| `images` | `<Img>` component, preloading |
| `calculate-metadata` | Dynamic duration, props, dimensions |
| `voiceover` | TTS integration, `@remotion/google-tts` or ElevenLabs |

---

### 3. Documentation (per user rules)

Since this is a new project, the Initialization Protocol triggers. I'll create minimal living docs:

#### [NEW] `docs/BRD.md` — Value: AI news video generation from a text prompt
#### [NEW] `docs/PRD.md` — Behavior: scaffold Remotion compositions driven by AI-generated scripts
#### [NEW] `docs/SRS.md` — Architecture: Remotion + TypeScript + skill-based agent collaboration

---

## Verification Plan

### Automated
- Run `npm run dev` → Remotion Studio opens at `http://localhost:3000`
- Run `npm install` exits with `0` errors

### Manual
- Studio shows "Hello World" composition in left panel
- Skill file readable at `.agents/skills/remotion/SKILL.md`
