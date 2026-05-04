# Fix start.bat execution

The `start.bat` script fails to start the app because it calls `pnpm` (a batch/cmd script on Windows) without the `call` command. This causes execution to transfer to `pnpm` and never return to `start.bat`, effectively skipping the server start command.

## Proposed Changes

### Scripts

#### [MODIFY] [start.bat](file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/start.bat)
- Add `call` before `pnpm exec prisma generate`.
- Add `call` before `pnpm dev`.
- Add a check for `node_modules` and run `pnpm install` if missing (optional but helpful).
- Add `pause` at the end to keep the window open if the server crashes.

## Verification Plan

### Manual Verification
- Run the updated `start.bat` and verify that:
    1. Port 3000 is freed.
    2. Prisma client is generated.
    3. Next.js dev server starts.
    4. Browser opens to localhost:3000.
