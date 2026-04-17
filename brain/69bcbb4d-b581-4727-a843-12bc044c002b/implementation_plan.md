# Google Ads API Compliance — Ads Management UI Enhancement

Enhance the Ads Management section of the Adecos app to demonstrate full compliance with Google Ads API requirements (Creation & Management functionality). This is the frontend-only UI that Google reviewers will inspect to verify proper API usage.

## User Review Required

> [!IMPORTANT]
> **Scope Clarification:** This plan focuses on **Creation (C.\*) and Management (M.\*)** requirements from the checklist. The **Reporting (R.\*)** requirements are already partially implemented in the Analytics page and will be addressed in a follow-up.

> [!WARNING]
> **Backend dependency:** The forms will call backend endpoints via `useApiProxyMutation`. If certain endpoints don't exist yet, the UI will still be built with the correct payloads — the backend team can wire them up later. The UI itself is what Google reviewers inspect.

## Current State Analysis

### What exists (Ads Management page — `/ads?tab=campaign`)
| Feature | Status | Checklist Items |
|---|---|---|
| Campaign list table with filters/sorting | ✅ Done | — |
| Campaign detail (overview, keywords, landing, placements) | ✅ Done | — |
| Basic "Add Campaign" modal (name, platform, budget, dates, note) | ⚠️ Partial | C.10, C.120 only |
| Pause/Enable campaign (multi-select menu items) | ⚠️ Stub | M.110 |
| Campaign status display | ✅ Done | R.20.6 |

### What's missing (needed for compliance)

**Creation:**
| Item | Requirement | Missing |
|---|---|---|
| C.10 | Create campaign | Must add: campaign type, network settings |
| C.20 | Geo targeting | No location/country selector |
| C.30 | Language targeting | No language selector |
| C.65 | Conversion tracking | No conversion setup UI |
| C.75 | Callout extensions | No callout extension UI |
| C.96 | Target CPA bidding | No bidding strategy selector |
| C.97 | Target ROAS bidding | No bidding strategy selector |
| C.98 | Maximize Conversions | No bidding strategy selector |
| C.120 | Set budget | Exists but lacks daily vs total toggle |
| C.190 | Create ad group | No ad group creation |
| C.260 | Add keyword | No keyword addition |
| C.270 | Negative keywords | No negative keyword UI |
| C.300 | Keyword match type | No match type selector |

**Management:**
| Item | Requirement | Missing |
|---|---|---|
| M.10 | Edit campaign settings | No inline edit or edit modal |
| M.96/M.97/M.98 | Edit bidding options | No bidding edit |
| M.110 | Pause/enable/remove campaign | Stub only, no API call |
| M.130 | Pause/enable/remove ad | No ad-level status control |
| M.140 | Pause/enable/remove keyword | No keyword status control |

## Proposed Changes

### Phase 1: Enhanced Campaign Creation (C.10–C.300)

---

#### [MODIFY] [AddCampaignModal.tsx](file:///c:/Users/Admin/Desktop/prod-2-adecos/src/containers/ads/AddCampaignModal.tsx)

Completely rewrite as a **multi-step campaign creation wizard** with these steps:

**Step 1 — Campaign Basics** (`C.10`, `C.120`)
- Campaign name (text input)
- Campaign type selector (Search, Display, Shopping, Video)
- Daily budget input with currency selector
- Campaign start/end date

**Step 2 — Targeting** (`C.20`, `C.30`)
- Geo targeting: multi-select location/country picker (with search)
- Language targeting: multi-select language picker

**Step 3 — Bidding Strategy** (`C.96`, `C.97`, `C.98`)
- Bidding strategy type selector:
  - Target CPA (Standard) — with target CPA input
  - Target CPA (Portfolio) — with portfolio strategy selector
  - Target ROAS (Standard) — with target ROAS input
  - Target ROAS (Portfolio) — with portfolio strategy selector
  - Maximize Conversions (Standard)
- Max CPC bid limit (optional)

**Step 4 — Conversion Tracking** (`C.65`)
- Conversion type selector (Website / Phone Call)
- Conversion name
- Code snippet display (read-only code block showing the tracking tag)

**Step 5 — Callout Extensions** (`C.75`)
- Account-level callout extension inputs (dynamic list, add/remove)
- Each callout: text input (max 25 chars)

**Step 6 — Ad Group & Keywords** (`C.190`, `C.260`, `C.270`, `C.300`)
- Ad group name input
- Keyword list textarea (one per line)
- Match type selector per keyword (Exact, Phrase, Broad)
- Campaign negative keywords section (separate textarea)

---

#### [NEW] [CampaignCreationWizard.tsx](file:///c:/Users/Admin/Desktop/prod-2-adecos/src/containers/ads/CampaignCreationWizard.tsx)

Multi-step wizard container component with:
- Step indicator (numbered progress bar)
- Back/Next/Submit navigation
- Form state persistence across steps using React Hook Form
- Zod validation schema
- Submit calls `useApiProxyMutation("digital/campaign", { method: "POST" })`

---

#### [NEW] [campaign-creation-types.ts](file:///c:/Users/Admin/Desktop/prod-2-adecos/src/containers/ads/campaign-creation-types.ts)

TypeScript types and Zod schemas for the creation form:
- `CampaignCreationFormData` interface
- `campaignCreationSchema` Zod schema
- Constants for bidding strategies, campaign types, match types

---

#### [NEW] [campaign-creation-constants.ts](file:///c:/Users/Admin/Desktop/prod-2-adecos/src/containers/ads/campaign-creation-constants.ts)

