# AI Slideshow Generator Tasks

- [ ] **Project Initialization**
    - [x] Initialize Vite React project
    - [x] Install dependencies (`@google/generative-ai`, `pptxgenjs`, `jspdf`, `lucide-react`, `html2canvas`, `react-markdown`)
    - [x] Create Documentation (BRD, PRD, SRS)
    - [x] Setup global CSS and variables for Premium UI
- [x] **Core Application Structure**
    - [x] Create `App.jsx` layout (Sidebar, Main Editor, Preview)
    - [x] Create `ChatInterface` component
    - [x] Create `SlideEditor` component
    - [x] Create `SlidePreview` component
- [x] **AI Integration**
    - [x] Setup Gemini API client with `gemini-3-flash-preview`
    - [x] Implement prompt engineering for "Chat to Slides Markdown"
    - [x] Connect Chat Interface to AI generation
- [x] **Slide Editing & Preview**
    - [x] Implement Markdown parsing logic (splitting by `---`)
    - [x] Render slides in `SlidePreview`
    - [x] Sync `SlideEditor` with Preview
- [x] **Export Functionality**
    - [x] Implement PPTX export using `pptxgenjs`
    - [x] Implement PDF export using `jspdf`
- [/] **Polish & Verification**
    - [x] Verify UI aesthetics (Premium feel)
    - [x] Test Export with images and links
    - [x] Create Walkthrough

- [ ] **V2: Visual Editor & Templates**
    - [x] **Research**: Analyze `theme-apple-basic` styles
    - [x] **Architecture**: Refactor state to Slide Object Model (Array based)
    - [x] **UI Refresh**: Google Slides Layout (Sidebar Thumbnails + Main Canvas)
    - [x] **Feature**: Inline Text Editing (WYSIWYG-lite)
    - [x] **Theming**: Implement "Apple Basic" default theme style

- [ ] **V2.5: UI/UX Polish (Google Slides Fidelity)**
    - [ ] **Layout**: Fix App.jsx flex overflows & Sidebar
    - [ ] **Components**: Create `ScaledSlide` container (CSS Transforms)
    - [ ] **Canvas**: Implement "Zoom to Fit" viewport
    - [x] **Theming**: Refine "Apple Basic" typography & spacing

- [ ] **V3: Logic Rethink & UI Overhaul**
    - [ ] **Architecture**: Switch Gemini Prompt & State to JSON Schema
    - [ ] **Layout**: Reset UI to Light Mode (Classic Google Slides)
    - [ ] **Styling**: Fix Font Sizes for 1080p (Title 90px, Body 40px)
    - [ ] **Components**: Rebuild Sidebar/Canvas interaction for stability
