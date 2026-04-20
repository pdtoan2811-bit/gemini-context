# Implementation Plan: Dashboard & Navigation System

## Goal
Build a comprehensive dashboard system with sidebar navigation, project management, and Google Ads analytics integration.

## User Requirements Summary

### 1. Table Improvements
- ✅ Move "Lưu dự án" button to each row (not footer)
- Add save functionality per program

### 2. Sidebar Navigation
- Left sidebar menu with:
  - Chat (current feature)
  - Saved Projects list
- Collapsible/expandable design
- Matches app aesthetic

### 3. Google Ads Dashboard (New Page)
- **Metrics Display:**
  - Campaign cost (VND)
  - Traffic/clicks
  - CPC (Cost Per Click)
  
- **Filtering & Grouping:**
  - Date picker (range selection)
  - Group by: Day / Week / Month
  - Filter by: Program joined
  - Filter by: Keywords used
  
- **Data Requirements:**
  - Mock data in VND
  - Date range: 01/10/2026 to 31/12/2026
  - Realistic campaign data
  
- **UI/UX:**
  - Professional dashboard layout
  - Charts matching app aesthetic (minimalist, elegant)
  - Use chart library (Recharts recommended)

## Proposed Architecture

### Frontend Structure
```
src/
├── components/
│   ├── Sidebar.jsx (NEW)
│   ├── SaveButton.jsx (NEW)
│   ├── DashboardChart.jsx (NEW)
│   └── ResultsTable.jsx (UPDATE)
├── pages/
│   ├── ChatPage.jsx (REFACTOR from App.jsx)
│   ├── ProjectsPage.jsx (NEW)
│   └── DashboardPage.jsx (NEW)
├── data/
│   └── mockAdsData.js (NEW)
└── App.jsx (UPDATE - routing)
```

### Technology Choices

**Chart Library: Recharts**
- ✅ React-native, composable
- ✅ Highly customizable styling
- ✅ Clean, minimal aesthetic by default
- ✅ Supports line, bar, area charts
- ✅ Good for time-series data
- ✅ MIT license

**Routing: React Router**
- Already a standard for React SPAs
- Simple to integrate

**State Management:**
- LocalStorage for saved projects (MVP)
- React Context for global state

## Implementation Phases

### Phase 1: Table Button Alignment (15 mins)
- [x] Move "Lưu dự án" button from footer to each row
- [x] Add save handler (localStorage for now)
- [x] Update styling for row button

### Phase 2: Sidebar Navigation (30 mins)
- [ ] Create Sidebar component
- [ ] Add routing (React Router)
- [ ] Create page components (Chat, Projects, Dashboard)
- [ ] Update App.jsx with layout

### Phase 3: Saved Projects Page (20 mins)
- [ ] Display saved programs from localStorage
- [ ] Grid/table layout
- [ ] Delete functionality
- [ ] Empty state

### Phase 4: Google Ads Dashboard (60 mins)
- [ ] Create mock data generator (VND, Oct-Dec 2026)
- [ ] Install Recharts: `npm install recharts`
- [ ] Build DashboardPage layout
- [ ] Implement date picker
- [ ] Add group by controls (day/week/month)
- [ ] Add filter controls (program, keyword)
- [ ] Create custom chart components matching aesthetic
- [ ] Implement data filtering/grouping logic

## Mock Data Structure

```javascript
{
  campaigns: [
    {
      id: "camp_001",
      name: "Forex Exness - Brand",
      program: "Exness",
      dateRange: { start: "2026-10-01", end: "2026-12-31" },
      dailyData: [
        {
          date: "2026-10-01",
          clicks: 1250,
          cost: 3750000, // VND
          conversions: 12,
          revenue: 4800000, // VND
          keywords: ["forex vietnam", "exness review"]
        },
        // ... more days
      ]
    }
  ]
}
```

## Chart Aesthetic Guidelines

To match app's minimalist luxury aesthetic:
- **Colors:** White/gray gradients on dark background
- **Fonts:** Same as app (font-sans, font-serif for numbers)
- **Lines:** Thin, elegant strokes
- **Grid:** Subtle white/10 opacity
- **Tooltips:** Glassmorphic (bg-white/5, backdrop-blur)
- **Animations:** Smooth, subtle

Example styling:
```jsx
<LineChart>
  <Line 
    stroke="rgba(255,255,255,0.8)" 
    strokeWidth={2}
    dot={{ fill: 'white', r: 4 }}
  />
  <XAxis 
    stroke="rgba(255,255,255,0.2)"
    style={{ fontSize: '12px', fontFamily: 'sans-serif' }}
  />
</LineChart>
```

## Dependencies to Install

```bash
npm install react-router-dom recharts date-fns
```

- `react-router-dom`: Page routing
- `recharts`: Chart library
- `date-fns`: Date manipulation for grouping

## File Changes Summary

**New Files:**
- `frontend/src/components/Sidebar.jsx`
- `frontend/src/components/SaveButton.jsx`
- `frontend/src/components/DashboardChart.jsx`
- `frontend/src/pages/ChatPage.jsx`
- `frontend/src/pages/ProjectsPage.jsx`
- `frontend/src/pages/DashboardPage.jsx`
- `frontend/src/data/mockAdsData.js`

**Modified Files:**
- `frontend/src/App.jsx` - Add routing and sidebar layout
- `frontend/src/components/ResultsTable.jsx` - Move save button to rows
- `frontend/package.json` - Add dependencies

## Verification Plan

1. ✅ Test save functionality in table rows
2. ✅ Navigate between pages using sidebar
3. ✅ Verify saved projects persist in localStorage
4. ✅ Test dashboard date filtering (Oct 1 - Dec 31, 2026)
5. ✅ Test grouping (day/week/month views)
6. ✅ Test program filter
7. ✅ Test keyword filter
8. ✅ Verify chart aesthetic matches app design
