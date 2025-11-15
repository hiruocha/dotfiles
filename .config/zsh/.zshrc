#!/usr/bin/env zsh
# Copyright © 2025 hiruocha

case "$-" in
  *i*) ;;
  *) return ;;
esac

if [ "$(tty)" = "/dev/tty1" ]; then
  [ -n "$(command -v hyprland)" ] && \
    exec hyprland
  [ -n "$(command -v sway)" ] && \
    val=$(udevadm info -a -n /dev/dri/card1 | grep boot_vga | rev | cut -c 2)
    export LANG=zh_CN.UTF-8
    export XMODIFIERS=@im=fcitx
    WLR_DRM_DEVICES="/dev/dri/card$val" exec sway || \
  [ -n "$(command -v niri-session)" ] && \
    exec niri-session
fi

[ -f "$HOME"/.config/shell/profile.sh ] && . "$HOME"/.config/shell/profile.sh
[ -f "$XDG_CONFIG_HOME"/shell/aliases.sh ] && . "$XDG_CONFIG_HOME"/shell/aliases.sh
[ -f "$XDG_CONFIG_HOME"/shell/functions.sh ] && . "$XDG_CONFIG_HOME"/shell/functions.sh

setopt PROMPT_SUBST
if [ -f /usr/share/git/completion/git-prompt.sh ]; then
  . /usr/share/git/completion/git-prompt.sh
  GIT_PS1_SHOWDIRTYSTATE=1
  GIT_PS1_SHOWCOLORHINTS=1
  PS1=$'[%F{magenta}%n%f@%F{yellow}%m%f]-[%F{blue}%~%f]-[%(?.%F{green}.%F{red})%?%f] $(__git_ps1 "%s") \n%(!.#.$) '
else
  PS1=$'[%F{magenta}%n%f@%F{yellow}%m%f]-[%F{blue}%~%f]-[%(?.%F{green}.%F{red})%?%f]\n%(!.#.$) '
fi

[ -d "$XDG_STATE_HOME"/zsh ] || mkdir -p "$XDG_STATE_HOME"/zsh
HISTFILE="$XDG_STATE_HOME"/zsh/history
HISTSIZE=100000
SAVEHIST=100000
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_EXPIRE_DUPS_FIRST

autoload -U compinit
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"

[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ] && \
. /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && \
. /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh && \
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
[ -f /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh ] && \
. /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh && \
bindkey '^[[A' history-substring-search-up && bindkey '^[[B' history-substring-search-down
[ -f /usr/share/zsh/plugins/zsh-sudo/sudo.plugin.zsh ] && \
. /usr/share/zsh/plugins/zsh-sudo/sudo.plugin.zsh

{ pfetch || fastfetch || hyfetch || neofetch || neowofetch; } 2>/dev/null || true
