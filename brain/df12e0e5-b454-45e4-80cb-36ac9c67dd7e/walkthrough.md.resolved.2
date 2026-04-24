# Walkthrough — Premium Visual Components & Pipeline Enhancement

## Changes Made

### 1. Premium Visual Components (`src/remotion/VisualOverlay.tsx`) — COMPLETE REWRITE

Rebuilt all 7 animated components from scratch with a **premium design system** optimized for **9:16 vertical** (1080×1920) short-form video:

| Component | Key Visual Features |
|---|---|
| **ComparisonBar** | Glass card wrapper, gradient bar fills with shine highlight, staggered spring reveal, tabular-nums counters, accent glow on values |
| **StatCounter** | Scale-up entrance, radial glow pulse (sin wave), glass pill subtitle, 130px hero number |
| **VsSplit** | Slide-in from sides, gradient VS circle badge, accent-bordered bullet cards, staggered point reveals |
| **QuoteCard** | Shimmer sweep effect, rounded avatar with initial, upvote pill with border, italic quote with tone badge + dot indicator |
| **TimelineGraphic** | Gradient progress line, dots with glow rings + dark border, GlassCard wrapper |
| **DataTable** | No-padding glass card, accent header row, row-by-row slide-in, highlighted rows with tinted background |
| **ProgressRing** | SVG stroke-dasharray spring, radial background glow pulse, glass pill subtitle |

**Shared Design System**:
- `GLASS` tokens: bg, border, blur, radius, shadow(), glow()
- `OverlayContainer`: positions content in 9:16 safe zone (top 180px, bottom 42%)
- `GlassCard`: reusable frosted glass card with blur + accent shadow
- `SectionTitle` + `AccentLine`: consistent typography/decoration primitives

### 2. PromptVideo.tsx Integration

- Imported `VisualOverlay` + `VisualDirective` type
- Added `<VisualOverlay>` to SceneView layer stack between Particles and TagBadge
- Extended Scene type to include `visual?: VisualDirective`

### 3. PromptPanel.tsx — Duration Controls

- **Target Duration**: 60s / 90s / 120s preset buttons + Custom input
- **Max Duration / Scene**: Number input (default 3s, range 1-15s)  
- **Style**: Kinetic / Formal / Minimal dropdown
- New CSS: `.duration-presets`, `.duration-preset-btn`, `.duration-preset-btn--active`

### 4. Subtitle Word Spacing Fix

- `gap: "0 0.25em"` → `gap: "4px 10px"` on word flex container
- `fontSize: 58` → `52`, `lineHeight: 1.2` → `1.25`
- `letterSpacing: negative` → `"0.01em"` (positive)

### 5. Skills Documentation Updated

- **`visual-asset-forge`**: Complete rewrite — references actual implementation, documents design tokens, catalogs all 7 components with data shapes, specifies 9:16 layout rules
- **`script-architect`**: Fixed pacing rules to enforce `maxSceneDuration` as hard cap. Added word count guidance. Added visual variety rule (40% minimum).
- **`pipeline-orchestrator`**: Added `maxSceneDuration` enforcement at Phase 2 (scene count formula) and Phase 3 (frame capping with `Math.min()`).
- **`prompt-watcher`**: Added auto-trigger documentation for MCP bridge polling.

### 6. MCP Bridge Auto-Polling

- Added `startPromptPolling()` function after `notifications/initialized`
- 10-second interval checks for new pending prompts
- Sends `notifications/resources/updated` + `notifications/tools/list_changed` via stdout
- Enables Antigravity to auto-detect and process new prompts without user intervention

### 7. Types Enhancement

- Added `targetDuration?: number` to `PromptOptions` interface
- Fixed duplicate type definitions in `types.ts`

## Testing

- All HMR builds pass clean (Vite + Remotion)
- No TypeScript errors
- Settings flow verified: UI → server API → `.prompts/*.json` → MCP bridge
