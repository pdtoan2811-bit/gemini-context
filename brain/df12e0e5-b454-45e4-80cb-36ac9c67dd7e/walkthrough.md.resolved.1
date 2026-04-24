# Walkthrough — Skill Pipeline Architecture

## What Was Built

4 new skills + 2 existing skill updates that transform a generic user topic into a fully-realized Remotion video with programmatic visual assets.

## Pipeline Flow

```
User: "Anthropic Mythos vs GPT 5.5"
       │
       ▼
┌──────────────────────────────────────────────────────────┐
│ [pipeline-orchestrator] — Master coordinator             │
│                                                          │
│  Phase 1 ► [deep-research-engine]                        │
│            Tavily deep search + Reddit sentiment         │
│            → research.json (facts, dataPoints,           │
│              sentiment, controversies, timeline)          │
│                                                          │
│  Phase 2 ► [script-architect]                            │
│            Research → rich scene script with              │
│            visual directives (chart, comparison,          │
│            stat counter, quote card, etc.)                │
│            → rich-script.json                             │
│                                                          │
│  Phase 3 ► [visual-asset-forge] + ElevenLabs TTS         │
│            7 Remotion components + word-level             │
│            voiceover timing                               │
│            → voice.mp3 per scene + wordTimings            │
│                                                          │
│  Phase 4 ► Timeline assembly                              │
│            → timeline.json → Remotion Player preview      │
└──────────────────────────────────────────────────────────┘
```

## New Skills Created

### 1. `deep-research-engine`
[SKILL.md](file:///c:/Users/Admin/Desktop/remotionVidsTesting/.agents/skills/deep-research-engine/SKILL.md)

- **Multi-angle Tavily search**: Core topic, data/numbers, controversy — 3 parallel searches
- **Reddit sentiment via Tavily**: Searches `site:reddit.com` across 9 target subreddits
- **Source credibility ranking**: Tier 1 (Reuters, TechCrunch) → Tier 3 (Reddit, Medium)
- **Data point extraction**: Regex-based numerical claim parsing with comparison pairing
- **Output**: `research.json` with `facts[]`, `dataPoints[]`, `sentiment[]`, `controversies[]`, `entities[]`, `timeline[]`

### 2. `script-architect`
[SKILL.md](file:///c:/Users/Admin/Desktop/remotionVidsTesting/.agents/skills/script-architect/SKILL.md)

- **8 visual directive types**: `comparison-bar`, `stat-counter`, `versus-split`, `quote-card`, `timeline-graphic`, `data-table`, `progress-ring`, `caption-only`
- **Decision matrix**: Maps research signals to visual types (e.g., two numbers → `comparison-bar`)
- **Scene type ordering**: hook → context → data → comparison → sentiment → impact → cta
- **Full TypeScript specs** for each visual directive's `data` object
- **Pacing rules**: fast/punchy/measured/slower with frame duration guidelines
- **Complete example**: 7-scene rich script for the Mythos vs GPT topic

### 3. `visual-asset-forge`
[SKILL.md](file:///c:/Users/Admin/Desktop/remotionVidsTesting/.agents/skills/visual-asset-forge/SKILL.md)

**7 production-ready Remotion components** with full React/TSX code:

| Component | What it renders | Lines of code |
|-----------|----------------|---------------|
| `ComparisonBar` | Animated horizontal bars comparing 2-5 values | ~80 |
| `StatCounter` | Large counting number with glow pulse | ~70 |
| `VsSplit` | Split-screen entity comparison with bullet points | ~100 |
| `QuoteCard` | Reddit-style quote with avatar, upvotes, tone badge | ~90 |
| `TimelineGraphic` | Horizontal timeline with animated dot markers | ~60 |
| `DataTable` | Row-by-row animated reveal table | ~80 |
| `ProgressRing` | SVG circular progress indicator | ~70 |

All components use:
- Spring physics (`spring()`) for entrances
- Stagger delays for sequential reveals
- Glass morphism (`backdrop-filter: blur()`)
- Accent color inheritance from palette or data
- `Inter` font family with `fontWeight: 700-900`

### 4. `pipeline-orchestrator`
[SKILL.md](file:///c:/Users/Admin/Desktop/remotionVidsTesting/.agents/skills/pipeline-orchestrator/SKILL.md)

- **4-phase execution protocol** with TypeScript mock code for each phase
- **Quality gates** between phases (minimum facts, scene count validation, voice-subtitle sync check)
- **Error recovery**: Retry logic for Tavily, ElevenLabs failures; graceful fallbacks
- **Status update schedule**: 5% → 20% → 35% → 40-65% → 75% → 90% → 100%
- **Scene refinement flow**: Handles `parentJobId` + `refineScene` for targeted re-generation
- **Pipeline checklist**: Step-by-step verification before completion signal

## Existing Skills Updated

### `news-curator-tavily-reddit`
Added note pointing to `deep-research-engine` as the full-pipeline successor.

### `prompt-watcher`
Added note pointing to `pipeline-orchestrator` for enhanced workflow.

### `youtube-shorts-mastermind` (previous session)
Added Voice-Subtitle Sync Protocol (6 mandatory rules).

## Final Skills Directory

```
.agents/skills/
├── deep-research-engine/     ← NEW  Research intelligence
├── script-architect/         ← NEW  Rich script generation
├── visual-asset-forge/       ← NEW  7 Remotion components
├── pipeline-orchestrator/    ← NEW  Master coordinator
├── news-curator-tavily-reddit/  Updated cross-reference
├── prompt-watcher/              Updated cross-reference
└── youtube-shorts-mastermind/   Updated voice-subtitle sync
```
