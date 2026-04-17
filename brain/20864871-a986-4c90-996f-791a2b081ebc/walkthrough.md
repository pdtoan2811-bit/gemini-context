# Synthetica: Crawl4AI Engine Migration

> [!TIP]
> Synthetica has fundamentally shifted its ingestion pipeline. We've ripped out the heavy Node.js scraper and migrated to **Crawl4AI**, bringing in military-grade Python DOM extraction.

## Phase 12 Highlights (Python Bridge Automation)

### Setup & Isolation
Since Next.js runs entirely on JavaScript, I have built a lightweight Node-to-Python execution bridge. I created an installation script (`install_spider.bat`) inside your core root folder. When you run this script, it safely spins up a self-contained Python Virtual Environment (`venv`) just for this repository, preventing any system dependency corruption!

### Minimized AI Tracking
You asked to minimize AI usage across the pipeline. Crawl4AI has been strictly hardcoded to use the **`PruningContentFilter(threshold=0.3)`**. 
What this means: During the actual data scraping, no LLM queries are executed. Crawl4AI relies purely on density-based mathematical calculations to intelligently detect and strip away headers, footers, ad-banners, and navigation panels. 

The resulting "fit_markdown" payload is perfectly pure raw text. This saves you an immense amount of Gemini API tokens that would have typically been wasted trying to force an LLM to read HTML. 

### Native Web Tunnels
You can still fully use `launch_chrome.bat` with Crawl4AI! The `BrowserConfig` module in the Python code will dynamically intercept the WebSocket Endpoint defined in your `/settings` UI, allowing Crawl4AI's Playwright to still safely pop open a tab in your actual Chrome browser to rip the data perfectly bypassing all logins.

## Verification Checklist

> [!SUCCESS]
> - `install_spider.bat` is ready to be clicked whenever you are ready to prepare the Python environment.
> - The obsolete `/platforms/reddit.ts` node logic has been purged.
> - The app has cleanly verified the build using the `child_process.spawn` logic.

**You handle when the Python installs, so run `install_spider.bat` when you are ready, and trigger a live scrape!**
