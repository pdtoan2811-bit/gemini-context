# Goal: Mastermind Template Extraction & Legacy Cleanup

We need to cleanly abstract the highly-tuned `MythosSarcasticShort` component into a dynamic, parameterized template that the Mastermind AI agent can reliably copy for every subsequent short. We also need to strip the repository of orphaned compositions that lack source media.

## Proposed Changes

### 1. The Mastermind Template Engine
I will create a definitive template file `src/templates/YoutubeShortsMastermind.tsx`.
- This file will identically mirror the powerful mechanics developed in `MythosSarcasticShort`: the letterbox blur GIF framework, dynamic Reddit modals, high-speed scene transitions, and reactive typography.
- **Parameterization**: Instead of hardcoding `COMP_ID`, `SCENES`, and `redditData` strings, it will accept them as variables (e.g. `export const SCENES = [...]`). 
- When an AI agent needs to spawn a new Youtube Short, it will simply copy `YoutubeShortsMastermind.tsx` out of the `src/templates/` directory into `src/components/`, inject the new `SCENES` definitions at the top using `sed` or script regex, and register it in `Root.tsx`.

### 2. Upgrading the Skill Definition
I will update the Mastermind agent rules (`c:\Users\Admin\Desktop\remotionVideos\.agents\skills\youtube-shorts-mastermind\SKILL.md`) to formally codify this workflow:
- The skill will be given explicit instructions that whenever setting up a new React Remotion composition, it MUST use `fs.copyFileSync` to clone `src/templates/YoutubeShortsMastermind.tsx`.
- The skill will be taught how to inject the `COMP_ID` and the customized `SCENES` array containing `id` and `tag` into the cloned file so it compiles flawlessly.

### 3. Cleanup Legacy Projects
I've verified that `mythos-sarcastic` and `TrumpOrigin` are the only active campaigns with existing `public/voiceover/` media. Consequently, I will:
- **Delete** the following orphaned components from `src/components/`:
  - `AINewsShort.tsx`
  - `AIEditorShort.tsx`
  - `TrumpIranShort.tsx`
  - `TrumpIranApr14.tsx`
  - `NewsShortV2.tsx`
  - `MythosShort.tsx`
- **Scrub** `Root.tsx` to unregister these compositions, permanently neutralizing the `404 Not Found` rendering errors you have been encountering on boot.

## User Review Required
> [!IMPORTANT]  
> Are there any other components inside `src/components/` that you consider "legacy" that I should purge, or is this list exactly what you want removed? Once approved, I will clean house, define the template, and update the Mastermind skill doc.
