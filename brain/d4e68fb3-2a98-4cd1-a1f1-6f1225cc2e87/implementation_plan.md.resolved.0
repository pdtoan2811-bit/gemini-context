# Antigravity Telegram Portal - Initial Implementation Plan

This plan outlines the first phase of implementing the Antigravity Telegram Bot (OpenClaw Alternative) based on the PRD. We will start by building the core middleware daemon and local execution layer.

## User Review Required
> [!IMPORTANT]
> - **Tech Stack:** I propose using **Node.js with TypeScript** and the `grammy` framework for the Telegram bot. It's fast, modern, and easy to run locally.
> - **Authentication:** We will need a Telegram Bot Token (from BotFather) and your Telegram User ID to set up the whitelist.
> - **System Commands:** Initially, the bot will execute commands on your local Windows powershell. We must ensure only YOU can talk to it.

## Proposed Changes

### 1. Project Scaffolding
We will create a new Node.js + TypeScript project in `c:/Users/Admin/Desktop/openclawAlternative/bot`.
#### [NEW] `package.json`
Dependencies: `grammy`, `dotenv`, `typescript`, `ts-node`.
#### [NEW] `tsconfig.json`
TypeScript configuration for Node.
#### [NEW] `.env.example`
Template for required environment variables (`TELEGRAM_BOT_TOKEN`, `ALLOWED_USER_IDS`).

### 2. Core Bot Middleware
#### [NEW] `src/index.ts`
Entry point for the application. Initializes the bot.
#### [NEW] `src/bot/bot.ts`
Bot setup, error handling, and basic commands.
#### [NEW] `src/bot/middleware/auth.ts`
Security middleware to immediately drop messages from any unauthorized Telegram User IDs.

### 3. Execution Layer
#### [NEW] `src/services/shell.ts`
A service to safely execute local shell commands (e.g., PowerShell on Windows) and stream the output back to Telegram.
#### [NEW] `src/bot/handlers/commandHandler.ts`
Handles specific commands like `/run npm install` or natural language forwarding.

## Verification Plan

### Automated Tests
- Run `npm run build` to ensure TypeScript compiles successfully without type errors.

### Manual Verification
1.  Initialize the bot with a test Token and Whitelist ID.
2.  Send a message from an unauthorized account to verify it is blocked.
3.  Send a `/ping` command from the authorized account.
4.  Send a basic shell command (e.g., `/run echo "Hello from PC"`) and verify the output is sent back to the Telegram chat.
