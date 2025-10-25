#!/usr/bin/env zsh
# Copyright © 2025 hiruocha

case "$-" in
  *i*) ;;
  *) return ;;
esac

[ -n "$(command -v niri-session)" ] && [ "$(tty)" = "/dev/tty1" ] && exec niri-session

setopt PROMPT_SUBST
if [ -f /usr/share/git/completion/git-prompt.sh ]; then
  # shellcheck source=/dev/null
  . /usr/share/git/completion/git-prompt.sh
  # shellcheck disable=SC2034
  GIT_PS1_SHOWDIRTYSTATE=1
  # shellcheck disable=SC2034
  GIT_PS1_SHOWCOLORHINTS=1
  PS1=$'[%F{magenta}%n%f@%F{yellow}%m%f]-[%F{blue}%~%f]-[%(?.%F{green}.%F{red})%?%f] $(__git_ps1 "%s") \n%(!.#.$) '
else
  PS1=$'[%F{magenta}%n%f@%F{yellow}%m%f]-[%F{blue}%~%f]-[%(?.%F{green}.%F{red})%?%f]\n%(!.#.$) '
fi

[ -d "$XDG_STATE_HOME"/zsh ] || mkdir -p "$XDG_STATE_HOME"/zsh
HISTFILE="$XDG_STATE_HOME"/zsh/history
HISTSIZE=100000
# shellcheck disable=SC2034
SAVEHIST=100000
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_EXPIRE_DUPS_FIRST

autoload -U compinit
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"

# shellcheck source=/dev/null
[ -f "$HOME"/.config/shell/profile.sh ] && . "$HOME"/.config/shell/profile.sh
# shellcheck source=/dev/null
[ -f "$XDG_CONFIG_HOME"/shell/aliases.sh ] && . "$XDG_CONFIG_HOME"/shell/aliases.sh
# shellcheck source=/dev/null
[ -f "$XDG_CONFIG_HOME"/shell/functions.sh ] && . "$XDG_CONFIG_HOME"/shell/functions.sh

# shellcheck source=/dev/null
[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ] && \
. /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# shellcheck source=/dev/null
# shellcheck disable=SC2034
[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && \
. /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh && \
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

{ pfetch || fastfetch || hyfetch || neofetch || neowofetch; } 2>/dev/null || true
