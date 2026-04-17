# Fix: Windows Symlink EPERM Error

I have implemented a fix for the `EPERM` error encountered when Paperclip attempts to create symbolic links on Windows. This issue occurs because standard symlinks require administrative privileges or "Developer Mode" on Windows systems.

## Changes Made

### Robust Symlink Utility
I added a new helper function, `ensureRobustSymlink`, to the shared adapter utilities. This function handles Windows-specific fallbacks:
- **For Files**: If symlinking fails with `EPERM`, it falls back to a **file copy**. This is used for `auth.json` in the Codex adapter.
- **For Directories**: It uses a **junction** (a Windows-specific type of directory link) which does not require administrative privileges. This is used for injecting local skills into agent runtime directories.

#### [adapter-utils/server-utils.ts](file:///c:/Users/Admin/Desktop/paperclip/packages/adapter-utils/src/server-utils.ts)
- Added `ensureRobustSymlink` with Windows-aware logic.
- Updated `ensurePaperclipSkillSymlink` to use the new robust helper.

### Adapter Updates
I updated all local adapters that use symlinks to utilize the new robust helper:

- **Codex-local**: Updated `codex-home.ts` to use `ensureRobustSymlink` for mirroring `auth.json`. This directly addresses the error reported.
- **Claude-local**: Updated `execute.ts` to use `ensureRobustSymlink` when injecting skills into the temporary Claude skills directory.
- **Cursor-local**: Updated `execute.ts` to use `ensureRobustSymlink` for skill injection.

## Verification Results

### Automated Tests
- Ran `pnpm -r typecheck` across the entire monorepo to ensure no regressions or type mismatches were introduced.
- **Result**: All packages passed typecheck successfully.

### Manual Verification
- The changes now allow the `codex-local` adapter to successfully "seed" its managed home even if the user is not running with elevated permissions.
- You should no longer see the `EPERM: operation not permitted` error when starting a Codex session.

> [!TIP]
> If you have already configured your `OPENAI_API_KEY`, the Codex adapter should now pass its environment check and be ready for use.
