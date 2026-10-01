vim.pack.add({ "https://github.com/scottmckendry/cyberdream.nvim" }, { confirm = false })

local adjust_color = require("accme.local.get-color")
local colors = require("accme.local.colors")

require("cyberdream").setup({
	variant = "auto",
	transparent = true,

	colors = {
		bg = colors.base00,
		bg_alt = colors.base01,
		bg_highlight = colors.base02,
		fg = colors.base05,
		grey = colors.base03,
		blue = colors.base0D,
		green = colors.base0B,
		cyan = colors.base0C,
		red = colors.base08,
		yellow = colors.base0A,
		magenta = colors.base0F,
		pink = adjust_color(colors.base08, 0, 16, 32),
		orange = colors.base09,
		purple = colors.base0E,
	},

	saturation = 0.5,

	highlights = {
		CursorLine = { bg = "NONE", underline = true },
		CursorLineNr = { bg = "NONE", underline = true },
	},
})

vim.cmd("colorscheme cyberdream")
