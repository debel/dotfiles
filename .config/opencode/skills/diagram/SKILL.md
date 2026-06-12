---
name: diagram
description: Generate clear, well-structured SVG diagrams (flowcharts, sequence diagrams, architecture diagrams) from text descriptions. Use when the user asks for a diagram, flowchart, or visual representation of a process or system.
---

## What I do

I produce production-quality SVG diagrams — flowcharts, sequence diagrams, architecture diagrams, process flows.

## Workflow

### 1. Sketch the flow

Always begin by laying out the diagram as a text/ascii flowchart:

    A -> B -> C
    B -> D (branch: true/false)
    D -> E (success)
    D -> F (error/edge case)

For sequence diagrams, use:

    A: message()
    B: receive() -> reply()

Include failure paths, edge cases, and decision points.

### 2. Define structure

Decide on:

- **Dimensions** — default 600x600, adjust to fit the diagram on a single slide
- **Layout direction** — left→right, top→bottom, or hybrid depending on the flow
- **Node count** — cap to avoid overcrowding; split into multiple diagrams if needed

### 3. Node shapes

Use a consistent, semantic set of shapes:

| Shape | Use for | SVG element |
|-------|---------|-------------|
| Rounded rectangle | Process steps | `<rect rx="8" ry="8">` |
| Diamond | Decision points | `<polygon>` |
| Rectangle (sharp) | External services / DBs | `<rect>` |
| Circle | Start / End points | `<circle>` |
| Cylinder | Data stores | `<path>` |
| Parallel lines | External endpoints / APIs | `<rect>` with `stroke-dasharray` |

### 4. Dimensions and layout

- Compact nodes — minimal text, no legends
- Adequate spacing between elements
- No overlapping paths
- Every arrow head must land on a node or terminal — no dangling arrows
- Center the diagram on the canvas with padding

### 5. Style — dark mode default

- Dark fills (`#1e1e2e`, `#181825` etc.), light text (`#cdd6f4` or similar)
- One color per category: green = success, red = error, blue = process, yellow = decision
- Rounded rectangles for steps, diamonds for decisions
- Readable fonts: min 14px body, 16px+ labels
- Subtle stroke colors for contrast

### 6. Verify correctness

Before outputting:

- Every arrow lands on a node — no orphans
- Labels match the actual steps
- Flow is complete (includes error/failure paths)
- Colors are semantically consistent
- SVG is self-contained, no external dependencies

## Code guidelines

- Output only raw SVG — no markdown code fence, no explanation text
- Use SVG `<style>` block for CSS, not inline styles everywhere
- Group related elements with `<g>` tags
- Use `<defs>` for gradients and markers (arrowheads)
