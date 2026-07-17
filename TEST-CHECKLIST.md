# Test Checklist — SDG-GLYPHS

## Core Functionality
- [ ] Launch via `sdgglyphs` (or SUPER+G)
- [ ] Transparent overlay appears
- [ ] Draw a glyph — recognized and typed at cursor
- [ ] Draw a circle — executes bound command/action
- [ ] Clear button works
- [ ] Exit button / Escape closes overlay

## Recording
- [ ] Recording mode: draw new glyph, name it, save to dictionary
- [ ] Grid-snapped recording produces clean glyphs
- [ ] Freehand recording produces accurate glyphs

## Dictionary
- [ ] Dictionary browser opens, shows saved glyphs
- [ ] Carousel auto-scrolls through dictionary entries

## Cleanup
- [ ] Overlay closes cleanly on SIGINT / SIGTERM
- [ ] No dangling processes after close
