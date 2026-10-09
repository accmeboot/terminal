local keymap = vim.keymap

keymap.set("n", "<leader>nh", ":nohl<CR>")

keymap.set("n", "<leader>sv", "<C-w>v")
keymap.set("n", "<leader>sh", "<C-w>s")
keymap.set("n", "<leader>se", "<C-w>=")
keymap.set("n", "<leader>cs", ":close<CR>")

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left split" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom split" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top split" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right split" })

keymap.set("n", "<leader>w", ":update<CR>")

keymap.set("n", "<S-l>", ":bnext<CR>")
keymap.set("n", "<S-h>", ":bprev<CR>")

keymap.set("n", "<leader>q", ":bd<cr>")

keymap.set("v", "<C-j>", ":m '>+1<cr>gv=gv")
keymap.set("v", "<C-k>", ":m '<-2<cr>gv=gv")

keymap.set("n", "<leader>]", ":vertical resize -5<CR>")
keymap.set("n", "<leader>[", ":vertical resize +5<CR>")
keymap.set("n", "<leader>{", ":resize -5<CR>")
keymap.set("n", "<leader>}", ":resize +5<CR>")

keymap.set("x", "<leader>p", '"_dP')

keymap.set("n", "<leader>e", ":NvimTreeFindFileToggle<CR>")
keymap.set("n", "<leader>E", ":Oil<CR>")

local function toggle_fugitive()
	local bufnr = vim.api.nvim_get_current_buf()

	if vim.bo[bufnr].buftype == "nowrite" then
		vim.api.nvim_command("tabc")
	else
		vim.api.nvim_command("tab G")
	end
end

keymap.set("n", "<leader>f", toggle_fugitive)

keymap.set("n", "<leader>tf", MiniPick.builtin.files)
keymap.set("n", "<leader>ts", MiniPick.builtin.grep_live)
keymap.set("n", "<leader>tw", function()
	MiniPick.builtin.grep({ pattern = vim.fn.expand("<cword>") })
end)
keymap.set("n", "<leader>tb", MiniPick.builtin.buffers)
keymap.set("n", "<leader>th", MiniPick.builtin.help)
keymap.set("n", "<leader>tr", MiniPick.builtin.resume)
keymap.set("n", "<leader>tc", MiniExtra.pickers.commands)

keymap.set("n", "<leader>tgb", MiniExtra.pickers.git_branches)
keymap.set("n", "<leader>tgc", MiniExtra.pickers.git_commits)

keymap.set("n", "<leader>m", MiniExtra.pickers.spellsuggest)

local cmp = require("cmp")

cmp.setup({
	mapping = cmp.mapping.preset.insert({
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = false }),
	}),
})

keymap.set("n", "<leader>l", function()
	require("lint").try_lint()
end, { desc = "Trigger linting for current file" })

keymap.set("n", "gl", vim.diagnostic.open_float)
keymap.set("n", "<leader>RR", ":LspRestart<CR>")

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("accme_lsp_attach", { clear = true }),
	callback = function(ev)
		local opts = { noremap = true, silent = true, buffer = ev.buf }

		keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		keymap.set("n", "K", function()
			vim.lsp.buf.hover({
				max_width = 100,
				max_height = 15,
			})
		end, opts)
		keymap.set("n", "gf", vim.lsp.buf.references, opts)
		keymap.set("n", "<leader>C", vim.lsp.buf.code_action, opts)
		keymap.set("v", "<leader>R", vim.lsp.buf.rename, opts)
	end,
})
