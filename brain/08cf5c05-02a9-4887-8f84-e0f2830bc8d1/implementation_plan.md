# The "Cinematic Canvas" Revamp Plan

You are completely right. Simply stretching an SVG using `preserveAspectRatio="none"` creates distorted, oval-shaped data pulses and loses the premium feel. We need a storytelling approach. 

To achieve the "creative, proper demonstration" you requested, I propose introducing a **Cinematic Camera Panning Workflow**.

## Technical Approach: The Virtual Canvas
Instead of forcing the elements to stretch to the container, we will build a fixed-size, beautiful "Virtual Canvas" (e.g., 800x300px). The Bento Box container will act as a "Camera Lens" (`overflow-hidden`) looking into this canvas. We will use Framer Motion to animate the `x`, `y`, and `scale` of the canvas, effectively panning and zooming the camera to tell the story.

Because the canvas has fixed dimensions, the SVG curves and data pulses will remain perfectly circular and beautifully proportioned regardless of screen size.

### The Camera Sequence

| Sequence | Story Beat | Camera Action (Framer Motion) | Focus |
| :--- | :--- | :--- | :--- |
| **0. Init** | System connecting to Data Sources | Camera zooms in (`scale: 1.2`) and pans **LEFT**. | Focuses strictly on the 3 Ads Accounts sliding in. |
| **1. Sync** | Data begins flowing | Camera slowly tracks to the **RIGHT**. | We follow the glowing data balls along the SVG paths. |
| **2. Rollup** | Hub calculates Aggregated Cost | Camera settles on the **RIGHT** side (`scale: 1.1`). | Focuses on the Project Hub as numbers tick up to `$4,100`. |
| **3. Override**| Manual Ref Count Input | Camera pushes in closer. | Focuses on the "Manual Sync" overlay popping up. |
| **4. Reveal**| True CPA & ROI Calculated | Camera pulls *way back* (`scale: 0.7 - 0.9` depending on screen) and centers `x: 0`. | The user sees the fully unified pipeline end-to-end. |

## Why This Works
1. **No Distortion:** SVGs maintain perfect geometric ratios (perfectly round data dots).
2. **High-End Apple/Vercel Aesthetic:** Camera tracking is a hallmark of premium landing pages. It guides the user's eye exactly where the action is happening.
3. **Space Utilization:** By intentionally zooming and panning, we "utilize the space" by making the space *dynamic*. When we zoom in, the nodes fill the box. When we zoom out, the massive end-to-end pipeline fills the box.

## User Review Required
> [!IMPORTANT]
> This will completely replace the stretched layout with a tracked camera layout. I will write custom SVG coordinates for an 800x300 world and use `<motion.div>` on the wrapper to handle the pan/zoom logic. 
> 
> Does this Cinematic Camera approach align with your vision for a creative, proper demonstration?
