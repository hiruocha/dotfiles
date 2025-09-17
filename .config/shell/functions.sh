# Copyright © 2025 hiruocha

# yazi
y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  IFS= read -r -d '' cwd < "$tmp"
  [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
  rm -f -- "$tmp"
}

# 设置代理
set_proxy() {
  export https_proxy=http://127.0.0.1:7890
  export http_proxy=http://127.0.0.1:7890
  export all_proxy=socks5://127.0.0.1:7890
  echo "Proxy settings applied."
}

# 取消代理
unset_proxy() {
  unset https_proxy
  unset http_proxy
  unset all_proxy
  echo "Proxy settings removed."
}
