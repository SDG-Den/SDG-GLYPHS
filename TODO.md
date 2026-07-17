# TODO — SDG-GLYPHS

## Existing Items
- [ ] Add `--dictpath` CLI argument to `sdgglyphs` to read glyphs from a custom location (instead of the default `~/.config/SDG-GLYPHS/glyphs-data/`)
- [ ] Fix OCR bracket mode recognition and re-add to documentation

---

## Documentation
- [ ] Quick start is accurate (no manual install, sdgpkg only)
- [ ] Main interface doc matches actual UI
- [ ] Recording mode doc (grid-snapped vs freehand)
- [ ] Dictionary browser doc
- [ ] Integration doc for standalone use

## Testing
- [ ] Glyph recognition (DTW accuracy)
- [ ] Normal mode overlay (draw, clear, submit)
- [ ] Recording mode (both grid and freehand)
- [ ] Dictionary browser
- [ ] Execution triggers (circle gesture)
- [ ] Carousel auto-scrolling
- [ ] Clean shutdown (sigint/sigterm)
