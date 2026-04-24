# Remotion Prompt Studio — Enhanced Preview & Editing UI

## Background

The current UI submits prompts and displays placeholder states while waiting for a fully rendered `.mp4` video. This means users can't preview compositions until they're rendered offline. We need an inline preview, scene-level editing, and proper prompt history with context management.

### What was fixed this session (already done)
- **Port collision** — Remotion Studio and Express server both competed for port 3001. Fixed by pinning Studio to `--port=3000`.
- **MCP bridge not registered** — `mcp_config.json` was empty. Now configured to launch `mcp-bridge/server.ts`.
- **Direct pipeline test** — Successfully processed job `c7f391e9` end-to-end (prompt → timeline → done signal → UI update).

---

## Proposed Changes

### Feature 1: Inline Remotion Player Preview

Replace the current `<video>` / placeholder approach with `@remotion/player`'s `<Player>` component, which renders Remotion compositions **live in the browser** — no rendering required.

#### [MODIFY] [VideoPlayer.tsx](file:///c:/Users/Admin/Desktop/remotionVidsTesting/src/ui/components/VideoPlayer.tsx)

**Current**: Shows a `<video>` tag for rendered `.mp4` or a placeholder icon/text for in-progress jobs.

**Proposed**: 
- Import `Player` from `@remotion/player` and `PromptVideo` from the Remotion composition.
- When a job has `status === "done"` and a `compositionId` is set, **fetch `timeline.json`** and render an inline `<Player>`.
- The Player renders the full composition at 1080×1920 scaled into the viewport with controls (play/pause/scrub).
- Falls back to the existing placeholder for queued/processing/error states.
- Falls back to `<video>` tag when a rendered `.mp4` `videoUrl` exists.

```tsx
// Core change — when timeline is available, render the live Player:
<Player
  component={PromptVideo}
  inputProps={{ timeline }}
  durationInFrames={timeline.totalDurationFrames}
  compositionWidth={1080}
  compositionHeight={1920}
  fps={30}
  controls
  loop
  style={{ width: "100%", height: "100%" }}
/>
```

> [!IMPORTANT]
> `@remotion/player` is already in `package.json` dependencies — no new install needed.

---

### Feature 2: Scene Selection & Enhancement

Allow users to click on a specific scene in the timeline to select it, then submit a refinement prompt scoped to that scene.

#### [NEW] [SceneTimeline.tsx](file:///c:/Users/Admin/Desktop/remotionVidsTesting/src/ui/components/SceneTimeline.tsx)

A horizontal scene strip below the video player that shows all scenes as clickable cards:
- Each card shows the scene tag, a truncated caption, and duration
- Clicking a card selects it (highlighted with accent border glow)
- Selected scene info is passed to the prompt panel for context-aware editing
- Thumbnail chips with scene number, color-coded by palette

#### [MODIFY] [PromptPanel.tsx](file:///c:/Users/Admin/Desktop/remotionVidsTesting/src/ui/components/PromptPanel.tsx)

When a scene is selected:
- Show a "Refining Scene X" indicator above the textarea
- Pre-fill context: `"Refine scene [tag]: [current caption]"`
- Add a "Clear selection" button to go back to full-video mode
- Submit sends `{ prompt, template, options: { ...opts, refineScene: sceneId, parentJobId } }`

#### [MODIFY] [App.tsx](file:///c:/Users/Admin/Desktop/remotionVidsTesting/src/ui/App.tsx)

- Add `selectedScene` state (`Scene | null`)
- Pass timeline data + selected scene between VideoPlayer, SceneTimeline, and PromptPanel
- Fetch timeline.json when a job reaches `done` status

---

### Feature 3: Prompt History & Context Management

Turn the left sidebar into a smarter history panel with context chains and revision tracking.

#### [MODIFY] [JobHistory.tsx](file:///c:/Users/Admin/Desktop/remotionVidsTesting/src/ui/components/JobHistory.tsx)

- Group jobs by parent chain — if job B refines scene from job A, they nest together
- Show revision badges: `v1`, `v2`, `v3`
- Expand/collapse job chains
- Show prompt text + which scene was refined
- Quick "re-use prompt" button that copies the prompt back to the input

#### [MODIFY] [types.ts](file:///c:/Users/Admin/Desktop/remotionVidsTesting/src/lib/types.ts)

Add fields to `PromptJob` and `PromptOptions`:
```ts
// In PromptOptions
refineScene?: string;    // Scene ID being refined
parentJobId?: string;    // The job this is a refinement of

// In PromptJob (server-side addition)
parentJobId?: string;    // Link to parent for history chains
refinedSceneId?: string; // Which scene was refined
```

#### [MODIFY] [server.ts](file:///c:/Users/Admin/Desktop/remotionVidsTesting/server/server.ts)

- Store `parentJobId` and `refinedSceneId` from prompt options into the job
- Add `GET /api/jobs/:id/timeline` to serve the timeline.json for a specific job

---

### Supporting Changes

#### [MODIFY] [index.css](file:///c:/Users/Admin/Desktop/remotionVidsTesting/src/ui/index.css)

Add CSS for:
- `.scene-timeline` — horizontal scroll strip below player
- `.scene-card` / `.scene-card--selected` — scene chips with glow when active
- `.refine-indicator` — the "Refining Scene X" bar in the prompt panel
- `.job-chain` / `.job-chain__child` — nested job history styles
- Player container styling overrides (rounded corners, border glow)

#### [MODIFY] [App.tsx](file:///c:/Users/Admin/Desktop/remotionVidsTesting/src/ui/App.tsx)

- Wire up timeline fetching (`GET /api/jobs/:id/timeline` or direct from `/public/content/${id}/timeline.json`)
- Pass timeline, selectedScene, onSelectScene between components
- Modified grid layout to accommodate scene timeline strip

---

## User Review Required

> [!IMPORTANT]
> **Layout question**: Should the scene timeline strip be placed:
> - **(A)** Below the video player (horizontal scroll), or
> - **(B)** In the left sidebar alongside job history?
>
> I'm defaulting to **(A)** since it visually connects to the video.

> [!WARNING]
> The `<Player>` from `@remotion/player` renders compositions **client-side in the browser**. For compositions with heavy assets (many hi-res images), this may be slower than pre-rendered video. The rendered `.mp4` option will remain as a fallback for final-quality viewing.

---

## Verification Plan

### Automated Tests
1. Start `npm run dev` and verify all 4 services come up without port conflicts
2. Submit a test prompt from the UI
3. Manually create a timeline.json for the test job
4. Verify the `<Player>` renders the composition inline with play/pause/scrub
5. Click a scene in the timeline strip → verify prompt panel shows "Refining Scene X"
6. Submit a refinement prompt → verify it creates a child job with `parentJobId`
7. Verify job history shows the parent-child chain

### Manual Verification
- User should see live video preview immediately after timeline is created (no render needed)
- Scene selection should highlight in the timeline and populate the prompt panel
- Job history should show revision chains clearly
