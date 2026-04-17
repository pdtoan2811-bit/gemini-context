# Context
The user wants to replace the clunky direct `/g` and `/run` commands with an OpenClaw-inspired agent orchestration for their Telegram bot (`openclawAlternative`).
OpenClaw's architecture relies on a central Gateway that multiplexes channels and routes requests to isolated "Sessions" and "Agents" that have specific context and tools.

## Proposed Architecture for `openclawAlternative`
Instead of exposing raw commands to the user, the bot will use a hidden orchestration layer:
1. **Sessions Manager**: Maintain conversation history and isolated context for each Telegram chat ID.
2. **Gateway / Router**: When a user sends a message, rather than executing it directly, the input is wrapped with a "system prompt" instructing Gemini to act as an Orchestrator. The Orchestrator decides whether to:
   - Call a tool (like running a shell command or checking system state).
   - Use a specific "Agent" profile.
   - Reply directly to the user.
3. **Agent Workflow**: A defined workflow for Antigravity (the coding agent) to follow when expanding and maintaining these orchestration features in the `.agents/workflows/` directory.

## Implementation Steps
### 1. `bot/src/core/SessionManager.ts`
Implement an in-memory or SQLite-backed session store to keep track of chat contexts between user and bot.

### 2. `bot/src/core/Orchestrator.ts`
A new module that formats the user's message alongside the system context, sending it to the `gemini` CLI with instructions to output JSON tool calls or direct text.
For example, the command might be: `gemini "System: You are an orchestrator. User says: [text]. Decide action..."`

### 3. Workflow File Definition
We will create a `.agents/workflows/orchestration.md` file that codifies how *this* coding agent (Antigravity) should handle further orchestration expansions for the project, such as adding new "skills" or "channels" analogous to OpenClaw.

## Verification Plan
### Automated Tests
- Run `npm run build` to verify TypeScript compiles correctly.
- Test `SessionManager` unit logic if applicable.

### Manual Verification
- Start the bot.
- Send a natural language request, e.g., "Check my system memory".
- The Gateway should route this to the Orchestrator, which uses the `gemini` CLI to determine that a shell command (`systeminfo` or equivalent) is needed, executes it hiddenly, and replies with the formatted result—without the user typing `/run`.
