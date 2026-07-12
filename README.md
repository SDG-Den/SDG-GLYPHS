# SDG-GLYPHS

Gesture-based glyph input system for Wayland compositors. Draw symbols on a transparent overlay to type text or execute commands.

- **71 built-in glyphs** — shell commands, window management, app launchers, mode switchers
- **3 output modes** — TYPE (wtype), EXEC (shell), TERM (ghostty)
- **Session execution** — draw multiple glyphs, circle to execute as one command
- **Recording mode** — train custom glyphs (grid-snapped or freehand)
- **Dictionary browser** — view all glyphs as animated stroke cards
- **OCR bracket mode** — draw `[` write freehand `]` for handwriting recognition via Tesseract
- **Real-time matching** — RDP simplification, 32-point resample, rotation-invariant DTW

## Quick start

```bash
sdgpkg install sdg-glyphs
sdgglyphs                 # Draw glyphs
sdgglyphs --record        # Record custom glyphs
sdgglyphs --dictionary    # Browse glyph library
```

## Dependencies

`python3-gobject`, `python3-cairo`, `wtype` — optional: `tesseract-ocr`

## Documentation

Full docs at `~/.local/docs/SDG-GLYPHS/` after install, or browse the `docs/SDG-GLYPHS/` directory in this repo.

## Related

- **SDG-MANGO-CORE** — binds SUPER+G to launch sdgglyphs
