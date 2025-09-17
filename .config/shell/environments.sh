# Copyright © 2025 hiruocha

# local path
[ -d "$HOME/.local/bin" ] && export PATH=$HOME/.local/bin:$PATH

# editor
[ -n "$(command -v nvim)" ] && export EDITOR='nvim' || [ -n "$(command -v vim)" ] && export EDITOR='vim' || [ -n "$(command -v nano)" ] && export EDITOR='nano'

# flutter
[ -d "$HOME/.local/bin/flutter/bin" ] && export PATH="$HOME/.local/bin/flutter/bin:$PATH"
export PUB_HOSTED_URL="https://pub.flutter-io.cn"
export FLUTTER_STORAGE_BASE_URL="https://storage.flutter-io.cn"
[ -n "$(command -v chromium)" ] && export CHROME_EXECUTABLE='/usr/bin/chromium'

# ccache
if [ -n "$(command -v ccache)" ]; then
  [ -d "/usr/lib/ccache/bin" ] && export PATH="/usr/lib/ccache/bin:$PATH"
  export USE_CCACHE=1
  export CCACHE_EXEC="$(command -v ccache)"
fi

# repo
export REPO_URL='https://mirrors.tuna.tsinghua.edu.cn/git/git-repo'

# go
export GO111MODULE=on
export GOPROXY='https://goproxy.cn'

# rustup
export RUSTUP_UPDATE_ROOT='https://mirrors.tuna.tsinghua.edu.cn/rustup/rustup'
export RUSTUP_DIST_SERVER='https://mirrors.tuna.tsinghua.edu.cn/rustup'

# nodejs
export NVM_NODEJS_ORG_MIRROR='https://mirrors.tuna.tsinghua.edu.cn/nodejs-release/'
