# SDG-GLYPHS — Module Analysis

## 1. Function

SDG-GLYPHS is a pen/stylus-based glyph input system for Wayland compositors. Users draw rune-shaped gestures that are matched against a dictionary of templates; matched glyphs type text or execute commands. Written in Python 3 with GTK 3 / Cairo for the UI overlay, it ships as a Python package (`local/glyphs/`) with a CLI entrypoint (`local/glyphs-cli.py`), configuration, documentation, and desktop entries.

---

## 2. Dependencies

| Dependency | Type | Used In | Purpose |
|-----------|------|---------|---------|
| `python3-gobject` (PyGObject) | Runtime | All Python files | GTK 3 bindings |
| `python3-cairo` (PyCairo) | Runtime | `normal.py`, `record_grid.py`, `record_freehand.py`, `widgets.py` | Cairo 2D rendering |
| `wtype` | Runtime | `normal.py:346` | Type text into focused Wayland window |
| `tesseract-ocr` + `tesseract-data-eng` | Optional | `normal.py:400-403` | Handwriting OCR (bracket mode) |
| `mmsg` | Runtime (external) | `config.json:13`, `docs/README.md:365-378` | mangoWC/WM IPC dispatch |
| `ghostty` | Runtime (external) | `config.json:14`, `normal.py:336-344` | Terminal emulator for TERM mode |

---

## 3. File Map

### Root scripts

| File | Lines | Purpose |
|------|-------|---------|
| `README.md` | 2 | Stub — only title |
| `install.sh` | 78 | Install: copies config, Python package, docs, tips, `.desktop` files; symlinks `/usr/bin/sdgglyphs` |
| `uninstall.sh` | 22 | Removes installed paths, unlinks symlink, removes `.desktop` files |
| `update.sh` | 31 | Redeploys from sdgpkg cache; skips config (preserves user edits) |
| `migration-plan.md` | 47 | Historical todo/document — describes intended structure |
| `.gitignore` | 1 | Ignores `__pycache__/` |
| `TESTCOMPLETE.md` | 0 | Empty |

### `config/`

| File | Lines | Purpose |
|------|-------|---------|
| `config.json` | 16 | Runtime appearance and behaviour settings |
| `glyphs-data/` (71 JSON files) | ~400 each | Per-glyph definitions: name, output string, normalised stroke templates |

### `local/glyphs/` (Python package)

| File | Lines | Purpose | Depends on |
|------|-------|---------|------------|
| `__init__.py` | 58 | Re-exports public symbols from all submodules | All submodules |
| `app.py` | 43 | `GlyphApp` orchestrator — loads config/glyphs, dispatches to mode windows | config, storage, normal, record_grid, record_freehand, dictionary |
| `config.py` | 61 | Config path constants (`~/.config/SDG-GLYPHS/`), load/save, defaults | — |
| `storage.py` | 46 | `load_glyphs()` / `save_glyph()` — JSON persistence from GLYPH_DIR | config |
| `geometry.py` | 234 | RDP simplification, resampling, normalisation, rotation-invariant matching | — |
| `models.py` | 28 | `StrokeGlyph` data class | — |
| `grid.py` | 85 | Grid anchor points (A–G + intermediates), adjacency, BFS pathfinding | — |
| `input.py` | 28 | `is_pen_event()` — accepts PEN/ERASER/TOUCHSCREEN only | — |
| `widgets.py` | 122 | `GlyphCard` — animated card for dictionary window | — |
| `normal.py` | 641 | Main drawing overlay — stroke matching, gesture recognition, OCR, carousel | geometry, models, input |
| `record_grid.py` | 372 | Grid-snapped recording overlay | geometry, storage, grid, input |
| `record_freehand.py` | 261 | Freehand recording overlay | geometry, storage, input |
| `dictionary.py` | 65 | Dictionary browser — scrollable grid of `GlyphCard` widgets | widgets |

### `local/glyphs-cli.py`

| Lines | Purpose |
|-------|---------|
| 43 | Entrypoint — argparse selecting mode: normal, `--record`, `--record-freehand`, `--dictionary` |

