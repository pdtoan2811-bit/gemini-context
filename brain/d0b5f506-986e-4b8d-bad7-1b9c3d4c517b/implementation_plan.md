# Adecos Project Pro Demo — Implementation Plan

An interactive demo application showcasing the core business logic of the Adecos platform: **Project ↔ Link Ref ↔ Campaign Ads** relationships, including Create, Update, and Delete flows with Google Ads integration simulation.

## Tech Stack

- **Vite + React 18** (fast dev, modern tooling)
- **shadcn/ui** (Radix-based components with Tailwind CSS)
- **Lucide React** (icons)
- **Recharts** (charts for traffic stats)
- **React Router** (routing between pages)
- **Zustand** (lightweight state management for the demo state)

## Proposed Changes

### 1. Project Scaffold

#### [NEW] Vite React project
- Initialize with `npx create-vite@latest ./ --template react`
- Install Tailwind CSS + shadcn/ui via CLI
- Install dependencies: `zustand`, `react-router-dom`, `recharts`, `lucide-react`

---

### 2. Data Model & State (`src/store/`)

#### [NEW] `useStore.js` — Zustand store
- **Projects**: `{ id, name, platform, url, status, createdAt, linkRefs: [] }`
- **Link Refs**: `{ id, url, projectId, campaignIds: [], clicks, conversions, createdAt }`
- **Campaign Ads**: `{ id, name, googleAdsId, finalUrl, status, linkedLinkRefId, linkedProjectId, history: [] }`
- **Activity Log**: timestamped entries recording every action for the timeline view
- Pre-seeded with demo data (Binance, ChatGPT, Snov.io projects)

**Key business logic methods on the store:**
| Method | Logic |
|---|---|
| `createProject(name)` | Creates empty project |
| `connectCampaigns(projectId, campaignIds)` | Scans finalUrl of each campaign → deduplicates → creates/reuses Link Refs → maps campaigns |
| `syncFromGoogleAds()` | Simulates re-sync: detects URL changes on campaigns → auto-disconnect from old Link Ref → create/map to new Link Ref |
| `editLinkRefOnApp(linkRefId, newUrl)` | Two-way sync simulation → updates Google Ads finalUrl → if new URL belongs to different project, disconnects campaign |
| `migrateCampaign(campaignId, newUrl, targetProjectId)` | Bait-link flow → overwrite finalUrl on Google Ads → migrate campaign to target project |
| `disconnectCampaign(campaignId)` | Archives campaign, cuts sync chain, keeps Link Ref + historical data |
| `handleGoogleAdsPause(campaignId)` | Sets campaign to Archived/Paused, preserves lineage |

---

### 3. UI Layout & Navigation (`src/components/layout/`)

#### [NEW] `Sidebar.jsx`
- Matches the Adecos sidebar from references (dark left panel)
- Navigation items: Dashboard, Project Management, Ads Management, Activity Log
- User avatar at bottom

#### [NEW] `AppLayout.jsx`
- Sidebar + main content area with breadcrumb header
- Consistent with the reference screenshots

---

### 4. Pages (`src/pages/`)

#### [NEW] `Dashboard.jsx`
- Overview cards: total Projects, total Link Refs, total Campaigns, active syncs
- Quick-action buttons for the 3 demo scenarios

#### [NEW] `ProjectList.jsx`
- Table view matching the reference screenshot (STT, Mảng, Dự án, Link, Hoa hồng, etc.)
- "Thêm dự án" button → modal to create project
- Click row → project detail

#### [NEW] `ProjectDetail.jsx`
- Tabs: "Thông tin dự án" + "Campaign Ads" + "Link Refs"
- Project info card (matching reference screenshot 2)
- Campaign Ads tab: table of connected campaigns with status badges
- Link Refs tab: table showing deduplication, click/conversion data

#### [NEW] `AdsManagement.jsx`
- Shows all campaigns across Google Ads accounts
- Status indicators (Active, Paused, Archived)
- Action buttons: Connect to Project, Edit Link Ref, Disconnect, Migrate

#### [NEW] `ActivityLog.jsx`
- Chronological timeline of all system actions
- Color-coded by type (Create=green, Update=blue, Delete=red, Sync=purple)
- Shows the "before → after" for every change

---

### 5. Demo Scenario Components (`src/components/demo/`)

#### [NEW] `CreateFlowDemo.jsx`
- Step-by-step wizard with animated transitions:
  1. **Create Project** → empty project shell
  2. **Authorize Google Ads** → simulated OAuth popup
  3. **Select Campaigns** → checkboxes with campaign list from "Google Ads"
  4. **Auto Link Ref Generation** → animated visualization showing:
     - Case 1: New URL → new Link Ref created
     - Case 2: Duplicate URLs → single Link Ref, multiple campaigns mapped
  5. **Result** → final state diagram

#### [NEW] `UpdateFlowDemo.jsx`
- Tabbed scenarios (3A, 3B, 3C):
  - **Case 3A**: URL changed on Google Ads → sync detects → disconnect → reconnect animation
  - **Case 3B**: Edit Link Ref on Adecos → two-way sync → API call visualization → project disconnect warning
  - **Case 3C**: Bait link flow → step-by-step: clean link → approval → swap to affiliate URL → migrate project

#### [NEW] `DeleteFlowDemo.jsx`
- Two scenarios with before/after state:
  - **Disconnect from App**: Campaign archived, Link Ref + data preserved
  - **Paused on Google Ads**: Auto-detect on sync, status change, lineage preserved

#### [NEW] `FlowDiagram.jsx`
- Visual relationship diagram: Project → Link Refs → Campaigns
- Animated connections showing data flow
- Color-coded states (active=green, archived=gray, syncing=blue pulse)

---

### 6. Shared Components (`src/components/ui/`)

#### shadcn/ui components to install:
- `button`, `card`, `dialog`, `table`, `tabs`, `badge`, `input`, `select`, `toast`, `tooltip`, `separator`, `avatar`, `dropdown-menu`, `alert`

#### [NEW] Custom components:
- `StatusBadge.jsx` — color-coded status indicators
- `FlowArrow.jsx` — animated connection lines between entities
- `StepIndicator.jsx` — numbered step progress for wizard flows
- `EntityCard.jsx` — Project/LinkRef/Campaign visual cards for diagrams

---

### 7. Styling

- **Color palette**: Match Adecos branding (warm orange accent #E97A2B, dark sidebar, clean white content)
- **Typography**: Inter font family
- **Animations**: CSS transitions for flow diagrams, framer-motion-like step transitions
- Dark sidebar matching reference screenshots
- Card-based layout for detail pages

---

## Verification Plan

### Automated Tests
- Launch dev server with `npm run dev`
- Browser testing to verify all 3 flows work end-to-end

### Manual Verification
- Visual comparison with reference screenshots
- Test all demo scenarios step by step
- Verify data consistency (Link Ref uniqueness, campaign mapping rules)
- Check responsive layout

## Open Questions

> [!IMPORTANT]
> **Language**: The reference screenshots use Vietnamese. Should the demo UI be in **Vietnamese** or **English** (or bilingual)?

> [!NOTE]
> **Scope**: This is a client-side-only demo with simulated Google Ads API calls. No actual backend or Google Ads integration. All data is in-memory via Zustand store with pre-seeded demo data.
