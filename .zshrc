# Copyright © 2025 hiruocha

case "$-" in
  *i*) ;;
  *) return ;;
esac

setopt PROMPT_SUBST
PS1=$'[%F{magenta}%n%f@%F{yellow}%m%f]-[%F{blue}%~%f]-[%(?.%F{green}.%F{red})%?%f]\n%(!.#.$) '

[ -f "$XDG_CONFIG_HOME"/shell/aliases.sh ] && . "$XDG_CONFIG_HOME"/shell/aliases.sh
[ -f "$XDG_CONFIG_HOME"/shell/functions.sh ] && . "$XDG_CONFIG_HOME"/shell/functions.sh

[ -d "$XDG_STATE_HOME"/zsh ] || mkdir -p "$XDG_STATE_HOME"/zsh
HISTFILE="$XDG_STATE_HOME"/zsh/history
HISTSIZE=100000
SAVEHIST=100000
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_EXPIRE_DUPS_FIRST

{ pfetch || fastfetch || hyfetch || neofetch || neowofetch; } 2>/dev/null || true
