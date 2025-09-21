#!/bin/sh
# Copyright © 2025 hiruocha

stow -t "$HOME" --no-folding -R .

[ -L "$HOME"/.ssh/config ] && { chmod 700 "$HOME"/.ssh && chmod 600 "$HOME"/.ssh/config; }

[ -f "$HOME"/.bash_history ] && mv "$HOME"/.bash_history "$HOME"/.local/state/bash_history
