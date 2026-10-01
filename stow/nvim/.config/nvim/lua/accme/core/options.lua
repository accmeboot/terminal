local opt = vim.opt

vim.g.mapleader = " "

vim.g.have_nerd_font = true

vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_python3_provider = 0

opt.number = true
opt.relativenumber = true

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

opt.wrap = false

opt.ignorecase = true
opt.smartcase = true
opt.cursorline = true

opt.laststatus = 3
opt.pumborder = "rounded"
opt.winborder = "rounded"
opt.termguicolors = true
opt.signcolumn = "yes"

opt.backspace = "indent,eol,start"

opt.clipboard:append("unnamedplus")

opt.breakindent = true

opt.undofile = true

opt.splitright = true
opt.splitbelow = true

opt.spelllang = "en_us"
opt.spell = true

opt.scrolloff = 10
opt.updatetime = 50

opt.foldmethod = "indent"

opt.foldcolumn = "0"
opt.foldlevelstart = 99

opt.fillchars:append({ eob = " " })
