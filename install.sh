#!/bin/sh
# Copyright © 2025 hiruocha

stow -t "$HOME" --no-folding -R .

[ -L "$HOME"/.ssh/config ] && { chmod 700 "$HOME"/.ssh && chmod 600 "$HOME"/.ssh/config; }

[ -d "$HOME"/.local/state ] || mkdir -p "$HOME"/.local/state
[ -f "$HOME"/.bash_history ] && mv "$HOME"/.bash_history "$HOME"/.local/state/bash_history

[ -n "$BASH_VERSION" ] && . "$HOME"/.bashrc
