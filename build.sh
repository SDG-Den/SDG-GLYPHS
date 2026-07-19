#!/bin/bash

LOCALDIR=SDG-GLYPHS
DOCDIR=SDG-GLYPHS
TIPDIR=SDG-GLYPHS
entrypoint=glyphs-cli.py
command=sdgglyphs

WORKDIR=$(pwd)

rm -rf "$HOME/.local/docs/$DOCDIR" "$HOME/.local/tips/$TIPDIR" "$HOME/.local/$LOCALDIR"

mkdir -p "$HOME/.local/$LOCALDIR"
cp -r "$WORKDIR/config/"* "$HOME/.config/" 2>/dev/null || true
cp -r "$WORKDIR/local/"* "$HOME/.local/"
cp -r "$WORKDIR/docs/"* "$HOME/.local/docs/"
cp -r "$WORKDIR/tips/"* "$HOME/.local/tips/"

sudo cp "$WORKDIR/other/SDG-GLYPHS.desktop" /usr/share/applications/SDG-GLYPHS.desktop
sudo cp "$WORKDIR/other/SDG-GLYPHS-Draw.desktop" /usr/share/applications/SDG-GLYPHS-Draw.desktop

sudo ln -sf "$HOME/.local/$LOCALDIR/$entrypoint" /usr/bin/$command

which $command || echo "INSTALL FAILED!"
