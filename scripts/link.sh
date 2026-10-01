#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$(readlink -f "$0")")/../stow"

packages=(
  zsh
  nvim
  yazi
  tmux
  starship
  fastfetch
  ghostty
)

# Without an existing ~/.config, stow would fold it into a single symlink to
# the first package's .config, and every app would write into the repo.
mkdir -p "$HOME/.config"

stow --restow --target="$HOME" "${packages[@]}"
