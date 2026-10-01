if [[ $OSTYPE == darwin* ]]; then
  zsh_plugins="$HOMEBREW_PREFIX/share"
else
  zsh_plugins=/usr/share/zsh/plugins
fi

source "$zsh_plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
ZSH_AUTOSUGGEST_STRATEGY=(history)

if [[ $TERM != dumb ]]; then
  eval "$(starship init zsh)"
fi

source "$zsh_plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main)

unset zsh_plugins
