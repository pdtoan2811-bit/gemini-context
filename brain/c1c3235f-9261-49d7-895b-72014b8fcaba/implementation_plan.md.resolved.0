# [Fix EPERM error on Windows for symlink creation]

Local adapters (Codex-local, Claude-local, Cursor-local, etc.) use symlinks to:
- Mirror shared agent authentication and configuration into managed agent homes (`auth.json`).
- Inject local skills into agent runtime directories.

On Windows, `fs.symlink` requires administrative privileges or Developer Mode, often resulting in an `EPERM` error. This is a common hurdle for Windows users.

## User Review Required

> [!IMPORTANT]
> The solution involves falling back to **file copying** (for `auth.json`) and **directory junctions** (for skills) when symlinking fails. For `auth.json`, this means the managed agent home's version will not automatically sync with the shared one if the user logs in/out in another tool during an active Paperclip run. This is generally acceptable for a single session.

## Proposed Changes

Modify the symlink creation logic in multiple locations to be more Windows-resilient.

---

### [Component] [Adapter-Utils](file:///c:/Users/Admin/Desktop/paperclip/packages/adapter-utils)

#### [MODIFY] [server-utils.ts](file:///c:/Users/Admin/Desktop/paperclip/packages/adapter-utils/src/server-utils.ts)

Introduce a robust `symlink` utility that:
- Attempts a standard symlink first.
- If it fails with `EPERM` on Windows, it tries alternative methods:
    - For directories: use `junction` (which doesn't require admin rights on most Windows systems).
    - For files: fallback to a copy if symlinking is strictly forbidden.

---

### [Component] [Codex-local Adapter](file:///c:/Users/Admin/Desktop/paperclip/packages/adapters/codex-local)

#### [MODIFY] [codex-home.ts](file:///c:/Users/Admin/Desktop/paperclip/packages/adapters/codex-local/src/server/codex-home.ts)

Update `ensureSymlink` to use the new robust utility or implement its own fallback for `auth.json`.

---

### [Component] [Claude-local Adapter](file:///c:/Users/Admin/Desktop/paperclip/packages/adapters/claude-local)

#### [MODIFY] [execute.ts](file:///c:/Users/Admin/Desktop/paperclip/packages/adapters/claude-local/src/server/execute.ts)

Update `buildSkillsDir` to gracefully handle symlink failures when injecting skills.

---

### [Component] [Cursor-local Adapter](file:///c:/Users/Admin/Desktop/paperclip/packages/adapters/cursor-local)

#### [MODIFY] [execute.ts](file:///c:/Users/Admin/Desktop/paperclip/packages/adapters/cursor-local/src/server/execute.ts)

Similarly update `buildSkillsDir`.

## Open Questions

- Should we prefer one common utility in `adapter-utils` or modify individual adapters?
    - **Recommendation**: A common utility in `server-utils.ts` to keep the logic centralized.

## Verification Plan

### Manual Verification
- Attempt to run a Codex agent on a Windows machine where Developer Mode is disabled.
- Verify that the process completes without the `EPERM` error.
- Verify that `auth.json` is either symlinked (if possible) or copied to the managed home successfully.
- Verify that skills are correctly injected.
