-- Concerns about lazyloading:
-- Snacks is really well designed and does not need to be lazy loaded.
-- When snacks loads, it loads just one file and creates a couple of autocmds, that's it.
return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		bigfile = { enabled = true },
		quickfile = { enabled = true },
		explorer = { enabled = true },
		lazygit = { enabled = true },
		statuscolumn = { enabled = true },
		picker = {
			enabled = true,
			win = { input = { keys = { ["<Esc>"] = { "close", mode = { "n", "i" } } } } },
		},
		zen = {
			enabled = true,
			win = {
				backdrop = {
					transparent = false,
				},
			},
			toggles = {
				dim = false,
				git_signs = false,
				mini_diff_signs = false,
				-- diagnostics = false,
				-- inlay_hints = false,
			},
		},
		terminal = {
			enabled = true,
			win = {
				position = "float",
			},
		},
	},
	keys = {
		-- PICKER MAPS
		----------------------------------------------------
		{
			"<leader>e",
			function()
				Snacks.explorer()
			end,
			desc = "Toggle explorer",
		},
		{
			"se",
			function()
				Snacks.explorer()
			end,
			desc = "Toggle explorer",
		},

		-- PICKER MAPS
		----------------------------------------------------
		{
			"<leader>f",
			function()
				Snacks.picker.files()
			end,
			desc = "Find Files",
		},
		{
			"<leader>/",
			function()
				Snacks.picker.grep()
			end,
			desc = "Find Text",
		},
		{
			"sg",
			function()
				Snacks.picker.grep()
			end,
			desc = "Find Text",
		},
		{
			"<leader>g",
			function()
				Snacks.picker.git_status()
			end,
			desc = "Find Git Changes",
		},
		{
			"<leader>b",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Find Buffers",
		},
		{
			"<leader>s",
			function()
				Snacks.picker.lsp_symbols()
			end,
			desc = "Find Symbols",
		},
		{
			"<leader>'",
			function()
				Snacks.picker.resume()
			end,
			desc = "Resume Telescope",
		},
		-- old muscule memory
		{
			"sd",
			function()
				Snacks.picker.files()
			end,
			desc = "Find Files",
		},

		-- TERMINAL MAPS
		----------------------------------------------------
		{
			"<c-/>",
			function()
				Snacks.terminal()
			end,
			mode = { "n", "t" },
			desc = "Toggle Terminal",
		},
		{
			"<c-f>'",
			function()
				Snacks.terminal()
			end,
			mode = { "n", "t" },
			desc = "Toggle Terminal",
		},
		{
			"<c-f><C-'>",
			function()
				Snacks.terminal()
			end,
			mode = { "n", "t" },
			desc = "Toggle Terminal",
		},

		-- LAZYGIT MAPS
		----------------------------------------------------
		{
			"<C-f>h",
			function()
				Snacks.lazygit()
			end,
			desc = "Open Lazygit",
		},

		-- ZEN MAPS
		----------------------------------------------------
		{
			"<leader>z",
			function()
				Snacks.zen()
			end,
			desc = "Zen mode",
		},
	},
}
