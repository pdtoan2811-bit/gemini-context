# Implementation Plan - Fix 'pnpm' Missing & Sync Documentation

The user encountered an error where `pnpm` was not recognized when running `start.bat`. This plan addresses the immediate failure, makes the setup process more robust, and ensures documentation is synchronized with the actual implementation (Reality vs. Definition).

## User Review Required

> [!IMPORTANT]
> - I have already installed `pnpm` globally in the environment to resolve the immediate blockade.
> - The proposed changes to `start.bat` will automatically check for and install `pnpm` if it's missing in the future, providing a smoother "premium" experience.
> - I will also add `prisma generate` to the startup flow to ensure the database client is always up-to-date, as recommended in the `README.md`.

## Proposed Changes

### Setup Scripts

#### [MODIFY] [start.bat](file:///c:/Users/ADMIN/Desktop/prod-adecos/start.bat)
- Add a check for `pnpm` availability.
- If missing, attempt to install it via `npm install -g pnpm`.
- Add `call pnpm prisma generate` before starting the dev server to ensure the environment is ready.

### Documentation

#### [MODIFY] [README.md](file:///c:/Users/ADMIN/Desktop/prod-adecos/README.md)
- Update the "Quick start" section to mention that `start.bat` now handles dependency installation and Prisma generation automatically.
- Ensure all command references are consistent with the improved `start.bat` logic.

## Open Questions

- Should I also attempt to run `prisma migrate dev` automatically in `start.bat`, or keep it as a manual step to avoid accidental data loss? (Currently planning to keep it manual as per `README` warnings).

## Verification Plan

### Automated Tests
- Run the updated `start.bat` in the current environment to ensure it correctly identifies `pnpm` (which is now installed) and proceeds to `prisma generate` and `dev`.

### Manual Verification
- Confirm that the `README.md` updates accurately reflect the simplified setup process.
