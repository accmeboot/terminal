#!/usr/bin/env bash
set -euo pipefail

arch=(
  stow
  git

  zsh
  zsh-autosuggestions
  zsh-syntax-highlighting
  fnm
  pnpm

  gcc
  make
  cmake

  go
  rustup
  python
  jdk21-openjdk
  gradle
  lua
  luarocks

  neovim
  tree-sitter-cli
  ripgrep
  fd
  file
  nodejs
  npm
  unzip
  curl
  wget

  yazi
  ffmpeg
  7zip
  jq
  poppler
  fzf
  zoxide
  imagemagick
  resvg

  tmux
  starship
  fastfetch
  bottom
  chafa
  ghostty
  ttf-terminus-nerd
)

brew_formulae=(
  stow
  git

  zsh-autosuggestions
  zsh-syntax-highlighting
  fnm
  pnpm

  cmake

  go
  rustup
  python
  openjdk@21
  gradle
  lua
  luarocks

  neovim
  tree-sitter-cli
  ripgrep
  fd
  node
  wget

  yazi
  ffmpeg
  sevenzip
  jq
  poppler
  fzf
  zoxide
  imagemagick
  resvg

  tmux
  starship
  fastfetch
  bottom
  chafa
)

brew_casks=(
  ghostty
  font-terminess-ttf-nerd-font
)

case "$(uname -s)" in
  Linux)
    sudo pacman -Syu --needed "${arch[@]}"
    ;;
  Darwin)
    brew install "${brew_formulae[@]}"
    brew install --cask "${brew_casks[@]}"
    ;;
  *)
    echo "unsupported OS: $(uname -s)" >&2
    exit 1
    ;;
esac
