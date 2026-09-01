#!/hint/zsh

# willker's dotfiles is free software: you can redistribute it and/or modify it under the terms of the 
# GNU General Public License as published by the Free Software Foundation, either 
# version 3 of the License, or (at your option) any later version.

# willker's dotfiles is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; 
# without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
# PARTICULAR PURPOSE. See the GNU General Public License for more details.

# You should have received a copy of the GNU General Public License along with willker's dotfiles.
# If not, see <https://www.gnu.org/licenses/>.

ZSH_PLUGINS_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/zsh/plugins"
mkdir -p "$ZSH_PLUGINS_DIR"
plugin() {
  if [ -f "$ZSH_PLUGINS_DIR/$2/$2.plugin.zsh" ]; then
    . "$ZSH_PLUGINS_DIR/$2/$2.plugin.zsh"
    return 0
  elif [ -f "$ZSH_PLUGINS_DIR/$2/$2.zsh" ]; then
    . "$ZSH_PLUGINS_DIR/$2/$2.zsh"
    return 0
  elif command -v git > /dev/null 2>&1; then
    if [ -f "${XDG_STATE_HOME:-$HOME/.local/state}/need_mirror" ]; then
      git clone "https://v6.gh-proxy.org/github.com/$1/$2.git" "$ZSH_PLUGINS_DIR/$2"
    else
      git clone "https://github.com/$1/$2.git" "$ZSH_PLUGINS_DIR/$2"
    fi
  fi
  return 1
}

plugin zsh-users zsh-completions || true

if plugin zsh-users zsh-autosuggestions; then
  ZSH_AUTOSUGGEST_STRATEGY=(history completion)
fi

command -v fzf > /dev/null 2>&1 && plugin aloxaf fzf-tab || true

if plugin zsh-users zsh-syntax-highlighting; then
  typeset -A ZSH_HIGHLIGHT_STYLES
  ZSH_HIGHLIGHT_STYLES[alias]='fg=magenta'
  ZSH_HIGHLIGHT_STYLES[builtin]='fg=cyan'
  ZSH_HIGHLIGHT_STYLES[function]='fg=blue'
fi

if plugin zsh-users zsh-history-substring-search; then
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
fi

unset -f plugin
