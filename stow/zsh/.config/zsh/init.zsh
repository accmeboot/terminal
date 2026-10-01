zsh_config=${0:A:h}

source "$zsh_config/env.zsh"
source "$zsh_config/options.zsh"
source "$zsh_config/aliases.zsh"

if [ -f "$HOME/.env" ]; then
  source "$HOME/.env"
fi

fastfetch

source "$zsh_config/plugins.zsh"

unset zsh_config
