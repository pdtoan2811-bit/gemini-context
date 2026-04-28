# Enhanced Project Management — Campaign-to-Project Mapping (Sandbox)

Build a comprehensive sandbox/prototype UI for the project management feature that demonstrates the full Campaign → Link Ref → Project mapping logic with mock data, edge case handling, and a scenario preview menu.

## User Review Required

> [!IMPORTANT]
> **Mock Data Only**: All data will be in-memory mock data — no real API calls. The existing project hooks (`useProjectInfoList`, etc.) will be bypassed for this sandbox page. The original project page remains untouched.

> [!IMPORTANT]
> **New Dedicated Route**: This will be built as a **new page** at `/projects/sandbox` so it doesn't interfere with the existing project management page. The sidebar will link to it.

> [!WARNING]
> **This is a front-end prototype**. The backend-sync logic (Google Ads API calls, two-way sync, etc.) is simulated with mock delays and toast notifications. No actual Google Ads API integration.

---

## Proposed Changes

### Core Data Layer — Types & Mock Data

#### [NEW] [project-campaign-types.ts](file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/src/types/project-campaign-types.ts)

New TypeScript types for the enhanced domain model:

- `SandboxProject` — Project with status (`running` / `saved` / `archived`), mapped link refs, and campaign count
- `LinkRef` — Unique URL identifier with `id`, `url`, `projectId`, `createdAt`, mapped campaign IDs
- `AdsCampaign` — Campaign with `id`, `name`, `finalUrl` (landing page), `status` (enabled/paused/removed/archived), `accountName`, `linkRefId`, `projectId`, cost/click/view metrics
- `SyncEvent` — Event log for sync history (create, migrate, disconnect, url-change, etc.)
- `ScenarioId` — Union type of all scenario identifiers

#### [NEW] [mock-project-campaign-data.ts](file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/src/data/mock-project-campaign-data.ts)

Comprehensive mock dataset covering all scenarios:

- **5 Projects**: Binance (running, 3 campaigns), Shopee (running, 2 campaigns), "Dự án Mồi" (saved, bait project), Lazada (saved, empty), TikTok Shop (archived)
- **8+ Campaigns**: Various statuses (enabled, paused, removed), different landing URLs, some sharing the same URL
- **6+ Link Refs**: Including duplicated URLs mapped to multiple campaigns
- **Event history**: Timeline of past sync events for each project

#### [NEW] [useProjectCampaignStore.ts](file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/src/hooks/useProjectCampaignStore.ts)

React context + reducer for the sandbox state machine:

- Full CRUD operations on projects, campaigns, link refs
- Scenario loader — loads a predefined scenario state
- Action handlers: `connectCampaign`, `disconnectCampaign`, `migrateCampaign`, `syncCampaigns`, `editLinkRef`, `createProject`, `archiveProject`
- Validation: link ref uniqueness across user's account, campaign single-link constraint
- Event log append for every state mutation

---

### Route & Page

#### [NEW] [page.tsx](file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/src/app/[locale]/(admin)/projects/sandbox/page.tsx)

Main sandbox page:

- `ProjectCampaignProvider` wrapping the page
- Three-panel layout:
  1. **Left sidebar** — Scenario menu (collapsible) with clickable scenario cards
  2. **Main area** — Project list (tabs: Running / Saved / All) with expandable rows to see campaigns & link refs
  3. **Right drawer** — Event log / notification feed

---

### UI Components (all in `src/containers/project-sandbox/`)

#### [NEW] [ProjectSandboxLayout.tsx](file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/src/containers/project-sandbox/ProjectSandboxLayout.tsx)

Three-column responsive layout with glassmorphism panels.

#### [NEW] [ScenarioMenu.tsx](file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/src/containers/project-sandbox/ScenarioMenu.tsx)

A sidebar menu listing **all scenarios** as clickable cards, grouped by category:

**Create Scenarios:**
1. Create empty project → shows empty project card
2. Connect & Sync campaigns → shows campaign selection modal
3. Auto-generate Link Ref (new URL) → shows link ref auto-creation
4. Auto-generate Link Ref (duplicate URL) → shows deduplication in action

**Update Scenarios:**
5. Case 3A: URL changed on Google Ads → shows disconnect + reconnect flow
6. Case 3B: Edit Link Ref on Adecos → shows two-way sync warning
7. Case 3C: Bait link flow → shows the full migrate sequence

**Delete Scenarios:**
8. Disconnect Campaign → shows campaign archived, data preserved
9. Campaign removed on Google Ads → shows auto-archive on sync

