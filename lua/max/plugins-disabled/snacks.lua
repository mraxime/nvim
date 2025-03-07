return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		bigfile = { enabled = true },
		quickfile = { enabled = true },
		picker = { enabled = true },
		explorer = { enabled = true },
		scope = { enabled = true },
		statuscolumn = { enabled = true },
		-- indent = { enabled = true },
		-- words = { enabled = true },
		-- input = { enabled = true },
	},
}
