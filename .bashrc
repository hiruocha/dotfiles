# Copyright © 2025 hiruocha

case "$-" in
  *i*) ;;
  *) return ;;
esac

NORMAL_PS='\[\e[m\]'
YELLOW_PS='\[\e[33m\]'
BLUE_PS='\[\e[34m\]'
MAGENTA_PS='\[\e[35m\]'
PS1="[${MAGENTA_PS}\u${NORMAL_PS}@${YELLOW_PS}\h${NORMAL_PS}]-[${BLUE_PS}\w${NORMAL_PS}]\n\$ "

[ -f "$XDG_CONFIG_HOME"/shell/aliases.sh ] && . "$XDG_CONFIG_HOME"/shell/aliases.sh
[ -f "$XDG_CONFIG_HOME"/shell/functions.sh ] && . "$XDG_CONFIG_HOME"/shell/functions.sh

[ -d "$XDG_STATE_HOME"/bash ] || mkdir -p "$XDG_STATE_HOME"/bash
HISTFILE="$XDG_STATE_HOME"/bash/history
HISTSIZE=100000
HISTFILESIZE=100000
HISTCONTROL=erasedups
shopt -s cmdhist
shopt -s histappend
PROMPT_COMMAND='history -a; history -n; '"$PROMPT_COMMAND"

shopt -s checkwinsize

{ pfetch || fastfetch || hyfetch || neofetch || neowofetch; } 2>/dev/null || true
