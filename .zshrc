# Copyright © 2025 hiruocha

case "$-" in
  *i*) ;;
  *) return ;;
esac

setopt PROMPT_SUBST
PS1=$'[%F{magenta}%n%f@%F{yellow}%m%f]-[%F{blue}%~%f]\n%(?.%F{green}.%F{red})%(!.#.$)%f '

[ -f "$HOME"/.config/shell/aliases.sh ] && . "$HOME"/.config/shell/aliases.sh
[ -f "$HOME"/.config/shell/functions.sh ] && . "$HOME"/.config/shell/functions.sh

HISTSIZE=100000
SAVEHIST=100000
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_EXPIRE_DUPS_FIRST

{ pfetch || fastfetch || neofetch; } 2>/dev/null
