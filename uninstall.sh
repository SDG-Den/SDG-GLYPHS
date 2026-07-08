#!/bin/bash

# ---------------------------------------------------------------------------
# SDG-GLYPHS — uninstall script
#
# Removes all files installed by install.sh and tears down the symlink.
# ---------------------------------------------------------------------------

# Remove the local module directory (Python package + CLI entrypoint)
rm -rf /home/$(whoami)/.local/SDG-GLYPHS


# Remove docs and tips shipped with this module
rm -rf /home/$(whoami)/.local/docs/SDG-GLYPHS
rm -rf /home/$(whoami)/.local/tips/SDG-GLYPHS

# Remove the /usr/bin/sdgglyphs symlink created during install
sudo unlink /usr/bin/sdgglyphs

# Remove the desktop entries installed to the system applications directory
sudo rm -f /usr/share/applications/SDG-GLYPHS.desktop
sudo rm -f /usr/share/applications/SDG-GLYPHS-Draw.desktop
