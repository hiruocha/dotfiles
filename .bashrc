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

[ -f "$HOME/.config/shell/aliases.sh" ] && source "$HOME/.config/shell/aliases.sh"
[ -f "$HOME/.config/shell/environments.sh" ] && source "$HOME/.config/shell/environments.sh"
[ -f "$HOME/.config/shell/functions.sh" ] && source "$HOME/.config/shell/functions.sh"

{ pfetch || fastfetch || neofetch; } 2>/dev/null