### `other/`

| File | Lines | Purpose |
|------|-------|---------|
| `SDG-GLYPHS.desktop` | 21 | Desktop entry — default opens dictionary; actions for draw/record/record-freehand |
| `SDG-GLYPHS-Draw.desktop` | 9 | Shorter entry — opens drawing surface directly; `NoDisplay=true` |

### `docs/`

| File | Lines | Purpose |
|------|-------|---------|
| `README.md` | 400 | Full documentation (mangoWC flavour) |
| `README-updated.md` | 230 | Abridged version (mangoWM flavour) |

### `tips/`

| File | Purpose |
|------|---------|
| `SDG-GLYPHS/.placeholder` | Empty file — no actual tips content |

---

## 4. Data Flow

```
glyphs-cli.py                ← CLI entrypoint
  └─ GlyphApp                ← app.py
       ├─ load_config()      ← config.py → ~/.config/SDG-GLYPHS/config.json
       ├─ load_glyphs()      ← storage.py → ~/.config/SDG-GLYPHS/glyphs-data/*.json
       ├─ run_normal()       ← normal.py (geometry.py, models.py, input.py)
       ├─ run_record()       ← record_grid.py (geometry.py, grid.py, storage.py)
       ├─ run_record_freehand() ← record_freehand.py (geometry.py, storage.py)
       └─ run_dictionary()   ← dictionary.py (widgets.py)
```

---

## 5. Issues Found

### 5.1 Naming inconsistency: `mangoWC` vs `mangoWM`

| File | Line | Uses |
|------|------|------|
| `docs/README.md` | 1, 28, 361 | `mangoWC` |
| `docs/README-updated.md` | 1, 28, 210 | `mangoWM` |

The docs reference the compositor by two different names. The stable name in the wider SDG-OS ecosystem appears to be `mangoWM`.

### 5.2 Stale `~/.config/sdgos/` path references in docs/docstrings

The runtime config directory is `~/.config/SDG-GLYPHS/` (`config.py:17`), but several locations still reference `~/.config/sdgos/glyphs/`:

| File | Line | Wrong path |
|------|------|------------|
| `local/glyphs/config.py` | 5 | `~/.config/sdgos/glyphs/config.json` (docstring) |
| `docs/README.md` | 180 | `~/.config/sdgos/glyphs/glyphs-data/` |
| `docs/README.md` | 231 | `~/.config/sdgos/glyphs/config.json` |
| `docs/README-updated.md` | 154 | `~/.config/sdgos/glyphs/config.json` |

### 5.3 Empty `tips/` directory

`tips/SDG-GLYPHS/.placeholder` is an empty file. The `install.sh` copies this directory to `~/.local/tips/SDG-GLYPHS/`, producing an empty target. No actual tips content exists.

### 5.4 Stale `migration-plan.md`

Written as a TODO list that has been mostly implemented, but never updated:

| Line | Claim | Reality |
|------|-------|---------|
| 18 | symlink is `/usr/bin/glyphs` | Actual symlink is `/usr/bin/sdgglyphs` (install.sh:73) |
| 28 | "All four root-level scripts are empty" | `install.sh`, `uninstall.sh`, `update.sh` are implemented |
| 31 | uninstall removes `~/.config/SDG-GLYPHS/` | uninstall.sh does NOT remove config directory |
| 30 | install.sh symlinks to `/usr/bin/glyphs` | install.sh symlinks to `/usr/bin/sdgglyphs` |
| 46 | remove `other/`, `tips/` if not populated | `other/` IS populated; `tips/` is still empty |

### 5.5 `uninstall.sh` does not remove config directory

`uninstall.sh` removes `~/.local/SDG-GLYPHS`, `~/.local/docs/SDG-GLYPHS`, `~/.local/tips/SDG-GLYPHS`, the symlink, and the `.desktop` files — but **not** `~/.config/SDG-GLYPHS/`. This leaves the user's glyph data and config behind.

### 5.6 Hardcoded `/home/$(whoami)/` paths instead of `$HOME`

