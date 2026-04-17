# Project Initialization Plan

This plan outlines the steps to set up the development environment for the `adecos` project.

## User Review Required

> [!IMPORTANT]
> The project requires several external services and environment variables that are currently missing:
> - **PostgreSQL Database:** A running PostgreSQL instance is required for Prisma.
> - **Keycloak:** Authentication relies on a Keycloak realm.
> - **Environment Secrets:** `NEXTAUTH_SECRET` and other API base URLs need to be defined.

Please confirm if you have these services ready or if you would like me to assist in setting up a local PostgreSQL instance using Docker.

## Proposed Changes

### Environment Setup

#### [NEW] .env
Create the local environment file from `.env.example`.

### Dependency Management

- **Install Dependencies:** Use `pnpm install` as indicated by the `pnpm-lock.yaml`.

### Database and ORM

- **Prisma Client Generation:** Run `pnpm prisma generate` to create the database client.
- **Database Schema Sync:** Run `pnpm prisma db push` once the DATABASE_URL is configured.

### Development Server

- **Start Dev Server:** Run `pnpm dev` to start the Next.js application.

## Open Questions

1.  **Database Connection:** Do you have a PostgreSQL connection string I should use, or should I create a local one?
2.  **Keycloak Credentials:** Do you have the Keycloak `ISSUER`, `CLIENT_ID`, and `CLIENT_SECRET` ready?
3.  **NextAuth Secret:** Should I generate a random `NEXTAUTH_SECRET` for you?

## Verification Plan

### Automated Tests
- Run `pnpm dev` and check for errors in the terminal.
- Verify that `prisma generate` completes successfully.

### Manual Verification
- Use the browser tool to navigate to `http://localhost:3000` and verify the landing page.
