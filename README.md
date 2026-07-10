# SDG-GLYPHS

Gesture-based glyph input system for Wayland compositors. Draw symbols on a transparent overlay to type text or execute commands.

## Description

SDG-GLYPHS lets pen/stylus users draw rune-shaped strokes on a fullscreen overlay. Strokes are matched against 71 built-in glyphs via DTW (Dynamic Time Warping) — no keyboard needed. Supports three output modes: type keystrokes, run shell commands, or open in terminal.

## Features

- **71 built-in glyphs** — shell commands, window management, app launchers, mode switchers
- **3 output modes** — TYPE (wtype), EXEC (shell), TERM (ghostty)
- **Session execution** — draw multiple glyphs, circle to execute as one command
- **Recording mode** — train custom glyphs (grid-snapped or freehand)
- **Dictionary browser** — view all glyphs as animated stroke cards
- **OCR bracket mode** — draw [ write freehand ] for handwriting recognition via Tesseract
- **Real-time matching** — RDP simplification, 32-point resample, rotation-invariant DTW

## CLI Usage

```bash
sdgglyphs                 # Open drawing surface (normal mode)
sdgglyphs --record        # Grid-snapped training mode
sdgglyphs --record-freehand  # Freehand training mode
sdgglyphs --dictionary    # Browse glyph library
```

## Installation

```bash
sdgpkg install sdg-glyphs
```

## Dependencies

- `python3-gobject` — GTK3 bindings
- `python3-cairo` — Cairo 2D vector graphics
- `wtype` — Wayland keystroke injection
- `tesseract-ocr` + `tesseract-data-eng` (optional) — handwriting OCR

## Related Packages

- **SDG-MANGO-CORE** — binds SUPER+G to launch sdgglyphs
