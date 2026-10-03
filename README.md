# terminal

Arch (pacman) and macOS (Homebrew).

## Packages

| Package | Homebrew | Used for |
| --- | --- | --- |
| `stow`, `git` | same | linking the configs |
| `zsh`, `zsh-autosuggestions`, `zsh-syntax-highlighting` | zsh is preinstalled | shell |
| `starship` | same | prompt |
| `tmux` | same | multiplexer |
| `ghostty`, `ttf-terminus-nerd` | casks `ghostty`, `font-terminess-ttf-nerd-font` | terminal and its font |
| `neovim`, `tree-sitter-cli`, `ripgrep`, `fd` | same | editor, parsers, pickers |
| `nodejs`, `npm`, `unzip`, `curl`, `wget`, `file` | `node`, `wget` | mason installing language servers |
| `fnm`, `pnpm` | same | node versions, package manager |
| `gcc`, `make`, `cmake` | `cmake`, the rest from Xcode CLT | C toolchain |
| `go` | same | go, gopls/goimports |
| `rustup` | same | rust, rust-analyzer |
| `python` | same | python, pyright/black/isort |
| `jdk21-openjdk`, `gradle` | `openjdk@21`, `gradle` | java, jdtls and the kotlin language server |
| `lua`, `luarocks` | same | lua |
| `yazi`, `ffmpeg`, `7zip`, `jq`, `poppler`, `imagemagick`, `resvg`, `fzf`, `zoxide` | `sevenzip` for `7zip` | file manager, its previewers, search and jumps |
| `fastfetch` | same | system info |
| `chafa` | same | images in the terminal (`icat`) |
| `bottom` | same | system monitor |

## Scripts

`install.sh` runs the scripts below in order.

| Script | |
| --- | --- |
| `install-packages.sh` | installs the packages with pacman or Homebrew |
| `setup-rust.sh` | sets stable as the default toolchain if none is set, adds rust-analyzer |
| `link.sh` | stows `stow/` into `~`, copies the `defaults/` palettes to `~/.local/state/mshell` where mesa-shell hasn't rendered them, links the ghostty themes |
| `setup-zsh.sh` | adds `source ~/.config/zsh/init.zsh` to `~/.zshrc`, makes zsh the login shell on Linux |
