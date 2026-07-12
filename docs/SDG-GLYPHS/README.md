# SDG-GLYPHS — Pen-based Input for mangoWM

Draw rune-shaped glyphs with a pen/stylus to type commands or execute shell
actions.  No keyboard needed — just draw and underline.

Also supports handwriting OCR for ad-hoc text input via Tesseract.

## Topics

| # | Document | Description |
|---|----------|-------------|
| 1 | [Quick Start Guide](01-quick-start.md) | Installation, first glyph, basic usage |
| 2 | [Normal Mode](02-normal-mode.md) | TYPE/EXEC/TERM modes, session execution, strike-out, undo, carousel |
| 3 | [Recording Modes](03-recording.md) | Grid-snapped vs freehand recording |
| 4 | [Dictionary Mode](04-dictionary.md) | Browsing glyphs with animated cards |
| 5 | [Recognition Pipeline](05-recognition.md) | RDP, resampling, DTW, rotation invariance |
| 6 | [Configuration](06-configuration.md) | All config options, input filtering |
| 7 | [Integration](07-integration.md) | mangoWM keybinds, mmsg, ghostty |

## Quick reference

```bash
sdgglyphs                 # Normal mode — draw and match glyphs
sdgglyphs --record        # Grid-snapped recording
sdgglyphs --record-freehand  # Freehand recording
sdgglyphs --dictionary    # Browse glyph library
```

Press `Escape` to close any mode at any time.

## Further reading

- **man page** (if installed): `man sdgglyphs`
- **Config file**: `~/.config/SDG-GLYPHS/config.json`
- **Glyph data**: `~/.config/SDG-GLYPHS/glyphs-data/*.json`
- **Tips**: `sdgtip SDG-GLYPHS`
