local state = vim.env.XDG_STATE_HOME or (vim.env.HOME .. "/.local/state")

local function load(polarity)
	local ok, colors = pcall(dofile, state .. "/base16/" .. polarity .. "/nvim.lua")
	return ok and colors or nil
end

return function()
	return {
		dark = load("dark"),
		light = load("light"),
	}
end
