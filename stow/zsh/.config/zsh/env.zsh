typeset -U path fpath

export EDITOR=nvim
export VISUAL=nvim

if [[ $OSTYPE == darwin* ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
  fpath=("$HOMEBREW_PREFIX/share/zsh/site-functions" $fpath)
  export PNPM_HOME="$HOME/Library/pnpm"
  # keg-only: rustup and its proxies (cargo, rust-analyzer, ...)
  rustup_bin="$HOMEBREW_PREFIX/opt/rustup/bin"
  # keg-only as well; Arch sets the default JDK through archlinux-java
  export JAVA_HOME="$HOMEBREW_PREFIX/opt/openjdk@21"
  path=("$JAVA_HOME/bin" $path)
else
  export PNPM_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/pnpm"
  # rustup proxies not in /usr/bin, e.g. rust-analyzer
  rustup_bin=/usr/lib/rustup/bin
fi

path=("$HOME/.local/bin" "$PNPM_HOME/bin" "$HOME/.cargo/bin" "$HOME/go/bin" $path "$rustup_bin")
unset rustup_bin

eval "$(fnm env --shell zsh)"
