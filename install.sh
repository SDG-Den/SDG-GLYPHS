#!/bin/bash

### dependencies
unipkg install any python3-gobject
unipkg install any python3-cairo
unipkg install any wtype
unipkg install any tesseract-ocr
unipkg install any tesseract-data-eng

WORKDIR="$HOME/.cache/SDG-PKG/sdg-glyphs"

cp -r "$WORKDIR/config/"* "$HOME/.config/"
cp -r "$WORKDIR/local/"* "$HOME/.local/"
cp -r "$WORKDIR/docs/"* "$HOME/.local/docs/"
cp -r "$WORKDIR/tips/"* "$HOME/.local/tips/"

sudo cp "$WORKDIR/other/SDG-GLYPHS.desktop" /usr/share/applications/SDG-GLYPHS.desktop
sudo cp "$WORKDIR/other/SDG-GLYPHS-Draw.desktop" /usr/share/applications/SDG-GLYPHS-Draw.desktop

sudo ln -sf "$HOME/.local/SDG-GLYPHS/glyphs-cli.py" /usr/bin/sdgglyphs

which sdgglyphs || echo "INSTALL FAILED!"
