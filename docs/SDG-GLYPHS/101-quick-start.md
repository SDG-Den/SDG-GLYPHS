# Quick Start Guide

## Installation

```bash
sdgpkg install sdg-glyphs
```

This copies files to `~/.local/SDG-GLYPHS/`, docs to `~/.local/docs/SDG-GLYPHS/`, tips to `~/.local/tips/SDG-GLYPHS/`, and creates the `/usr/bin/sdgglyphs` symlink.

## Your first glyph

1. Press **SUPER+G** (or run `sdgglyphs` in a terminal).
2. A transparent fullscreen overlay appears.
3. Draw a glyph stroke with your pen/stylus — for example, draw an **`ls`** glyph
   (the shape of the letters L and S).
4. A green label appears with the recognised glyph name.
5. Draw a circle to execute the glyph.
6. The glyph's output (`ls`) is typed into your focused window.

## Browsing the dictionary

Before recording your own glyphs, browse the built-in library:

```bash
sdgglyphs --dictionary
```

Or launch it from the desktop entry if one was installed. This shows all available glyphs with animated stroke previews.

## CLI usage

```bash
sdgglyphs                    # Normal mode — draw and match
sdgglyphs --record           # Grid-snapped recording
sdgglyphs --record-freehand  # Freehand recording
sdgglyphs --dictionary       # Browse glyph library
```

Press `Escape` to close any mode.

## Desktop launcher

After installation, **SDG-Glyphs** appears in your application menu.  Click the
icon to open the dictionary browser.  **Right-click** the icon for a menu of
alternate entry points:

| Action                | Runs                          |
|-----------------------|-------------------------------|
| Open Drawing Surface  | `sdgglyphs` (main interface)  |
| Record New Glyph      | `sdgglyphs --record`          |
| Record New Glyph (freehand) | `sdgglyphs --record-freehand` |

You can also pin the launcher to your dock or taskbar for quick access.

## Next steps

- Learn about [TYPE/EXEC/TERM modes and session execution](201-main-interface.md)
- [Record your own glyphs](202-recording.md)
- [Browse the glyph dictionary](203-dictionary.md)
