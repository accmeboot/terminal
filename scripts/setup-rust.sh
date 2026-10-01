#!/usr/bin/env bash
# rust-analyzer comes from rustup so it matches the toolchain (rustaceanvim's
# recommendation); zsh's env.zsh puts its proxy on PATH.
set -euo pipefail

if [[ $(uname -s) == Darwin ]]; then
  # keg-only, not on PATH
  PATH="$(brew --prefix rustup)/bin:$PATH"
fi

rustup default &>/dev/null || rustup default stable
rustup component add rust-analyzer
