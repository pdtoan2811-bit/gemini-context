# Enhanced AI Chat Agent Architecture

## Background

Starting from the user's 4-layer context model (L1 Active → L4 Long-term), this plan enhances the architecture with concrete mechanisms for intent detection, tool orchestration, context switching, and memory lifecycle — then wraps it all in an interactive visual demo.

---

## 1. Enhanced Context Layer Architecture

### L1: Active Context (Hot — this turn)
- **Contents**: Current user message, last N assistant turns, pending tool outputs
- **Eviction**: Slides to L2 after each turn completes
- **Token budget**: ~4K tokens (configurable)

### L2: Working Memory (Warm — current task)
- **Contents**: `TaskFrame` stack, extracted entities, accumulated tool results
- **Structure**: A **stack** of `TaskFrame` objects — the top frame is the active task
- **Eviction**: When a TaskFrame is *resolved* or *abandoned*, it compresses to L3
- **Token budget**: ~8K tokens

### L3: Episodic Memory (Cool — session history)
- **Contents**: Compressed summaries of completed sub-tasks, key decisions, resolved entities
- **Compaction**: LLM-generated 2-3 sentence summary per closed TaskFrame
- **Eviction**: Oldest episodes drop when budget exceeded; high-salience items persist longer
- **Token budget**: ~4K tokens

### L4: Long-term Memory (Cold — cross-session)
- **Contents**: User preferences, brand voice, credentials, baseline metrics, learned patterns
- **Storage**: Key-value store or vector DB, retrieved on demand via relevance scoring
- **Token budget**: Retrieved items only, ~2K tokens per turn

---

## 2. Intent Detection Pipeline

```
User Message → Preprocessor → Intent Classifier → Slot Filler → Router
```

### Intent Taxonomy
| Intent | Signal | Example |
|---|---|---|
| `query` | Asking for information | "What's the weather in Hanoi?" |
| `command` | Requesting action | "Schedule a meeting at 3pm" |
| `follow_up` | References prior turn | "What about tomorrow?" |
| `context_switch` | New unrelated topic | "Actually, book me a flight" |
| `clarification` | Ambiguous prior response | "Which calendar?" |
| `correction` | Fixing prior input | "I meant 4pm, not 3pm" |
| `meta` | About the agent itself | "What tools do you have?" |

### Detection Strategy
- **Keyword + heuristic** layer for fast classification (regex, keyword sets)
- **Embedding similarity** against TaskFrame topics for context-switch detection
- **Confidence scoring** — if below threshold, ask for clarification

---

## 3. TaskFrame & Context Switching

### TaskFrame Structure
```
TaskFrame {
  id: string
  topic: string           // "weather_inquiry", "calendar_booking"
  intent: Intent
  entities: Map<string, any>  // { city: "Hanoi", date: "today" }
  tool_history: ToolCall[]
  status: "active" | "suspended" | "resolved" | "abandoned"
  created_at: timestamp
  summary: string | null  // Populated on resolution
}
```

### Context Switch Protocol
1. **Detect**: New message intent doesn't match top TaskFrame topic
2. **Suspend**: Current TaskFrame → status `suspended`, stays in stack
3. **Search**: Check stack for matching suspended frame (resume if found)
4. **Create or Resume**: Push new frame or resume existing one
5. **Resolve**: When task is explicitly completed or implicitly done

### Resume Detection
- User says "back to the weather" → scan suspended frames for `topic: weather`
- User says "cancel that meeting" → scan for `topic: calendar` with entity `meeting`

---

## 4. Tool Orchestration

### Tool Registry
```
Tool {
  name: string
  description: string
  parameters: Schema
  required_entities: string[]
  returns: Schema
}
```

### Selection & Chaining
1. Match intent + entities to tool requirements
2. If missing required entities → ask user (slot filling)
3. Execute tool → inject result into L1 context
4. If tool output triggers next tool → auto-chain (e.g., search → book)

### Error Recovery
- Tool timeout → retry with backoff
- Tool failure → surface error to user, suggest alternatives
- Partial result → present what's available, offer to retry

---

## 5. Interactive Demo Specification

### Tech Stack
- Single `index.html` with embedded CSS + JS
- Dark theme, glassmorphism panels, smooth animations
- No dependencies — pure vanilla

### Layout
- **Left 55%**: Chat interface (messages, typing indicator)
- **Right 45%**: Agent internals dashboard
  - Intent detection panel (real-time classification)
  - Context layers visualization (L1–L4 with live updates)
  - TaskFrame stack (visual stack with push/pop animations)
  - Tool execution log (call → result flow)
  - Entity tracker (extracted entities per frame)

### Mock Conversation Scenario (7 turns)
1. **User**: "What's the weather in Hanoi?" → `query` intent, `weather_api` tool, new TaskFrame
2. **Agent**: Returns weather data, entities extracted
3. **User**: "Schedule a meeting with Lan at 3pm tomorrow" → `command`, `calendar_api`, **context switch**
4. **Agent**: Confirms meeting scheduled
5. **User**: "What was the temperature again?" → `follow_up`, **context switch back** to weather frame
6. **Agent**: Retrieves from L2 (suspended frame), no tool re-call needed
7. **User**: "Actually cancel that meeting" → `command`, **context switch** to calendar frame, `calendar_api.cancel`
8. **Agent**: Confirms cancellation, frame resolved

### Interaction Model
- Auto-play with step-through controls
- Each step animates: message appears → intent lights up → context layers shift → tool executes → response appears

---

## Verification Plan

### Manual Verification
- Open `index.html` in browser
- Step through all 7+ conversation turns
- Verify context layer animations, TaskFrame stack updates, tool execution visualization
- Verify responsive layout at different viewport sizes
