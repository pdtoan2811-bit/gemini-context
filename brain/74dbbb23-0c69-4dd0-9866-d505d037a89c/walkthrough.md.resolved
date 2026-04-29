# Walkthrough: Project Management PRD

## What Was Done

Created a comprehensive **PRD (Product Requirements Document)** for the Adecos Project Management module by analyzing both the **Sandbox** (prototype) and **Production** codebases.

## Files Analyzed

### Production
| File | Purpose |
|------|---------|
| [projects/page.tsx](file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/src/app/%5Blocale%5D/%28admin%29/projects/page.tsx) | Project list page with table/grid views |
| [AddProjectModal.tsx](file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/src/containers/projects/AddProjectModal.tsx) | Add/Edit project form (4 sections) |
| [ProjectDetailLayout.tsx](file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/src/containers/project-detail/ProjectDetailLayout.tsx) | Detail page tab layout |
| [ProjectInfoContent.tsx](file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/src/containers/project-detail/ProjectInfoContent.tsx) | Project info + policy cards |
| [TrafficContent.tsx](file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/src/containers/project-detail/TrafficContent.tsx) | Traffic KPIs, charts, country table |

### Sandbox
| File | Purpose |
|------|---------|
| [ProjectListPanel.tsx](file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/src/containers/project-sandbox/ProjectListPanel.tsx) | Sandbox project list + scenario system |
| [SandboxDetailView.tsx](file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/src/containers/project-sandbox/SandboxDetailView.tsx) | 4-tab detail view (1637 lines) |
| [ConnectCampaignModal.tsx](file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/src/containers/project-sandbox/ConnectCampaignModal.tsx) | Campaign connection with dedup + migration |
| [MigrateCampaignModal.tsx](file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/src/containers/project-sandbox/MigrateCampaignModal.tsx) | Campaign migration between projects |
| [EditLinkRefModal.tsx](file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/src/containers/project-sandbox/EditLinkRefModal.tsx) | Link Ref URL editing + two-way sync |

### Data Layer
| File | Purpose |
|------|---------|
| [project-campaign-types.ts](file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/src/types/project-campaign-types.ts) | Type definitions (222 lines) |
| [useProjectCampaignStore.tsx](file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/src/hooks/useProjectCampaignStore.tsx) | State management (789 lines) |

## Output

PRD saved to: [docs/PRD_PROJECT_MANAGEMENT.md](file:///c:/Users/Admin/Desktop/adecosProjectProPrototype/docs/PRD_PROJECT_MANAGEMENT.md)

### PRD Coverage

| Section | Screens | User Stories | Acceptance Criteria | Test Cases |
|---------|---------|-------------|-------------------|------------|
| Screen 1: Project List (Prod) | 1 | 7 | 8 | 8 |
| Screen 2: Add/Edit Modal | 1 | 6 | 10 | 8 |
| Screen 3: Detail - Info (Prod) | 1 | 5 | 11 | 6 |
| Screen 4: Detail - Traffic (Prod) | 1 | 5 | 8 | 6 |
| Screen 5: Sandbox List + Connect | 4 modals | 10 | 25 | 10 |
| Screen 6A: Ads Performance | 1 | 7 | 12 | 8 |
| Screen 6B: Connection Report | 1 | 9 | 16 | 15 |
| Screen 6C: Project Analysis | 1 | 3 | 5 | 3 |
| Screen 6D: Project History | 1 | 3 | 8 | 6 |
| **Total** | **12 screens** | **55 stories** | **103 criteria** | **70 test cases** |

## Verification

- ✅ PRD covers all 12 screens/tabs from both Sandbox and Production
- ✅ All user stories are prioritized (P0/P1/P2)
- ✅ All acceptance criteria are checkboxed for dev tracking
- ✅ All test cases have Steps + Expected format
- ✅ ER diagram documenting data model relationships
- ✅ State action reference table for developer context
- ✅ Open questions flagged for product/stakeholder decisions
