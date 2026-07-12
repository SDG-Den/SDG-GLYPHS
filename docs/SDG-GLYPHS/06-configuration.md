# Configuration

File: `~/.config/SDG-GLYPHS/config.json`

```json
{
  "recording": {
    "sections": 4
  },
  "appearance": {
    "ink_width": 3.0,
    "background_rgba": [0.0, 0.0, 0.0, 0.06],
    "dictionary_grid_cols": 8,
    "carousel": {
      "enabled": true,
      "height": 70
    },
    "exec_prefix": "",
    "term_exec": ["ghostty", "-e"]
  }
}
```

## Options

| Key                            | Default                | Description                                      |
|--------------------------------|------------------------|--------------------------------------------------|
| `recording.sections`           | `4`                    | Number of cells in the recording grid            |
| `appearance.ink_width`         | `3.0`                  | Stroke width in pixels                           |
| `appearance.background_rgba`   | `[0,0,0,0.06]`         | Overlay background colour (RGBA 0–1)             |
| `appearance.dictionary_grid_cols` | `8`                 | Columns in the dictionary window grid            |
| `appearance.carousel.enabled`  | `true`                 | Show/hide the animated glyph carousel bar        |
| `appearance.carousel.height`   | `70`                   | Carousel bar height in pixels                    |
| `appearance.exec_prefix`       | `""`                   | Prefix for EXEC mode (e.g. `mmsg dispatch spawn_shell,`) |
| `appearance.term_exec`         | `["ghostty", "-e"]`    | Terminal emulator command (TERM mode)            |

If the file does not exist, built-in defaults are used.  The first run will
**not** create the file automatically — create it manually if you need
non-default settings.

## Input filtering

Only pen/stylus and touchscreen input is accepted for drawing.  Mice and
trackpads are silently rejected.  Detection checks for `PEN`, `ERASER`, and
`TOUCHSCREEN` source devices.
