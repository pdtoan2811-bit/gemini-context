# Setup Project Dependencies and Start Script

The goal is to prepare the environment for running the Adecos frontend by installing necessary dependencies and providing a convenient batch file for starting the development server.

## Proposed Changes

### Environment Setup
- Run `pnpm install` to install all dependencies listed in `package.json`.
- Run `pnpx prisma generate` to ensure the Prisma client is generated (since Prisma is used in the project).

### Scripts
#### [NEW] [start.bat](file:///c:/Users/Admin/Desktop/prod-2-adecos/start.bat)
Create a batch file that:
1.  Runs `pnpm install` (to ensure everything is up to date).
2.  Runs `pnpm dev` to start the Next.js development server.

## Verification Plan

### Automated Verification
- I will check the exit code of `pnpm install`.
- I will verify the existence of the `node_modules` directory and the `start.bat` file.

### Manual Verification
- The user can run `start.bat` to verify the application starts correctly.
