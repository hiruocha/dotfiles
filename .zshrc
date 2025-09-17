# Copyright © 2025 hiruocha

case "$-" in
  *i*) ;;
  *) return ;;
esac

[ -f "$HOME/.config/shell/aliases.sh" ] && source "$HOME/.config/shell/aliases.sh"
[ -f "$HOME/.config/shell/environments.sh" ] && source "$HOME/.config/shell/environments.sh"
[ -f "$HOME/.config/shell/functions.sh" ] && source "$HOME/.config/shell/functions.sh"

{ pfetch || fastfetch || neofetch; } 2>/dev/null
