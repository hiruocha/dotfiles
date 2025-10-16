# Copyright © 2025 hiruocha

add_path () {
  [ -d "$1" ] && \
  case :"$PATH": in
    *:"$1":*)
      ;;
    *)
      export PATH="$1:$PATH"
      ;;
  esac
}

# local path
add_path "$HOME"/.local/bin
add_path "$HOME"/.minecraft/bin

# editor
{ [ -n "$(command -v nvim)" ] && export EDITOR=nvim; } || \
{ [ -n "$(command -v vim)" ] && export EDITOR=vim; } || \
{ [ -n "$(command -v nano)" ] && export EDITOR=nano; }
export VISUAL="$EDITOR"

# xdg basedir
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_CACHE_HOME="$HOME"/.cache
export XDG_DATA_HOME="$HOME"/.local/share
export XDG_STATE_HOME="$HOME"/.local/state

# gpg
export GNUPGHOME="$XDG_DATA_HOME"/gnupg

# gtk
export GTK_RC_FILES="$XDG_CONFIG_HOME"/gtk-1.0/gtkrc
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc":"$XDG_CONFIG_HOME/gtk-2.0/gtkrc.mine"

# cargo
export CARGO_HOME="$XDG_DATA_HOME"/cargo

# cuda
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv

# android
export ANDROID_USER_HOME="$XDG_DATA_HOME"/android

# python
[ -d "$XDG_STATE_HOME"/python ] || mkdir -p "$XDG_STATE_HOME"/python
export PYTHON_HISTORY="$XDG_STATE_HOME"/python/history

# flutter
add_path "$HOME"/.local/bin/flutter/bin
export PUB_HOSTED_URL="https://pub.flutter-io.cn"
export FLUTTER_STORAGE_BASE_URL="https://storage.flutter-io.cn"
[ -n "$(command -v chromium)" ] && export CHROME_EXECUTABLE="/usr/bin/chromium"

# ccache
[ -n "$(command -v ccache)" ] && {
  add_path "/usr/lib/ccache/bin"
  export USE_CCACHE=1
  CCACHE_EXEC="$(command -v ccache)"
  export CCACHE_EXEC
}

# repo
export REPO_URL="https://mirrors.tuna.tsinghua.edu.cn/git/git-repo"

# go
export GOPROXY="https://goproxy.cn"
export GOMODCACHE="$XDG_CACHE_HOME"/go/mod
export GOPATH="$XDG_DATA_HOME"/go

# rustup
export RUSTUP_UPDATE_ROOT="https://mirrors.tuna.tsinghua.edu.cn/rustup/rustup"
export RUSTUP_DIST_SERVER="https://mirrors.tuna.tsinghua.edu.cn/rustup"
[ -d "$XDG_DATA_HOME"/rustup ] || mkdir -p "$XDG_DATA_HOME"/rustup
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup

# nodejs
export NVM_NODEJS_ORG_MIRROR="https://mirrors.ustc.edu.cn/node/"
[ -d "$XDG_DATA_HOME"/nvm ] || mkdir -p "$XDG_DATA_HOME"/nvm
export NVM_DIR="$XDG_DATA_HOME"/nvm

# electron
export ELECTRON_MIRROR="https://npmmirror.com/mirrors/electron/"
export ELECTRON_OZONE_PLATFORM_HINT=auto
export ELECTRON_TRASH=trash-cli

unset -f add_path