**Error/Edge Cases:**
10. Duplicate link ref across projects → shows validation error
11. API rate limit on two-way sync → shows error notification
12. Campaign with no landing page → shows warning

Each card shows: title, short description, status badge (Create/Update/Delete/Error), and a "Preview" button.

#### [NEW] [ProjectListPanel.tsx](file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/src/containers/project-sandbox/ProjectListPanel.tsx)

Main content panel:
- Tabs: **Running** (has campaigns) | **Saved** (no campaigns) | **All**
- Project cards showing: name, status, campaign count, link ref count, total spend, total clicks
- Expandable row that reveals:
  - Mapped Link Refs with their linked campaigns
  - Campaign details (name, status, final URL, metrics)
  - Quick actions (disconnect, migrate, edit link ref)

#### [NEW] [ConnectCampaignModal.tsx](file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/src/containers/project-sandbox/ConnectCampaignModal.tsx)

Modal for Connect & Sync flow:
- Shows available (unmapped) campaigns from Google Ads accounts
- Multi-select with checkboxes
- Preview of auto-generated link refs based on campaign landing URLs
- Deduplication preview (shows which campaigns share URLs)
- Confirm button triggers animated sync sequence

#### [NEW] [MigrateCampaignModal.tsx](file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/src/containers/project-sandbox/MigrateCampaignModal.tsx)

Modal for Case 3C (Bait link flow):
- Select campaign to migrate
- Input new affiliate URL
- Preview of changes (old project → new project)
- Warning about Google Ads API URL override
- Animated migration sequence

#### [NEW] [EditLinkRefModal.tsx](file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/src/containers/project-sandbox/EditLinkRefModal.tsx)

Modal for Case 3B (Edit Link Ref on Adecos):
- Current link ref info
- Input new URL
- Warning about two-way sync implications
- Cross-project validation (if new URL belongs to another project)

#### [NEW] [EventLogPanel.tsx](file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/src/containers/project-sandbox/EventLogPanel.tsx)

Right panel showing:
- Chronological event log with icons + colors per event type
- Animated entry of new events
- Filter by event type
- Toast-like notifications that pop up during scenario playback

#### [NEW] [SyncAnimation.tsx](file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/src/containers/project-sandbox/SyncAnimation.tsx)

Visual sync animation component:
- Step-by-step progress indicator during sync operations
- Shows: Scanning → Matching URLs → Creating Link Refs → Mapping Campaigns → Done
- Used across Connect, Migrate, and auto-sync scenarios

#### [NEW] [CampaignCard.tsx](file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/src/containers/project-sandbox/CampaignCard.tsx)

Reusable campaign card component:
- Campaign name, account, status badge, final URL
- Cost, clicks, impressions metrics
- Link ref association indicator
- Quick action buttons (disconnect, migrate, edit)

#### [NEW] [LinkRefCard.tsx](file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/src/containers/project-sandbox/LinkRefCard.tsx)

Reusable link ref card:
- URL with copy button
- Number of mapped campaigns
- Campaign mini-list
- Edit / detach actions

---

### Design

- Premium dark-mode-first design matching existing app aesthetics
- Glassmorphism cards with backdrop blur
- Smooth Framer Motion transitions for:
  - Scenario switching (slide/fade)
  - Campaign mapping/unmapping animations
  - Sync progress animations
  - Event log entries (stagger)
- Color-coded status system:
  - Running: `--success` green
  - Saved: `--info` blue
  - Archived: `--neutral` gray
  - Error: `--destructive` red
  - Warning: `--warning` amber
- Consistent use of CSS variables from `globals.css`

---

## Open Questions

> [!IMPORTANT]
> **Sidebar Navigation**: Should I add a new sidebar link for "Project Sandbox" or make it accessible via a button on the existing Projects page? I'll add it as a sub-link under Projects with a "🧪 Sandbox" label.

> [!NOTE]
> **Language**: The existing UI uses Vietnamese. I'll keep all sandbox UI labels in Vietnamese to match, with English scenario descriptions for clarity.

---

## Verification Plan

### Automated Tests
- Build verification: `pnpm build` to ensure no TypeScript errors
- Visual verification via browser tool: navigate to `/projects/sandbox` and test each scenario

### Manual Verification
- Click through all 12 scenarios in the scenario menu
- Verify all modals open/close correctly
- Check error/warning notifications display properly
- Test responsive behavior at different viewport sizes
- Verify dark mode rendering
