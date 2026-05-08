# Task: Verify Ads Sandbox

## Checklist
- [ ] Navigate to http://localhost:3001/vi/ads/sandbox
- [ ] Verify "Quản lý Ads" title and "🧪 Sandbox" badge
- [ ] Verify "Quản lý Email" tab data
- [ ] Verify "Quản lý Chiến dịch" tab data
- [ ] Verify "Tài khoản Ads" tab data
- [ ] Report findings

## Findings
- Tried http://localhost:3001/vi/ads/sandbox multiple times, but connection was refused (ERR_CONNECTION_REFUSED).
- Tried http://localhost:3000/vi/ads/sandbox, but it redirects to a login page (Keycloak).
- Tried 127.0.0.1, [::1], 0.0.0.0, and ports 3002, 3003, 3005. All refused except 3000.
- The dev server might have stopped or is not reachable from this browser instance on port 3001.
- Note: The planner mentioned the server is on 3001, but the browser cannot reach it.
- Since I cannot reach the sandbox page, I cannot verify the data or the UI.
