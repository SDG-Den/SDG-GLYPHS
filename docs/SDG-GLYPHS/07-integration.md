# Integration

## mangoWM keybindings

These bindings are configured in your mangoWM `binds.conf`:

| Keybinding          | Mode         | Command                          |
|---------------------|--------------|----------------------------------|
| `SUPER+G`           | **Normal**   | `glyphs-cli.py`                  |
| `SUPER+SHIFT+G`     | **Record**   | `glyphs-cli.py --record`         |
| `SUPER+CTRL+G`      | **Dictionary**| `glyphs-cli.py --dictionary`    |

Press `Escape` to close any mode at any time.

## mmsg (mango messaging)

Window management glyphs use `mmsg dispatch` commands for mangWM compositor
actions:

- `mmsg dispatch killclient` — close focused window
- `mmsg dispatch togglefloating` — toggle floating
- `mmsg dispatch togglefullscreen` — toggle fullscreen
- `mmsg dispatch reload_config` — reload compositor config
- `mmsg dispatch quit` — quit compositor
- `mmsg dispatch toggleoverview` — overview/expose
- `mmsg dispatch togglegaps` — toggle gaps
- `mmsg dispatch zoom` — zoom
- `mmsg dispatch toggle_scratchpad` — scratchpad
- `mmsg dispatch focuslast` — focus last window
- `mmsg dispatch centerwin` — centre window
- `mmsg dispatch viewtoleft` / `viewtoright` — move view

## Terminal (ghostty)

TERM mode launches commands in `ghostty -e`.  Configure a different terminal
via `appearance.term_exec` in `config.json`.

## Dependencies

| Dependency        | Purpose                              |
|-------------------|--------------------------------------|
| `python3-gobject` | GTK3 bindings (PyGObject)            |
| `python3-cairo`   | Cairo 2D vector graphics             |
| `wtype`           | Wayland keystroke injection          |
| `tesseract-ocr`   | Handwriting OCR (bracket mode)       |
| `tesseract-data-eng` | English OCR data                  |
| `mmsg`            | mango messaging (window management)  |
| `ghostty`         | Default terminal emulator            |
