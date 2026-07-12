# Quick Start Guide

## Dependencies

Install required packages:

```bash
unipkg install any python3-gobject
unipkg install any python3-cairo
unipkg install any wtype
```

Optional — handwriting OCR in bracket mode:

```bash
unipkg install any tesseract-ocr
unipkg install any tesseract-data-eng
```

## Installation

```bash
sdgpkg install sdg-glyphs
```

Or clone the repo and run `install.sh`:

```bash
git clone https://github.com/SDG-Den/SDG-GLYPHS
cd SDG-GLYPHS
./install.sh
```

This copies files to `~/.local/SDG-GLYPHS/`, docs to `~/.local/docs/SDG-GLYPHS/`,
tips to `~/.local/tips/SDG-GLYPHS/`, and creates the `/usr/bin/sdgglyphs` symlink.

## Your first glyph

1. Press **SUPER+G** (or run `sdgglyphs` in a terminal).
2. A transparent fullscreen overlay appears.
3. Draw a glyph stroke with your pen/stylus — for example, draw an **`ls`** glyph
   (the shape of the letters L and S).
4. A green label appears with the recognised glyph name.
5. Draw a full-width horizontal line near the bottom of the screen to execute.
6. The glyph's output (`ls`) is typed into your focused window.

## CLI usage

```bash
sdgglyphs                    # Normal mode — draw and match
sdgglyphs --record           # Grid-snapped recording
sdgglyphs --record-freehand  # Freehand recording
sdgglyphs --dictionary       # Browse glyph library
```

Press `Escape` to close any mode.

## Next steps

- Learn about [TYPE/EXEC/TERM modes and session execution](02-normal-mode.md)
- [Record your own glyphs](03-recording.md)
- [Browse the glyph dictionary](04-dictionary.md)
