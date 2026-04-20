# Implementation Plan: Refining Intent Classification

**Goal**: Ensure queries like "Top campaigns by CPC" or "Ranking" result in **Charts** (Data Analysis), not Table Lists (Data Query).

## User Review Required
> [!IMPORTANT]
> This changes how "list" vs "chart" intents are decided. Explicit requests for "list" or "table" will still get tables, but ambiguous "which is best" queries will now default to visual charts.

## Proposed Changes

### Backend

#### [MODIFY] [agents.py](file:///c:/Users/ADMIN/Desktop/adecos%20mvp/backend/agents.py)
- **`classify_intent` Prompt**:
    -   **`data_analysis`**: Covers ALL internal data queries. "List", "Show", "Rank", "Compare" own campaigns/accounts -> ALWAYS `data_analysis`.
    -   **`research`**: Covers external data. "Find programs", "Search niche", "Affiliate networks" -> `research`.
    -   **`data_query`**: REMOVE or Deprecate. User explicitly banned tables for internal data.
- **`execute_data_query_crew`**: Warn or redirect if routed here for internal data, or just remove the routing path.

## Verification Plan

### Manual Verification
1.  **Test Internal "List" Query**:
    -   Query: "List all campaigns"
    -   Expectation: Intent `data_analysis`. Result: Bar Chart (Top 10-20).
2.  **Test Research Query**:
    -   Query: "Find gaming affiliate programs"
    -   Expectation: Intent `research`. Result: Table.
