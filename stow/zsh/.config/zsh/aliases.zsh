alias nv=nvim
alias fzfnv='nvim $(fzf)'
alias cf='clear && fastfetch'
alias icat=chafa

# yazi, and cd into the directory it was in on exit
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
  command yazi "$@" --cwd-file="$tmp"
  if cwd="$(<"$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}
