# Task: Verify Mock Data Change on Ads Page

## Plan
- [x] Navigate to http://localhost:5173/ads
- [x] Perform hard refresh (Ctrl+Shift+R)
- [x] Verify existence of ecommerce products:
    - [ ] MDW_Shopee_Search_01 (Missing)
    - [ ] MDW_Lazada_Display_Low (Missing)
    - [ ] MDW_TikTok_Shop_Fashion (Missing)
    - [ ] MDW_Amazon_Store_US (Missing)
- [x] Check for persistence of old data:
    - [x] Exness (Still present)
    - [x] Binance (Still present)
- [x] If old data persists, investigate source (Network/Console)
    - Network tab is empty, suggests data is local/bundled.
- [x] Report findings
- [ ] Report findings

## Observations
- Navigated to `/ads`.
- Performed hard refresh (Ctrl+Shift+R).
- Old data persists: 'MDW_Exness_Search_01', 'MDW_Binance_Video', 'MDW_Fintech_Lead' are still present in 'Quản lý ID' and 'Tài khoản Ads'.
- 'Quản lý chiến dịch' shows 'Forex Exness', 'Crypto Binance', 'Beauty Sephora', 'Gaming Razer', 'Forex XM Trading'.
- Expected ecommerce names ('MDW_Shopee_Search_01', etc.) are NOT found on the Ads page.
- However, the 'Deep Research' page *is* correctly updated with Shopee, Lazada, Amazon, and TikTok Shop data.
- Network requests for data are not visible, suggesting data is bundled or imported from local JS files that were either not updated or the Ads page is using different ones.
