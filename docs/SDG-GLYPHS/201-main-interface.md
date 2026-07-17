# Main Interface

The default mode when running `sdgglyphs` (or pressing **SUPER+G**).  A
fullscreen transparent overlay appears — draw glyphs with your pen and each
completed stroke is matched against the dictionary.  Recognised glyphs show
their name in a green label; unrecognised strokes show a red `?`.

**Note:** Only pen/stylus and touchscreen input is accepted — mice and trackpads
are automatically rejected.  You will need a drawing tablet or touchscreen to
use the overlay.

## Mode system

The overlay has three output modes, indicated in the top-left corner:

| Mode     | Indicator | Behaviour on session execution                           |
|----------|-----------|----------------------------------------------------------|
| **TYPE** | Green     | `wtype` types text into the focused window               |
| **EXEC** | Orange    | `exec_prefix + text` runs as a shell command             |
| **TERM** | Purple    | Opens `term_exec` terminal with the command              |

The default mode is **TYPE**.  Switch modes by drawing the appropriate glyph
as the very first stroke of a session:

| Glyph output string      | Switches to |
|--------------------------|-------------|
| `__mode_exec__`          | EXEC mode   |
| `__mode_term_exec__`     | TERM mode   |

## Session execution

Everything you draw forms a *session* — a space-separated concatenation of
every recognised glyph's output string, in the order drawn.

To fire the session, draw a circle of any size.  The session is then:

- **typed** into the focused window (TYPE mode),
- **executed** as a shell command (EXEC mode), or
- **launched** in a terminal emulator (TERM mode).

If a glyph with the output string `__complete_enter__` is drawn, a trailing
Enter keypress is sent after the session output.

## Strike-out (delete a glyph)

Draw a short horizontal scratch **over** a recognised glyph's label to remove
it from the session.  The scratch must be wider than it is tall and overlap the
glyph's bounding box.

## Undo

Three ways to undo:

- **Ctrl+Z** — removes the last stroke, text stroke, or recognised entry
- **Backspace** — removes the last recognised entry
- **Undo button** — click the grey button in the top-right corner

## Carousel bar

An auto-scrolling animated preview bar at the bottom of the screen shows all
known glyphs.  Each glyph's stroke path is repeatedly drawn in blue with a
progress animation.  Enabled by default; can be toggled in `config.json`.

See [Configuration](301-configuration.md) for carousel settings.

## Tips for Better Recognition

- Draw glyphs slowly and deliberately — quick scribbles are harder to match
- Use a pen or stylus for the most consistent results
- If a glyph is misrecognised, try drawing it larger and more spaced out
- The first stroke of a session determines the mode, so make sure it is intentional
