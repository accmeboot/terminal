#!/usr/bin/env bash
# ~/.zshrc stays a machine-local file that installers may append to; it only
# needs one line that loads the config from the repo.
set -euo pipefail

# shellcheck disable=SC2016 # literal $HOME, expanded by zsh
line='source "$HOME/.config/zsh/init.zsh"'
touch "$HOME/.zshrc"
grep -qxF "$line" "$HOME/.zshrc" || echo "$line" >>"$HOME/.zshrc"

# macOS already defaults to zsh
zsh_path=$(command -v zsh)
if [[ $(uname -s) == Linux && $(getent passwd "$USER" | cut -d: -f7) != "$zsh_path" ]]; then
  chsh -s "$zsh_path"
fi
