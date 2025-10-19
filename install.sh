#!/bin/sh
# Copyright © 2025 hiruocha

set -e

stow -t "$HOME" --no-folding -R .

[ -d "$HOME"/.local/state/bash ] || \
mkdir -p "$HOME"/.local/state/bash
[ -f "$HOME"/.bash_history ] && \
[ ! -f "$HOME"/.local/state/bash/history ] && \
mv "$HOME"/.bash_history "$HOME"/.local/state/bash/history || \
true

echo "If you are running bash, please run: source ~/.bashrc"
