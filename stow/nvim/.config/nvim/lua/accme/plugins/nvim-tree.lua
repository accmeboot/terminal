vim.pack.add({ "https://github.com/nvim-tree/nvim-tree.lua" }, { confirm = false })

local api = require("nvim-tree.api")

-- the gap between icon and name is added to the icons themselves instead
---@class (exact) IconGap: nvim_tree.api.Decorator
local IconGap = api.Decorator:extend()

function IconGap:new()
	self.enabled = true
	self.highlight_range = "none"
	self.icon_placement = "none"
end

function IconGap:icon_node(node)
	if node.type == "file" then
		local icon, hl = require("mini.icons").get("file", node.name)
		return { str = icon .. "  ", hl = { hl } }
	end
end

require("nvim-tree").setup({
	disable_netrw = true,
	hijack_netrw = true,
	hijack_cursor = true,
	sync_root_with_cwd = true,
	update_focused_file = { enable = true },
	view = {
		side = "left",
		width = 35,
	},
	renderer = {
		group_empty = true,
		decorators = { "Git", "Open", "Hidden", "Modified", "Bookmark", "Diagnostics", "Copied", "Cut", IconGap },
		icons = {
			git_placement = "right_align",
			padding = {
				icon = "",
			},
			show = {
				folder_arrow = false,
			},
			glyphs = {
				symlink = "\u{f481}  ",
				-- same symbols as starship's git_status
				git = {
					unstaged = "!",
					staged = "+",
					untracked = "?",
					unmerged = "=",
					renamed = ">",
					deleted = "x",
					ignored = "-",
				},
				folder = {
					default = "\u{e5ff}  ",
					open = "\u{e5fe}  ",
					empty = "\u{f114}  ",
					empty_open = "\u{f115}  ",
					symlink = "\u{f482}  ",
					symlink_open = "\u{f482}  ",
				},
			},
		},
	},
	filters = {
		dotfiles = false,
		custom = { "^.git$" },
	},
	on_attach = function(bufnr)
		api.map.on_attach.default(bufnr)

		-- keep <C-k> for split navigation
		vim.keymap.del("n", "<C-k>", { buffer = bufnr })
	end,
})
