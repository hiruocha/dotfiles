#!/hint/sh

# willker's dotfiles is free software: you can redistribute it and/or modify it under the terms of the 
# GNU General Public License as published by the Free Software Foundation, either 
# version 3 of the License, or (at your option) any later version.

# willker's dotfiles is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; 
# without even the implied warranty of MERCHANTABILITY or FITNESS FOR A 
# PARTICULAR PURPOSE. See the GNU General Public License for more details.

# You should have received a copy of the GNU General Public License along with willker's dotfiles.
# If not, see <https://www.gnu.org/licenses/>.

path() {
  case ":$PATH:" in
    *:"$1":*)
      ;;
    *)
      export PATH="$1:$PATH"
      ;;
  esac
}

umask 022

export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"

export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GOPATH="$XDG_DATA_HOME/go"

if command -v ccache > /dev/null 2>&1; then
  export USE_CCACHE=1
  CCACHE_EXEC="$(command -v ccache)"
  export CCACHE_EXEC
  if [ -d /usr/lib/ccache/bin ]; then
    path "/usr/lib/ccache/bin"
  fi
fi

if command -v sccache > /dev/null 2>&1; then
  RUSTC_WRAPPER="$(command -v sccache)"
  export RUSTC_WRAPPER
fi

if [ -d /usr/lib/mold ]; then
  path "/usr/lib/mold"
fi

export REPO_URL="https://gerrit-googlesource.proxy.ustclug.org/git-repo"
export PUB_HOSTED_URL="https://pub.flutter-io.cn"
export FLUTTER_STORAGE_BASE_URL="https://storage.flutter-io.cn"
export RUSTUP_UPDATE_ROOT="https://mirrors.cernet.edu.cn/rustup/rustup"
export RUSTUP_DIST_SERVER="https://mirrors.cernet.edu.cn/rustup"

path "/usr/local/bin"
path "$HOME/.local/bin"

unset -f path
