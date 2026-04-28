# Data Preview & Cleaning Preparation Dashboard

Interactive dashboard built to preview and analyze your **13,222 affiliate program records** (113 MB JSON) before data cleaning.

## Dashboard Tabs

### 1. Overview
Summary cards + full schema table showing all 19 fields with types, null percentages, unique counts, and sample values.

### 2. Data Table
Paginated table (50 rows/page, 265 pages) with:
- **Search** by name, URL, or niche
- **Filters** for Industry, Commission Type, Period
- **Column toggle** to show/hide fields
- **Sortable** columns (click any header)

### 3. Data Quality (86% Score)
| Metric | Score |
|--------|-------|
| Completeness | 85.7% |
| No Duplicate IDs | 100% |
| No Duplicate URLs | 100% |
| Commission Data | 38.4% |
| Description Coverage | 96.3% |
| Currency Data | 32.9% |

**Missing data heatmap** highlighting 7 fields with nulls. **Anomaly detection** found 8 issues tagged by severity.

### 4. Distribution
Bar charts for Industry, Top 10 Niches, Commission Types, Currency, Period Month, and Has Policy.

### 5. Cleaning Plan (8 Steps)
1. **Handle Missing Commission Data** — 8,146 null commission_type + 8,922 null min/max
2. **Standardize Commission Types** — 135 unique → ~8 categories
3. **Normalize Currency** — 17 values → ISO codes + percentage flag
4. **Fix Monthly Visits Outliers** — max ~11.9B is clearly erroneous
5. **Remove Zero-Variance Fields** — status_project (all "ACTIVE")
6. **Handle Missing Descriptions** — 484 nulls
7. **Standardize Notes** — convert tag-like values to categorical
8. **Flatten Nested Fields** — policy_details (42 keys), traffic_details (4 keys)

## Key Data Findings

- **5 industries**: SP số (75.6%), SPVL (15%), Crypto (6.5%), Tài chính (2%), Forex (0.9%)
- **31 niches**, 198 sub-niches — top are Software (37.1%) and AI (29.7%)
- **Zero duplicates** on id, name, and url
- **91.2%** of records from period 2026-03
- **100%** of records have `has_policy = true`

## How to Access

The dashboard is running at **http://localhost:8080**. Files created:

- [index.html](file:///c:/Users/Admin/Desktop/dataProject/index.html) — HTML structure
- [index.css](file:///c:/Users/Admin/Desktop/dataProject/index.css) — Dark theme styling
- [app.js](file:///c:/Users/Admin/Desktop/dataProject/app.js) — All application logic

## Demo Recording

![Dashboard walkthrough](C:\Users\Admin\.gemini\antigravity\brain\313c35e1-b3d8-4fbb-9aa0-d7bced8a64db\dashboard_preview_1777344643543.webp)
