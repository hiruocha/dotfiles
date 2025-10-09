# Copyright © 2025 hiruocha

lf () {
  cd "$(command lf -print-last-dir "$@")"
}

set_proxy() {
  export https_proxy=http://127.0.0.1:7890
  export http_proxy=http://127.0.0.1:7890
  export all_proxy=socks5://127.0.0.1:7890
  echo "Proxy settings applied."
}

unset_proxy() {
  unset https_proxy
  unset http_proxy
  unset all_proxy
  echo "Proxy settings removed."
}
