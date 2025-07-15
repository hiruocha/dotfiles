#!/usr/bin/env bash

user_config() {
  echo "正在导入用户配置……"
  for CONFIG in *; do
    if [ "$CONFIG" = etc ]; then
      :
    elif [ -d "$CONFIG" ]; then
      while true; do
	read -p "导入 "$CONFIG" 配置？(Y/N)" answer
        case $answer in
        Y | y)
          echo "导入中……"
          stow "$@" "$CONFIG"
          break
	  ;;
        N | n)
          echo "跳过！"
          break
	  ;;
        *)
          echo "输入无效！"
          ;;
        esac
      done
    fi
  done
}

system_config() {
  echo "正在导入系统配置"
  (
    cd ./etc
    for SYSTEM_CONFIG in *; do
      while true; do
        read -p "导入 "$SYSTEM_CONFIG" 配置？(Y/N)" answer
        case $answer in
        Y | y)
          echo "导入中……"
          sudo stow --target=/etc "$@" "$SYSTEM_CONFIG"
          break
	  ;;
        N | n)
          echo "跳过！"
          break
	  ;;
        *)
          echo "输入无效！"
          ;;
        esac
      done
    done
  )
}

main() {
  user_config "$@"
  system_config "$@"
}

main --dotfiles -Rv --no-folding "$@"
