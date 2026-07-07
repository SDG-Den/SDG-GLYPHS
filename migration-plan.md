# SDG-GLYPHS Migration Plan

## 1. Implement Lifecycle Scripts

All four root-level lifecycle scripts are **empty stubs** — must be implemented:

| Script | Purpose |
|--------|---------|
| `install.sh` | Install Python package, deploy config files, create symlink for `glyphs` command |
| `uninstall.sh` | Remove Python package, remove config, remove symlinks |
| `update.sh` | Re-install or git pull + re-deploy |
| `detect.sh` | Check Python3, GTK3, Cairo requirements |

## 2. Installation Strategy

### 2.1 Python package deployment
- `local/glyphs/` is a Python package (has `__init__.py`, `app.py`, etc.)
- Install via `pip install -e ./local/glyphs/` or copy to a known path and add to `PYTHONPATH`.
- `local/glyphs-cli.py` is the CLI entry point.
- Ideally: create a `pyproject.toml` with a `[project.scripts]` entry for `glyphs=gylphs-cli:main`.

### 2.2 Symlink for CLI
- Current SDG-OS expects `/usr/bin/glyphs` (referenced in `SDG-MANGO-CORE/config/mango/binds.conf` line 75-78).
- Either symlink `glyphs-cli.py` to `/usr/bin/glyphs` or create a wrapper script.

### 2.3 Config deployment
- `config/config.json` → `~/.config/sdgos/glyphs/config.json`
- `config/glyphs-data/*.json` → `~/.config/sdgos/glyphs/glyphs-data/*.json`

## 3. Path Audit

### 3.1 `config.json` references
- `config/config.json` has `"exec_prefix": "mmsg dispatch spawn_shell,"` and `"term_exec": ["ghostty", "-e"]` — these reference mangoWM-specific tools. No path changes needed but note the dependency on mangoWM.
- The `config.json` references glyphs-data paths relative to itself (read by the Python app at runtime) — verify the Python app loads from the correct install directory.

### 3.2 Gyphs app internal paths
- Check `local/glyphs/app.py` for any hardcoded paths to `config.json` or `glyphs-data/`.
- The app should use `~/.config/sdgos/glyphs/` as its config root.

## 4. Empty Directory Cleanup

| Directory | Status |
|-----------|--------|
| `cache/` | Empty — remove or document |
| `tips/` | Empty — add tips or remove |
| `other/` | Empty — remove or document |

## 5. Modular Docs/Tips Contribution

### 5.1 Tips
- Contribute tips about glyph input system, drawing glyphs, using the dictionary.
- Add tip entries under `tips/` directory.

### 5.2 Docs
- `docs/README.md` and `docs/README-updated.md` exist already (documentation of the module).
- Consider contributing a help topic about glyph usage.

## 6. Build/Dependency Management

### 6.1 `.pyc` cache files
- `local/glyphs/__pycache__/` contains compiled `.pyc` files — add to `.gitignore`.

### 6.2 Dependencies
- Document Python dependencies: PyGObject (GTK3), Cairo, `gi.repository`.
- Add to `detect.sh`: verify `import gi; gi.require_version('Gtk','3.0'); from gi.repository import Gtk, Gdk, Cairo`.
