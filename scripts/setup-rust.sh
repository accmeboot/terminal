#!/usr/bin/env bash
set -euo pipefail

if [[ $(uname -s) == Darwin ]]; then
  PATH="$(brew --prefix rustup)/bin:$PATH"
fi

rustup default &>/dev/null || rustup default stable
rustup component add rust-analyzer
