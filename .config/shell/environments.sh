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

# editor
{ [ -n "$(command -v nvim)" ] && export EDITOR='nvim'; } || \
{ [ -n "$(command -v vim)" ] && export EDITOR='vim'; } || \
{ [ -n "$(command -v nano)" ] && export EDITOR='nano'; }
export VISUAL="$EDITOR"

# flutter
add_path "$HOME"/.local/bin/flutter/bin
export PUB_HOSTED_URL="https://pub.flutter-io.cn"
export FLUTTER_STORAGE_BASE_URL="https://storage.flutter-io.cn"
[ -n "$(command -v chromium)" ] && export CHROME_EXECUTABLE='/usr/bin/chromium'

# ccache
[ -n "$(command -v ccache)" ] && {
  add_path "/usr/lib/ccache/bin"
  export USE_CCACHE=1
  CCACHE_EXEC="$(command -v ccache)"
  export CCACHE_EXEC
}

# repo
export REPO_URL='https://mirrors.tuna.tsinghua.edu.cn/git/git-repo'

# go
export GO111MODULE=on
export GOPROXY='https://goproxy.cn'

# rustup
export RUSTUP_UPDATE_ROOT='https://mirrors.tuna.tsinghua.edu.cn/rustup/rustup'
export RUSTUP_DIST_SERVER='https://mirrors.tuna.tsinghua.edu.cn/rustup'

# nodejs
export NVM_NODEJS_ORG_MIRROR='https://mirrors.ustc.edu.cn/node/'

# electron
export ELECTRON_MIRROR='https://npmmirror.com/mirrors/electron/'

unset -f add_path
