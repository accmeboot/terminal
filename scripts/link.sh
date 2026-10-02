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

mkdir -p "$HOME/.config/ghostty"

stow --restow --target="$HOME" "${packages[@]}"

state="${XDG_STATE_HOME:-$HOME/.local/state}/mshell"
for polarity in dark light; do
  mkdir -p "$state/$polarity"
  for file in ghostty nvim.lua; do
    [[ -e $state/$polarity/$file ]] || cp "../defaults/$polarity/$file" "$state/$polarity/$file"
  done
done

themes="$HOME/.config/ghostty/themes"
mkdir -p "$themes"
for polarity in dark light; do
  ln -sfn "$state/$polarity/ghostty" "$themes/base16-$polarity"
done
