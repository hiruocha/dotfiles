#!/bin/sh
# Copyright © 2025 hiruocha

lf () {
  cd "$(command lf -print-last-dir "$@")" || exit
}

eval "$(thefuck --alias)"
