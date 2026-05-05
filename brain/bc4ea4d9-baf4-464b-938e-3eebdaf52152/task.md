# Competitor Spy Module — Task Tracker

## Phase 1: Foundation
- [x] Types (`competitor-spy-types.ts`)
- [x] Mock data (`mock-competitor-spy-data.ts`)
- [x] Store/Hook (`useCompetitorSpyStore.tsx`)

## Phase 2: Route & Layout
- [x] Route page (`/competitor-spy/page.tsx`)
- [x] Main page component (`CompetitorSpyPage.tsx`)

## Phase 3: Feature Components
- [x] `AdCreativeCard.tsx`
- [x] `DomainSpyView.tsx`
- [x] `MediaBuyerSpyView.tsx`
- [x] `SpyTargetsList.tsx`
- [x] `SpyAlertsFeed.tsx`
- [x] `AddSpyTargetModal.tsx`

## Phase 4: Integration
- [x] Sidebar nav item (ScanSearch icon)
- [x] Admin layout labels
- [x] DashboardShell labels type
- [x] DashboardSidebar NavLabels type
- [x] Translation keys (vi: "Theo dõi đối thủ", en: "Competitor Spy")
- [x] Project list "Spy" button
- [ ] Project detail "Spy" button (deferred — SandboxDetailView is 800+ lines)

## Phase 5: Verify
- [x] Dev server compiles without errors
- [x] `/en/competitor-spy` returns 200 ✅
- [x] Design system alignment (primary blue, info, success, warning, destructive tokens)
- [ ] Browser visual test (user skipped)

## Notes
- JSON parse error on other pages (sandbox, chat) is pre-existing, not from spy module changes
