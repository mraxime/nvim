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
	dependencies = { "echasnovski/mini.icons" },
	priority = 1000,
	lazy = false,
	---@module 'snacks'
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
		-- Picker
		----------------------------------------------------
		{
			"<leader>f",
			function()
				Snacks.picker.files()
			end,
			desc = "Open file picker",
		},
		{
			"<leader>F",
			function()
				Snacks.picker.files({ cwd = find_project_root() })
			end,
			desc = "Open file picker at current working directory",
		},
		{
			"sd",
			function()
				Snacks.picker.files()
			end,
			desc = "Open file picker",
		},
		{
			"<leader>i",
			function()
				Snacks.picker.files({ cwd = vim.fn.expand("%:p:h") })
			end,
			desc = "Open file picker at buffer directory",
		},
		{
			"se",
			function()
				Snacks.explorer({ cwd = find_project_root() })
			end,
			desc = "Open file explorer",
		},
		{
			"<leader>b",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Open buffer picker",
		},
		{
			"<leader>j",
			function()
				Snacks.picker.jumps()
			end,
			desc = "Open jumplist picker",
		},
		{
			"<leader>s",
			function()
				Snacks.picker.lsp_symbols()
			end,
			desc = "Open symbol picker",
		},
		{
			"<leader>d",
			function()
				Snacks.picker.diagnostics()
			end,
			desc = "Open diagnostic picker",
		},
		{
			"<leader>g",
			function()
				Snacks.picker.git_diff()
			end,
			desc = "Open git diff picker",
		},
		{
			"<leader>'",
			function()
				Snacks.picker.resume()
			end,
			desc = "Open last picker",
		},
		{
			"<leader>/",
			function()
				Snacks.picker.grep()
			end,
			desc = "Open grep picker",
		},
		{
			"<leader>?",
			function()
				Snacks.picker.keymaps()
			end,
			desc = "Open keymaps picker",
		},
		{
			"<leader>\\",
			function()
				Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "Open file picker at Neovim config",
		},

		-- Terminal
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

		-- Others
		----------------------------------------------------
		{
			"<C-f>h",
			function()
				Snacks.lazygit()
			end,
			desc = "Open Lazygit",
		},
		{
			"<C-f><C-h>",
			function()
				Snacks.lazygit()
			end,
			desc = "Open Lazygit",
		},
		{
			"<leader>z",
			function()
				Snacks.zen()
			end,
			desc = "Zen mode",
		},
	},
}
