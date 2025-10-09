# Copyright © 2025 hiruocha

alias ls='ls --color=auto -F'
alias grep='grep --color=auto'
alias ip='ip -c'
[ -n "$(command -v eza)" ] && alias ls='eza --icons --git --git-repos'

alias l='ls -lAh'
alias ll='ls -lh'
alias la='ls -A'

alias cls='clear && { pfetch || fastfetch || hyfetch || neofetch || neowofetch; } 2>/dev/null || true'

[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"

alias adb='HOME="$XDG_DATA_HOME"/android adb'
for cmd in code code-oss codium vscodium vscodium-electron; do
  [ -n "$(command -v "$cmd")" ] && alias "$cmd"="$cmd"' --extensions-dir "$XDG_DATA_HOME/vscode"'
done
