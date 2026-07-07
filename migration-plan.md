# SDG-GLYPHS Migration Plan

## Directory Mapping

| Source | Installed to |
|--------|-------------|
| `config/config.json` | `~/.config/SDG-GLYPHS/config.json` |
| `config/glyphs-data/` | `~/.config/SDG-GLYPHS/glyphs-data/` |
| `local/glyphs/` (Python package) | `~/.local/SDG-GLYPHS/glyphs/` |
| `local/glyphs-cli.py` | `~/.local/SDG-GLYPHS/glyphs-cli.py` |
| `tips/` | `~/.local/tips/SDG-GLYPHS/` |
| `docs/` | `~/.local/docs/SDG-GLYPHS/` |

## Path Rewrites

No hardcoded `~/.config/sdgos/` references in this module's scripts. The Python app uses `config/config.json` relative to its working directory.

**However**, the symlink `/usr/bin/glyphs` is referenced by SDG-MANGO-CORE's `binds.conf`:
```
bind=SUPER,G,spawn_shell,/usr/bin/glyphs
```
This symlink should point to `~/.local/SDG-GLYPHS/glyphs-cli.py`. The install.sh should create it.

**Internal config refs** — check `local/glyphs/app.py` for hardcoded config paths. The app should use `~/.config/SDG-GLYPHS/config.json` at runtime.

## Lifecycle Scripts

All four root-level scripts are empty. Implement:

- **install.sh**: Copy Python package under `~/.local/SDG-GLYPHS/`, install via pip or set PYTHONPATH, symlink `glyphs-cli.py` to `/usr/bin/glyphs`, copy config to `~/.config/SDG-GLYPHS/`, copy docs/tips.
- **uninstall.sh**: Remove `~/.local/SDG-GLYPHS/`, `~/.config/SDG-GLYPHS/`, remove symlink.
- **update.sh**: Re-deploy.
- **detect.sh**: Check Python3, GTK3, Cairo (`gi.repository.Gtk`, `gi.repository.Gdk`, `gi.repository.Cairo`).

## Modular Tips

- Create `tips/` with glyph input usage tips
- `install.sh` copies to `~/.local/tips/SDG-GLYPHS/`

## Modular Docs

- `docs/README.md` and `docs/README-updated.md` exist — merge and copy to `~/.local/docs/SDG-GLYPHS/`

## Cleanup

- Remove `local/glyphs/__pycache__/` — add to `.gitignore`
- Remove empty `cache/`, `other/`, `tips/` (if not populated)
