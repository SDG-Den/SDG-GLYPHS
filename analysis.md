# SDG-GLYPHS Analysis

## Type
Pen/Stylus Input Module

## Description
SDG-GLYPHS is a pen/stylus-based glyph (rune-gesture) input system for Wayland compositors. Users draw rune-shaped strokes on a transparent fullscreen overlay to type text or execute shell commands — no keyboard needed.

## CLI Entry Point
- `/usr/bin/sdgglyphs` (symlink to `~/.local/SDG-GLYPHS/glyphs-cli.py`)

### Commands
| Command | Description |
|---------|-------------|
| `sdgglyphs` | Open drawing surface (Normal mode) |
| `sdgglyphs --record` | Grid-snapped recording mode |
| `sdgglyphs --record-freehand` | Freehand recording mode |
| `sdgglyphs --dictionary` | Browse all known glyphs as animated cards |

## Directory Structure
```
SDG-GLYPHS/
├── install.sh / uninstall.sh / update.sh
├── local/
│   ├── glyphs-cli.py             # CLI entry point
│   └── glyphs/                   # Python package
│       ├── app.py                # GlyphApp orchestrator
│       ├── config.py             # Config paths, load/save
│       ├── storage.py            # Glyph JSON persistence
│       ├── geometry.py           # RDP, resampling, DTW matching
│       ├── models.py             # StrokeGlyph data class
│       ├── grid.py               # Grid anchor points + BFS routing
│       ├── input.py              # Pen-event detection (rejects mice)
│       ├── widgets.py            # GlyphCard animated widget
│       ├── normal.py             # Normal overlay (drawing, matching)
│       ├── record_freehand.py    # Freehand recording overlay
│       ├── record_grid.py        # Grid-snapped recording overlay
│       └── dictionary.py         # Dictionary browser window
├── config/
│   ├── config.json               # Runtime config (appearance, recording)
│   └── glyphs-data/              # 71 glyph definition JSON files
├── other/
│   ├── SDG-GLYPHS.desktop        # Main desktop entry (3 actions)
│   └── SDG-GLYPHS-Draw.desktop   # Direct drawing shortcut
├── docs/
│   ├── README.md                 # Full documentation (400 lines)
│   └── README-updated.md         # Condensed documentation (230 lines)
└── tips/
    └── SDG-GLYPHS/
        └── .placeholder          # Empty placeholder (for future tips)
```

## Usage
After installation via `sdgpkg install sdg-glyphs`, the `sdgglyphs` command becomes available. It can also be launched via `SUPER+G` (bound by SDG-MANGO-CORE) or from the desktop entry.

### Normal Mode (Default)
Run `sdgglyphs` to open a transparent fullscreen overlay. Draw a glyph stroke with your pen/stylus:
1. The stroke is matched against 71 built-in glyphs in real-time
2. The recognized glyph name and output appear as labels on the overlay
3. **Output modes** (switch by drawing the mode glyph):
   - TYPE: types the output as keystrokes via `wtype`
   - EXEC: runs the output as a shell command
   - TERM: opens the command in a terminal (ghostty -e)
4. **Session execution**: Draw multiple glyphs in sequence to concatenate outputs. Fire the session by drawing a circle or full-width underline.
5. **Undo**: Ctrl+Z, Backspace, or on-screen button removes the last glyph
6. **Strike-out**: Scratch over a recognized label to remove it
7. **OCR bracket mode**: Draw `[`, write freehand text, draw `]` — Tesseract OCR transcribes the handwriting

### Recording Mode
- `sdgglyphs --record` — Grid-snapped recording: screen divided into N cells (default 4). Stroke snaps to anchor points via BFS graph routing. Fill all cells then name and assign output.
- `sdgglyphs --record-freehand` — Same grid but strokes kept raw (no snapping). One stroke per cell.

### Dictionary Mode
`sdgglyphs --dictionary` — Opens a scrollable window showing all known glyphs as animated cards with live stroke preview. 8 columns by default.

### Configuration
Edit `~/.config/SDG-GLYPHS/config.json`: recording sections, ink width, background transparency, carousel bar, exec prefix, terminal command.

## Recognition Pipeline
1. Raw ink → Ramer-Douglas-Peucker simplification
2. 32-point uniform resample (arc-length)
3. Scale to unit square, centre at origin
4. Y-axis flip + 12 rotations at 15°/30° intervals
5. 32 cyclic shifts per rotation
6. DTW pointwise distance across all templates
7. Threshold match (0.12) or `?`

## Output Modes
| Mode | Description |
|------|-------------|
| TYPE | Types text via `wtype` |
| EXEC | Runs as shell command via `mmsg dispatch spawn_shell` |
| TERM | Opens command in terminal (ghostty -e) |

## Built-in Glyphs (71)
Shell commands (ls, cd, grep, git, rm, etc.), window management (togglefloating, togglefullscreen, killclient, etc.), app launchers (firefox, ghostty, steam, obsidian, etc.), mode-switchers (exec, type, term, bracket-ocr)

## Required Dependencies
| Dependency | Purpose |
|------------|---------|
| python3-gobject | GTK3 bindings |
| python3-cairo | Cairo 2D vector graphics |
| wtype | Wayland typing utility |

## Optional Dependencies
| Dependency | Purpose |
|------------|---------|
| tesseract-ocr | Handwriting OCR (bracket mode) |
| tesseract-data-eng | English language data for OCR |

## Required Dependents
None (user-facing application)

## Optional Dependents
- **SDG-MANGO-CORE**: Binds `SUPER+G` to `sdgglyphs` in `binds.conf`
- **SDG-DOCS**: Documents glyph system
