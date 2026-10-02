# terminal

- zsh
- neovim
- tmux
- yazi
- starship
- fastfetch
- ghostty

## dev

- go
- rust (rustup)
- python
- java 21
- gradle
- lua (luarocks)
- node (fnm, pnpm)
- gcc, make, cmake

## zsh

`~/.zshrc` stays machine-local; `install.sh` only adds `source "$HOME/.config/zsh/init.zsh"` to it if missing.

## colors

ghostty (font and palettes) and nvim (palettes) read from `~/.local/state/mshell/{dark,light}/`, rendered by mesa-shell's `mshell build` ([mesa-shell](../mesa-shell)). `link.sh` copies `defaults/` there for any file the build hasn't rendered, so fonts and colors are the same without mesa-shell installed.

## install

- `pacman -Syu`, never `-S`: installing against a stale package database is a partial upgrade
- `go` and `python` are there because mason builds gopls/goimports and pyright/black/isort with them; `node`, `unzip`, `curl` and `wget` are what mason installs servers with
- `jdk21-openjdk` is for jdtls (nvim-java) and kotlin, `gradle` for the kotlin language server
- `ttf-terminus-nerd` is ghostty's `font-family`
- macOS: gcc/clang and make come with the Xcode command line tools, which Homebrew needs anyway; zsh is already the login shell
- `link.sh` creates `~/.config` and `~/.config/ghostty` before stowing: stow would otherwise fold a missing directory into one symlink into the repo, and every app (and the ghostty theme links) would write into the repo
- `setup-rust.sh` installs rust-analyzer through rustup so it matches the toolchain, as rustaceanvim recommends

## zsh: load order

`init.zsh` runs first, so anything installers append to `~/.zshrc` runs after it. zsh-syntax-highlighting is sourced last, as it requires. On macOS rustup and openjdk are keg-only, so `env.zsh` puts them on `PATH`; Arch sets the JDK through `archlinux-java`.

`y` runs yazi and `cd`s into the directory it was in on exit.

## tmux

- `allow-passthrough` is on for yazi's image previews
- copying reaches the system clipboard through the terminal (OSC 52, from tmux-yank), so no wl-copy/pbcopy is needed: `Y` in copy mode copies and pastes at the prompt, `prefix + Y` copies the pane's directory
- `C-h/j/k/l` and `C-\` move between panes, or pass through when the pane runs (n)vim or fzf so the vim side handles them (from vim-tmux-navigator); `prefix + C-l` clears the screen instead

## nvim: load order

- `core/options.lua` sets the leader before any plugin defines mappings
- `core/pack.lua` loads before `plugins/`: with a lockfile present the first `vim.pack.add()` installs every plugin in it, so build hooks registered later would never fire on a fresh machine
- `plugins/init.lua` loads plugins in dependency order, and `core/keymaps.lua` loads last since it maps plugin functions
- cyberdream gets both base16 palettes and switches with `'background'`; on `SIGUSR1` (sent by `mshell build`) it reloads them
- mini.pick's pickers call `rg` with only basic arguments, so `ripgreprc` (via `RIPGREP_CONFIG_PATH`) adds `--hidden` and the ignores
