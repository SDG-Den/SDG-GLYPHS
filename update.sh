#!/bin/bash

# ---------------------------------------------------------------------------
# SDG-GLYPHS — update script
#
# Redeploys local binaries, docs, and tips from the sdgpkg cache.
# Skips config to preserve user customizations.
# ---------------------------------------------------------------------------

# --------------------------------------------------------------------------
# 1. Redeploy local binaries / libraries
# --------------------------------------------------------------------------
# Remove the old local copy, then copy fresh from the cache
rm -rf /home/$(whoami)/.local/SDG-GLYPHS
cp -r /home/$(whoami)/.cache/SDG-PKG/sdg-glyphs/local/* /home/$(whoami)/.local

# Re-apply the symlink (the file may have changed)
sudo ln -sf /home/$(whoami)/.local/SDG-GLYPHS/glyphs-cli.py /usr/bin/sdgglyphs

# Re-copy the desktop entries
sudo cp /home/$(whoami)/.cache/SDG-PKG/sdg-glyphs/other/SDG-GLYPHS.desktop /usr/share/applications/SDG-GLYPHS.desktop
sudo cp /home/$(whoami)/.cache/SDG-PKG/sdg-glyphs/other/SDG-GLYPHS-Draw.desktop /usr/share/applications/SDG-GLYPHS-Draw.desktop

# --------------------------------------------------------------------------
# 2. Redeploy docs & tips
# --------------------------------------------------------------------------
rm -rf /home/$(whoami)/.local/docs/SDG-GLYPHS
rm -rf /home/$(whoami)/.local/tips/SDG-GLYPHS
mkdir -p /home/$(whoami)/.local/docs /home/$(whoami)/.local/tips
cp -r /home/$(whoami)/.cache/SDG-PKG/sdg-glyphs/docs/* /home/$(whoami)/.local/docs
cp -r /home/$(whoami)/.cache/SDG-PKG/sdg-glyphs/tips/* /home/$(whoami)/.local/tips
