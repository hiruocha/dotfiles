#!/hint/sh

# willker's dotfiles is free software: you can redistribute it and/or modify it under the terms of the 
# GNU General Public License as published by the Free Software Foundation, either 
# version 3 of the License, or (at your option) any later version.

# willker's dotfiles is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; 
# without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
# PARTICULAR PURPOSE. See the GNU General Public License for more details.

# You should have received a copy of the GNU General Public License along with willker's dotfiles.
# If not, see <https://www.gnu.org/licenses/>.

if command -v yazi > /dev/null; then
  y() {
    set -- "$@" --cwd-file "$(mktemp -t yazi-cwd.XXXXXX)"
    command yazi "$@"
    shift $(($# - 1))
    set -- "$(command cat < "$1"; printf .; command rm -f -- "$1")"
    set -- "${1%.}"
    [ "$1" != "$PWD" ] && [ -d "$1" ] && command cd -- "$1" || return
  }
fi
