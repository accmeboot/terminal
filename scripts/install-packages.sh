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

  # build tools (treesitter parsers, mason packages)
  gcc
  make
  cmake

  # languages; mason builds gopls/goimports with go, pyright/black/isort need python
  go
  rustup
  python
  jdk21-openjdk # jdtls (nvim-java), kotlin
  gradle        # kotlin language server
  lua
  luarocks

  # neovim; mason installs servers on demand (node, unzip, curl, wget)
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

  # yazi and its previewers
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
  ttf-terminus-nerd # ghostty font-family
)

brew_formulae=(
  stow
  git

  zsh-autosuggestions
  zsh-syntax-highlighting
  fnm
  pnpm

  # gcc/clang and make come with the Xcode command line tools (needed by Homebrew)
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
  font-terminess-ttf-nerd-font # ghostty font-family
)

case "$(uname -s)" in
  Linux)
    # -Syu, not -S: installing against a stale package database is a partial upgrade.
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
