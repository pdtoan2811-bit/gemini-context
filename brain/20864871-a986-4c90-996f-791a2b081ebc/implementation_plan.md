# Phase 12: Crawl4AI Engine Migration

You've requested to rip out the Node.js Playwright stealth scraper and integrate the cutting-edge **Crawl4AI** (`unclecode/crawl4ai`) Python engine, while strictly using it for pure raw-data (Markdown) extraction to minimize redundant AI token usage!

Since Synthetica is currently a Node.js/Next.js application, and Crawl4AI is a highly optimized Python framework, we have to bridge the two languages natively.

## User Review Required

> [!WARNING]
> Because Crawl4AI is a Python library, this architecture requires Python to be installed on your Windows machine. Please verify you are OK with us spawning a Python Child Process from our Node application!

## Proposed Changes

---

### Part 1: Python Scraper Bridge
We will write a dedicated Python script that executes the Crawl4AI logic and prints the payload back to our Javascript server.

#### [NEW] `src/lib/scraper/crawl_bridge.py`
- We will construct an asynchronous python script using `crawl4ai.AsyncWebCrawler`.
- We will strictly use the `CrawlerRunConfig(content_filter=PruningContentFilter())` to extract pure "fit_markdown" (which strips ads, footers, and noise) **without** triggering its built-in `LLMExtractionStrategy`. This honors your request to minimize AI usage in the scraping step, saving your Gemini calls for the Synthesis phase!
- It will parse arguments passed by Node.js, and print the resulting JSON string to `stdout`.

### Part 2: Next.js Bridge Wiring
We will completely gut our existing Node Playwright Engine and replace it with a command handler.

#### [MODIFY] `src/lib/scraper/engine.ts`
- Remove the Node Playwright/Stealth dependencies.
- Replace the `triggerLiveIngestion` pipeline with `child_process.spawn`.
- We will map the `wsEndpoint` (e.g., `http://localhost:9222`) that you input in the Settings UI and pass it to Crawl4AI's `BrowserConfig` so that it **still connects to your native Chrome profile!**

### Part 3: Isolated Installation
I will generate a setup script for you so you don't have to manually figure out the python dependencies.

#### [NEW] `install_spider.bat`
- A script that automatically builds a `venv` (virtual environment) specifically for Synthetica.
- It will execute `pip install "crawl4ai"` and run the `crawl4ai-setup` binary to prepare the headless browsers explicitly in isolation.

## Open Questions

> [!IMPORTANT]
> 1. Do you have Python 3.9+ currently installed on your Windows system?
> 2. You mentioned "don't auto run it". To clarify, are you asking me to *hold off* on executing the installation shell scripts so you can test/verify it first manually?

## Verification Plan
1. You run the `install_spider.bat` to download the Crawl4AI python libraries safely.
2. I will wire `page.tsx` so that when you hit Scrape, Node spins up `crawl_bridge.py`.
3. The UI will render perfectly clean, pre-filtered Markdown content ready for Gemini ingestion.
