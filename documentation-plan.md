# SDG-GLYPHS Documentation Plan

## Current Status
Two doc files exist: `README.md` (400 lines, comprehensive) and `README-updated.md` (230 lines, condensed). The updated version references `mangoWM` (correct compositor name) vs `mangoWC` in the original, specifies 71 glyphs vs 60+, and uses 15° rotation steps vs unspecified. Zero tips exist.

## Source-Verified Inventory
**Components:**
- Gesture/glyph input recognition system
- Modes: Normal (type/exec/term), Record (grid-snapped + freehand), Dictionary, Bracket, OCR, Carousel
- Session execution, strike-out, undo
- Recognition pipeline: RDP simplification, resampling, DTW, rotation invariance (12 rotations at 15° steps)
- 71 glyphs (confirmed from source)
- Glyph data format (JSON)
- Configuration reference
- Input filtering
- Dependencies: mangoWM (NOT mangoWC)

### Doc Files to Merge
| File | Lines | Notes |
|------|-------|-------|
| `README.md` | 400 | More detailed (project structure, architecture flow, glyph data format) but references mangoWC |
| `README-updated.md` | 230 | Less detailed but references mangoWM, has 71 glyphs, 15° rotation steps |

## Docs System (`docs/`)
**Deploy location**: `~/.local/docs/SDG-GLYPHS/`

### Planned Doc Topics
| # | Topic | Description | Priority |
|---|-------|-------------|----------|
| 1 | Quick Start Guide | Installation, first glyph, basic usage | High |
| 2 | Normal Mode Deep Dive | TYPE/EXEC/TERM modes, session execution, strike-out, undo | High |
| 3 | Recording Modes | Grid-snapped vs freehand recording | High |
| 4 | Dictionary Mode | Adding and managing custom glyphs | High |
| 5 | Recognition Pipeline | RDP, resampling, DTW, rotation invariance | Medium |
| 6 | Built-in Glyphs Reference | 71 glyphs across categories (shell, window management, apps, special) | Medium |
| 7 | Configuration Reference | All config options, input filtering | Medium |
| 8 | Integration | mmsg/ghostty integration, keybinds, carousel bar | Medium |

### Existing Content
| File | Notes |
|------|-------|
| `README.md` | 400 lines — covers topics #1-7. References mangoWC (needs fix) |
| `README-updated.md` | 230 lines — covers topics #1-7 more concisely. References mangoWM, 71 glyphs, 15° rotation |

## Tips System (`tips/`)
**Deploy location**: `~/.local/tips/SDG-GLYPHS/`

### Planned Tips
| # | Tip | Priority |
|---|-----|----------|
| 1 | Draw a glyph to launch apps or type text | High |
| 2 | Switch between TYPE/EXEC/TERM modes | High |
| 3 | Record custom glyphs in record mode | High |
| 4 | Use dictionary mode to manage your glyph library | Medium |
| 5 | Strike through a glyph to delete or undo | Medium |
| 6 | Carousel bar shows available glyphs | Medium |
| 7 | Use bracket mode for paired characters | Low |

## Implementation Notes
- Merge `README-updated.md` content (mangoWM, 71 glyphs, 15° rotation) into `README.md`, preserving the original's deeper detail (project structure, architecture flow, glyph data format)
- Delete `README-updated.md` after merge
- Split the comprehensive README into focused `nn-topic-name.md` files per topic above
- Tips in `tips/SDG-GLYPHS/tips.list`
