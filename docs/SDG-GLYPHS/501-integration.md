# Integration

## Keybindings

SDG-GLYPHS can be bound to any key in your compositor's config:

| Keybinding          | Mode         | Command                          |
|---------------------|--------------|----------------------------------|
| `SUPER+G`           | **Normal**   | `sdgglyphs`                      |
| `SUPER+SHIFT+G`     | **Record**   | `sdgglyphs --record`             |
| `SUPER+CTRL+G`      | **Dictionary**| `sdgglyphs --dictionary`        |

Under mangoWM, these can be configured in `binds.conf`.

## Window management

Window management glyphs can use compositor IPC commands. On mangoWM this is
done via `mmsg dispatch`, on other compositors use the appropriate IPC tool.

## Terminal

TERM mode launches commands in the terminal emulator configured in
`appearance.term_exec` in `config.json` (default: `ghostty -e`).

## Dependencies

| Dependency        | Purpose                              |
|-------------------|--------------------------------------|
| `python-gobject`  | GTK3 bindings (PyGObject)            |
| `python-cairo`    | Cairo 2D vector graphics             |
| `wtype`           | Wayland keystroke injection          |
| `tesseract`       | Handwriting OCR (bracket mode, optional) |
| `tesseract-data-eng` | English OCR data (optional)      |
