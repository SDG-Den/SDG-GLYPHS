# Recording Modes

Train custom glyphs not in the built-in set.  The screen is divided into a grid
(N sections, default 4).  Draw the same glyph shape in each cell — multiple
templates make recognition more robust.

When all cells are filled, a dialog asks for:

- **Name** — shown in the dictionary and carousel
- **Output string** — what gets typed or executed when the glyph is recognised

The dialog notes three special output strings:

| Output string            | Effect                                |
|--------------------------|---------------------------------------|
| `__mode_exec__`          | Switches to EXEC mode when drawn first |
| `__mode_term_exec__`     | Switches to TERM mode when drawn first |
| `__complete_enter__`     | Sends Enter key after session output   |

## Grid-snapped recording

`sdgglyphs --record`

The recording grid shows 7 labelled anchor points (A–G) connected by
axis-aligned and diagonal edges, plus 17 intermediate points.  When you draw,
the stroke is **snapped** to the nearest grid nodes and routed through the
graph via breadth-first search.  This produces clean, repeatable glyph
definitions.

Use this mode for precise, structured glyphs.

## Freehand recording

`sdgglyphs --record-freehand`

Same grid layout, but strokes are kept as-is without snapping.  No anchor-point
graph is shown.

Use this mode for organic shapes (e.g. handwritten letters, symbols).
