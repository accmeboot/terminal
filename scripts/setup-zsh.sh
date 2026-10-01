#!/usr/bin/env bash
set -euo pipefail

line='source "$HOME/.config/zsh/init.zsh"'
touch "$HOME/.zshrc"
grep -qxF "$line" "$HOME/.zshrc" || echo "$line" >>"$HOME/.zshrc"

zsh_path=$(command -v zsh)
if [[ $(uname -s) == Linux && $(getent passwd "$USER" | cut -d: -f7) != "$zsh_path" ]]; then
  chsh -s "$zsh_path"
fi