Static data constants:
- `BIDDING_STRATEGY_OPTIONS` — Target CPA, Target ROAS, Maximize Conversions
- `CAMPAIGN_TYPE_OPTIONS` — Search, Display, Shopping, Video
- `KEYWORD_MATCH_TYPES` — Exact, Phrase, Broad
- `CONVERSION_TYPES` — Website, Phone Call
- `LANGUAGE_OPTIONS` — common languages (Vietnamese, English, etc.)

---

### Phase 2: Campaign Management Actions (M.10–M.140)

---

#### [MODIFY] [CampaignManagementTab.tsx](file:///c:/Users/Admin/Desktop/prod-2-adecos/src/containers/ads/CampaignManagementTab.tsx)

Enhance the existing campaign table:
1. **Row action menu** — Add "Edit", "Pause", "Enable", "Remove" actions per row (replacing current stub actions)
2. **Bulk actions** — Wire up pause/enable/remove for multi-selected campaigns via `useApiProxyMutation`
3. **Inline status toggle** — Quick pause/enable toggle on status badge click
4. Add a prominent **"+ Create Campaign"** button in the toolbar that opens the wizard

---

#### [NEW] [EditCampaignModal.tsx](file:///c:/Users/Admin/Desktop/prod-2-adecos/src/containers/ads/EditCampaignModal.tsx)

Edit modal for campaign settings (`M.10`):
- Pre-populated form matching creation fields (name, budget, targeting, bidding)
- Uses `useApiProxyMutation("digital/campaign/{id}", { method: "PATCH" })`
- Bidding strategy edit section (`M.96`, `M.97`, `M.98`)

---

#### [MODIFY] [CampaignDetailKeywords.tsx](file:///c:/Users/Admin/Desktop/prod-2-adecos/src/containers/ads/CampaignDetailKeywords.tsx)

Add keyword management actions (`M.140`):
- Add "Pause", "Enable", "Remove" actions per keyword row
- Add "Add Keyword" button that opens inline form
- Match type displayed and editable

---

#### [NEW] [AdGroupManagement.tsx](file:///c:/Users/Admin/Desktop/prod-2-adecos/src/containers/ads/AdGroupManagement.tsx)

New component for ad-level management (`M.130`):
- Table of ads within campaign's ad groups
- Status column with pause/enable/remove actions
- Accessible from campaign detail as a new tab

---

### Phase 3: API Hooks & Types

---

#### [MODIFY] [campaign.ts](file:///c:/Users/Admin/Desktop/prod-2-adecos/src/hooks/queries/campaign.ts)

Add mutation hooks:
- `useCreateCampaign()` — POST digital/campaign
- `useUpdateCampaign(id)` — PATCH digital/campaign/:id
- `useUpdateCampaignStatus(id)` — PATCH digital/campaign/:id/status
- `useUpdateKeywordStatus()` — PATCH digital/campaign/keyword/:id/status
- `useUpdateAdStatus()` — PATCH digital/campaign/ad/:id/status

---

#### [MODIFY] [campaign-api.ts](file:///c:/Users/Admin/Desktop/prod-2-adecos/src/lib/campaign-api.ts)

Add TypeScript interfaces for:
- `CreateCampaignPayload` — full payload matching wizard steps
- `UpdateCampaignPayload` — partial update payload
- `UpdateStatusPayload` — { status: "ENABLED" | "PAUSED" | "REMOVED" }

---

### Phase 4: Campaign Detail Enhancement

---

#### [MODIFY] [CampaignDetail.tsx](file:///c:/Users/Admin/Desktop/prod-2-adecos/src/containers/ads/CampaignDetail.tsx)

Add new "Ad Groups" tab between "Keywords" and "Placements" to display `AdGroupManagement`.

---

## File Summary

| Action | File | Purpose |
|---|---|---|
| NEW | `CampaignCreationWizard.tsx` | Multi-step creation wizard (6 steps) |
| NEW | `campaign-creation-types.ts` | Zod schemas & form types |
| NEW | `campaign-creation-constants.ts` | Static option constants |
| NEW | `EditCampaignModal.tsx` | Campaign settings edit modal |
| NEW | `AdGroupManagement.tsx` | Ad group/ad status management |
| MODIFY | `AddCampaignModal.tsx` | Replace with wizard trigger |
| MODIFY | `CampaignManagementTab.tsx` | Add create button, row actions, bulk actions |
| MODIFY | `CampaignDetailKeywords.tsx` | Add keyword CRUD actions |
| MODIFY | `CampaignDetail.tsx` | Add "Ad Groups" tab |
| MODIFY | `campaign.ts` (hooks) | Add mutation hooks |
| MODIFY | `campaign-api.ts` (types) | Add create/update payload types |

## Open Questions

> [!IMPORTANT]
> 1. **Backend readiness:** Do the mutation endpoints (`POST/PATCH digital/campaign`, `PATCH .../status`) already exist, or should I build the UI with the expected payloads and let the backend team implement later?
> 2. **Geo/Language data:** Should the location and language options come from a backend API (e.g., Google's `geo_target_constant` and `language_constant` APIs) or can we use static lists for now?
> 3. **Portfolio bidding strategies:** Does the backend support portfolio bidding strategy CRUD, or should we only show standard (campaign-level) strategies for now?

## Verification Plan

### Automated Tests
- `npm run lint` — ensure no lint errors
- `npm run build` — ensure successful build
- Browser test: navigate to `/ads?tab=campaign`, click "Create Campaign", verify all 6 wizard steps render correctly

### Manual Verification
- Walk through every checklist item (C.10–C.300, M.10–M.140) and verify UI coverage
- Screenshot each step for Google compliance submission
