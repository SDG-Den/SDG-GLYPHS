#!/bin/bash

# ---------------------------------------------------------------------------
# SDG-GLYPHS — install script
#
# Pen/stylus-based glyph input system.  Compositor-agnostic — works with
# any Wayland compositor.  Draw rune-shaped gestures to type text or
# execute commands.
#
# Ships a Python package (glyphs/), a CLI entrypoint (glyphs-cli.py),
# configuration files, documentation, and tips.
#
# The source lives in ~/.cache/SDG-PKG/sdg-glyphs (the sdgpkg cache).
# This script installs dependencies, copies files to XDG-style paths,
# creates a /usr/bin/sdgglyphs symlink, and installs desktop entries.
# ---------------------------------------------------------------------------

# --------------------------------------------------------------------------
# 0. Dependencies
# --------------------------------------------------------------------------
# Core GTK/Cairo rendering stack
unipkg install any python3-gobject
unipkg install any python3-cairo

# Wayland typing utility — required for TYPE mode output
unipkg install any wtype

# Optional: handwriting OCR for bracket mode
unipkg install any tesseract-ocr
unipkg install any tesseract-data-eng

# Source directory: sdgpkg clones the repo here before calling install
WORKDIR=/home/$(whoami)/.cache/SDG-PKG/sdg-glyphs

# --------------------------------------------------------------------------
# 1. Configuration
# --------------------------------------------------------------------------
# Create the module's config directory and copy config.json + glyphs-data/
mkdir -p /home/$(whoami)/.config/SDG-GLYPHS
cp $WORKDIR/config/config.json /home/$(whoami)/.config/SDG-GLYPHS/config.json
cp -r $WORKDIR/config/glyphs-data /home/$(whoami)/.config/SDG-GLYPHS/

# --------------------------------------------------------------------------
# 2. Local binaries / libraries
# --------------------------------------------------------------------------
# Create the module's local directory and copy the Python package + CLI
mkdir -p /home/$(whoami)/.local/SDG-GLYPHS
cp -r $WORKDIR/local/glyphs /home/$(whoami)/.local/SDG-GLYPHS/
cp $WORKDIR/local/glyphs-cli.py /home/$(whoami)/.local/SDG-GLYPHS/glyphs-cli.py
chmod a+x /home/$(whoami)/.local/SDG-GLYPHS/glyphs-cli.py

# --------------------------------------------------------------------------
# 3. Docs & tips
# --------------------------------------------------------------------------
mkdir -p /home/$(whoami)/.local/docs /home/$(whoami)/.local/tips
cp -r $WORKDIR/docs /home/$(whoami)/.local/docs/SDG-GLYPHS
cp -r $WORKDIR/tips /home/$(whoami)/.local/tips/SDG-GLYPHS

# --------------------------------------------------------------------------
# 4. Desktop entries
# --------------------------------------------------------------------------
# Main entry — default opens dictionary, with right-click actions for
# drawing surface, record, and record-freehand modes.
sudo cp $WORKDIR/other/SDG-GLYPHS.desktop /usr/share/applications/SDG-GLYPHS.desktop
# Alternate shortcut that opens the drawing surface directly
sudo cp $WORKDIR/other/SDG-GLYPHS-Draw.desktop /usr/share/applications/SDG-GLYPHS-Draw.desktop

# --------------------------------------------------------------------------
# 5. Symlink entrypoint
# --------------------------------------------------------------------------
# SDG-MANGO-CORE's binds.conf references /usr/bin/sdgglyphs as the command
# bound to SUPER+G.  The symlink points to the installed CLI script.
sudo ln -sf /home/$(whoami)/.local/SDG-GLYPHS/glyphs-cli.py /usr/bin/sdgglyphs

# --------------------------------------------------------------------------
# 6. Verify
# --------------------------------------------------------------------------
which sdgglyphs || echo "INSTALL FAILED!"
