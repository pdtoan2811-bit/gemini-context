# Data Storage & Scaling Strategy

Since the telemetry log captures *every single state change* across all tasks and users, the Google Sheet will inevitably become massive. Fetching thousands of rows on every page load will cause browser memory issues and slow down the Apps Script endpoint. 

Here are three distinct strategies to handle this at scale, ranging from immediate fixes to enterprise-grade solutions:

## 1. The Lightweight Approach (API Filtering)
**How it works**: We keep Google Sheets as the database, but we stop fetching everything. We modify the Apps Script `doGet` function to accept query parameters like `?sprint=7` or `?days=14`.
- **Pros**: Zero cost, no new infrastructure, very easy to implement immediately.
- **Cons**: Still relies on Google Sheets API (which has rate limits). Historical data isn't visible in the tool unless specifically requested.

## 2. The Local-First Approach (IndexedDB Sync)
**How it works**: We use a library like `Dexie.js` or `localforage` to store the sprint logs entirely inside the user's browser (IndexedDB). 
When the app loads, it passes the timestamp of the *last synced log* to the Google Apps Script (`?since=timestamp`). The script only returns *new* rows since that exact second. The browser appends them to its local database.
- **Pros**: Blazing fast once loaded (feels instant). Infinite storage capacity within the browser. Works completely offline.
- **Cons**: If a user clears their browser cache or logs in from a new device, they have to do a massive initial sync.

## 3. The Enterprise Approach (Migration to PostgreSQL / Supabase)
**How it works**: We completely replace Google Sheets as the main storage, or we use it merely as a generic input interface. We set up an App Script *Trigger* (`onChange`) that instantly pushes any new row to a real database like **Supabase**. The Next.js app is then directly connected to Supabase.
- **Pros**: Proper indexing, zero payload size issues, instant real-time websocket updates, robust querying.
- **Cons**: Requires setting up a Supabase project and writing migrating scripts.

---

### My Recommendation
If this tool is going to be used heavily by multiple people for months, **Option 3 (Supabase)** is the gold standard. 

However, if you want to keep Google Sheets as the absolute source of truth, **Option 1 (API Filtering)** is the easiest immediate fix. We just add a dropdown to the UI to select a "Sprint", and the API only sends rows matching that Sprint.

*Which direction would you like to take this?*
