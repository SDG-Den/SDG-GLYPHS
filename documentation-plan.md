# SDG-GLYPHS Documentation Plan

## Current Status
Two doc files exist: `docs/README.md` (400 lines, full documentation) and `docs/README-updated.md` (230 lines, condensed). No tips exist (placeholder only).

## Docs System (`docs/`)
**Deploy location**: `~/.local/docs/SDG-GLYPHS/`

### Existing Docs
| File | Topic |
|------|-------|
| README.md | Full documentation: quick start, normal mode, mode system, session execution, recording modes, dictionary mode, recognition pipeline, architecture, configuration, glyph list |
| README-updated.md | Condensed version referencing mangoWM instead of mangoWC |

### Planned Doc Topics
| # | Topic | Description | Priority |
|---|-------|-------------|----------|
| 1 | Quick Start Guide | Getting started with sdgglyphs in 5 minutes | High |
| 2 | Normal Mode Deep Dive | Drawing, matching, output modes, session execution, undo, strike-out | Medium |
| 3 | Recording Modes | Grid-snapped vs freehand recording, how to train new glyphs | Medium |
| 4 | Dictionary | Browsing glyphs, animated cards, understanding match quality | Low |
| 5 | Recognition Pipeline | RDP, resampling, DTW matching, rotation invariance | Low |
| 6 | Built-in Glyphs Reference | Full listing of all 71 glyphs with stroke templates | Medium |
| 7 | Configuration Reference | config.json fields: recording sections, ink width, carousel, exec prefix | Low |
| 8 | Integration | How SDG-MANGO-CORE binds SUPER+G, how SDG-TERM integrates | Low |

### Implementation
- Split README.md into focused topic files under `docs/SDG-GLYPHS/`
- Follow SDG-DOCS naming convention (`01-*.md`, `02-*.md`, etc.)

## Tips System (`tips/`)
**Deploy location**: `~/.local/tips/SDG-GLYPHS/`

### Planned Tips
| # | Tip | Description | Priority |
|---|-----|-------------|----------|
| 1 | Launch glyphs | Press SUPER+G to open the drawing surface | High |
| 2 | Switch mode | Draw the mode glyph to switch between TYPE, EXEC, TERM | High |
| 3 | Session execution | Draw multiple glyphs then circle to execute as one command | High |
| 4 | Browse dictionary | `sdgglyphs --dictionary` to see all glyphs | Medium |
| 5 | Record new glyph | `sdgglyphs --record` to train a custom glyph | Medium |
| 6 | Undo gesture | Ctrl+Z, Backspace, or strike-through to undo | Medium |
| 7 | OCR bracket mode | Draw [ write freehand ] to capture handwriting via OCR | Low |

### Implementation
- Create `tips/SDG-GLYPHS/tips.list` with the above tips
- Register in `install.sh` for deployment to `~/.local/tips/`
