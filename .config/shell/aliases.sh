#!/bin/sh
# Copyright © 2025 hiruocha

alias ls='ls --color=auto -F'
alias grep='grep --color=auto'
alias ip='ip -c'
[ -n "$(command -v eza)" ] && alias ls='eza --icons --git --git-repos'

alias l='ls -lAh'
alias ll='ls -lh'
alias la='ls -A'

alias cls='clear && fastfetch'

[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"

alias g=git
alias ga='git add'
alias gp='git push'
alias gf='git fetch'
alias gl='git pull'
alias gst='git status'
