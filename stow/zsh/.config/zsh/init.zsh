# Sourced from ~/.zshrc (the line is added by scripts/setup-zsh.sh). Anything
# installers append to ~/.zshrc runs after this.

zsh_config=${0:A:h}

source "$zsh_config/env.zsh"
source "$zsh_config/options.zsh"
source "$zsh_config/aliases.zsh"

if [ -f "$HOME/.env" ]; then
  source "$HOME/.env"
fi

fastfetch

# last: zsh-syntax-highlighting has to be sourced after everything else
source "$zsh_config/plugins.zsh"

unset zsh_config