All three shell scripts (`install.sh:33,39-41,47-50,56-57,64-66,73`, `uninstall.sh:10,14-15`, `update.sh:14-15,18,21-22,27-31`) use `/home/$(whoami)/` instead of `$HOME`. This is fragile — it breaks if `$HOME` is not `/home/<user>` (e.g., NFS homes, custom $HOME).

### 5.7 `exec_prefix` default mismatch

| File | Line | Value |
|------|------|-------|
| `config/config.json` | 13 | `"mmsg dispatch spawn_shell,"` |
| `local/glyphs/config.py` | 39 | `""` (empty string) |

The shipped `config.json` provides an `exec_prefix`, but the Python default in `default_config()` is `""`. If the config file is missing or the key is absent, EXEC/TERM modes will behave differently than what the shipped config implies.

### 5.8 `dictionary_grid_cols` default mismatch

| File | Line | Value |
|------|------|-------|
| `config/config.json` | 9 | `8` |
| `config.py` | 37 | `8` (default in `default_config()`) |
| `dictionary.py` | 28 | `4` (fallback if key absent) |

If a user has an older config without `dictionary_grid_cols`, the fallback of `4` disagrees with the shipped default of `8`.

### 5.9 Dead code: `"__complete_enter__" in self.glyphs` dict access on a list

`normal.py:165-168`:
```python
if not self.in_text and "__complete_enter__" in self.glyphs:
    g, d = match_stroke(
        normalized,
        {"__complete_enter__": self.glyphs["__complete_enter__"]})
```

- `self.glyphs` is a **list** of dicts (returned by `load_glyphs()` in `storage.py:10-33`), so `"__complete_enter__" in self.glyphs` is always `False` (the string is never equal to any element dict).
- Even if reached, `self.glyphs["__complete_enter__"]` on a list raises `TypeError`.
- The `match_stroke` second argument is a dict `{"__complete_enter__": ...}`, but `match_stroke` expects a list — iterating a dict yields keys (strings), and `glyph.get("templates", [])` on a string raises `AttributeError`.

This gesture-detection path (circle + line for session execution) is entirely dead. The separate `_is_circle()` function (normal.py:175-177) provides the same functionality via a different code path.

### 5.10 `README.md` states "60+" glyphs, `README-updated.md` states "71"

- `docs/README.md:351` says "60+ predefined glyphs"
- `docs/README-updated.md:214` says "71"

The actual count is **71** `.json` files in `config/glyphs-data/`. README.md is stale.

### 5.11 `TESTCOMPLETE.md` is empty

The file exists with 0 lines. Either legacy or placeholder.

### 5.12 `__init__.py` looks for `cli.py` (referenced in docstring)

The `__init__.py` docstring mentions `glyphs.py` (the original monolithic script), and the package docstring says "callers can do `from glyphs import X` for everything that was originally top-level in the monolithic glyphs.py". This is a legacy reference. There is no `cli.py` in the package — the entrypoint is `glyphs-cli.py` at `local/` level.

---

## 6. Summary

**Well-structured aspects:**
- Clean separation of concerns across the Python package (config, storage, geometry, UI, widgets)
- Consistent XDG-style install layout (`~/.config/`, `~/.local/`)
- Colour-coded mode indicators (TYPE green, EXEC orange, TERM purple)
- Good documentation in `docs/README.md` with description of the recognition pipeline

**Items needing attention:**
1. Fix dead `__complete_enter__` code in `normal.py:165-168`
2. Update stale `~/.config/sdgos/` path references in docs and docstrings
3. Reconcile `mangoWC` vs `mangoWM` naming
4. Add `rm -rf ~/.config/SDG-GLYPHS` to `uninstall.sh`
5. Replace `/home/$(whoami)/` with `$HOME` in shell scripts
6. Populate or remove the `tips/` directory
7. Reconcile `exec_prefix` and `dictionary_grid_cols` defaults
8. Update `migration-plan.md` or archive it
9. Update `README.md` glyph count from "60+" to "71"
10. Either populate or remove `TESTCOMPLETE.md`
