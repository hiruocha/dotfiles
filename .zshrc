# Copyright © 2025 hiruocha

case "$-" in
  *i*) ;;
  *) return ;;
esac

setopt PROMPT_SUBST
PROMPT=$'[%F{magenta}%n%f@%F{yellow}%m%f]-[%F{blue}%~%f]\n%(?.%F{green}.%F{red})%(!.#.$)%f '

[ -f "$HOME/.config/shell/aliases.sh" ] && source "$HOME/.config/shell/aliases.sh"
[ -f "$HOME/.config/shell/environments.sh" ] && source "$HOME/.config/shell/environments.sh"
[ -f "$HOME/.config/shell/functions.sh" ] && source "$HOME/.config/shell/functions.sh"

{ pfetch || fastfetch || neofetch; } 2>/dev/null
