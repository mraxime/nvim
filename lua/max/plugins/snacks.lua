-- @param markers - Predefined list of files to look for
local function find_project_root()
	local dir = vim.fn.getcwd()
	while dir ~= "/" do
		if vim.fn.isdirectory(dir .. "/.git") == 1 then
			return dir
		end
		dir = vim.fn.fnamemodify(dir, ":h")
	end
	return vim.fn.getcwd()
end

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
		input = { enabled = false },
		statuscolumn = { enabled = true },
		picker = {
			enabled = true,
			win = { input = { keys = { ["<Esc>"] = { "close", mode = { "n", "i" } } } } },
			sources = {
				explorer = {
					layout = {
						layout = {
							width = 38,
						},
					},
				},
			},
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
		-- Explorer Maps
		----------------------------------------------------
		-- {
		-- 	"<leader>e",
		-- 	function()
		-- 		Snacks.explorer()
		-- 	end,
		-- 	desc = "Toggle explorer",
		-- },
		{
			"se",
			function()
				Snacks.explorer({ cwd = find_project_root() })
			end,
			desc = "Toggle explorer",
		},

		-- Picker Maps
		----------------------------------------------------
		{
			"<leader>f",
			function()
				Snacks.picker.files({ cwd = find_project_root() })
			end,
			desc = "Find files",
		},
		{
			"<leader>F",
			function()
				Snacks.picker.files()
			end,
			desc = "Find files at cwd",
		},
		{
			"<leader>i",
			function()
				Snacks.picker.files({ cwd = vim.fn.expand("%:p:h") })
			end,
			desc = "File picker at cd",
		},
		{
			"<leader>/",
			function()
				Snacks.picker.grep()
			end,
			desc = "Find Text",
		},
		{
			"<leader>'",
			function()
				Snacks.picker.resume()
			end,
			desc = "Resume Telescope",
		},
		{
			"<leader>b",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Find Buffers",
		},
		{
			"<leader>d",
			function()
				Snacks.picker.diagnostics()
			end,
			desc = "Diagnostic picker",
		},
		{
			"<leader>g",
			function()
				Snacks.picker.git_status()
			end,
			desc = "Find Git Changes",
		},
		{
			"<leader>j",
			function()
				Snacks.picker.jumps()
			end,
			desc = "Jumplist picker",
		},
		{
			"<leader>s",
			function()
				Snacks.picker.lsp_symbols()
			end,
			desc = "Symbols picker",
		},
		{
			"<leader>\\",
			function()
				Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "File picker at cd",
		},

		-- Terminal Maps
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
			"<c-;>",
			function()
				Snacks.terminal()
			end,
			mode = { "n", "t" },
			desc = "Toggle Terminal",
		},
		{
			"<c-'>",
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
		{
			"g'",
			function()
				Snacks.terminal()
			end,
			mode = { "n", "t" },
			desc = "Toggle Terminal",
		},
		{
			"g;",
			function()
				Snacks.terminal()
			end,
			mode = { "n", "t" },
			desc = "Toggle Terminal",
		},

		-- Lazygit Maps
		----------------------------------------------------
		{
			"<C-f>h",
			function()
				Snacks.lazygit()
			end,
			desc = "Open Lazygit",
		},

		-- Zen Maps
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
