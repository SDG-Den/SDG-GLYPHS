#!/bin/bash

WORKDIR="$HOME/.cache/SDG-PKG/sdg-glyphs"

rm -rf "$HOME/.local/SDG-GLYPHS"
cp -r "$WORKDIR/local/"* "$HOME/.local/"

rm -rf "$HOME/.local/docs/SDG-GLYPHS" "$HOME/.local/tips/SDG-GLYPHS"
cp -r "$WORKDIR/docs/"* "$HOME/.local/docs/"
cp -r "$WORKDIR/tips/"* "$HOME/.local/tips/"

sudo ln -sf "$HOME/.local/SDG-GLYPHS/glyphs-cli.py" /usr/bin/sdgglyphs

sudo cp "$WORKDIR/other/SDG-GLYPHS.desktop" /usr/share/applications/SDG-GLYPHS.desktop
sudo cp "$WORKDIR/other/SDG-GLYPHS-Draw.desktop" /usr/share/applications/SDG-GLYPHS-Draw.desktop
