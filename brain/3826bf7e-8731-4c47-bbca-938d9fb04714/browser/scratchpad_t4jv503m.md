# Analytics Page Verification Plan

- [x] Navigate to `/vi/analytics` on :3000 -> **Next.js 404**
- [x] Try `/analytics` on :3000 -> **Next.js 404**
- [x] Try `/sandbox` on :3000 -> **Works** (Debugger sandbox)
- [x] Try `/vi/analytics` on :3001 -> **Auth locked** (Sign-in page visible).
- [x] Try Keycloak sign-in on :3001 -> **Fails** (Invalid redirect_uri: expects port 3000).
- [ ] Verify "Tổng quan" tab and take screenshot -> **Blocked by Auth**
- [ ] Verify all 6 tabs are present -> **Blocked by Auth**
- [x] Document findings and any errors.

**Conclusion:**
Verification of the `/vi/analytics` page is blocked because:
1. Port 3000 is occupied by "Sprint Relay Debugger", causing the Adecos Ads app to run on port 3001.
2. The Adecos app requires authentication.
3. The Keycloak configuration on port 3001 is broken because it is pre-configured to redirect back to port 3000, which is currently "shadowed" by the debugger.
4. As a result, the `/vi/analytics` page is inaccessible in this environment without manual port or auth configuration changes.
