---@type LazySpec
return {
	"mikavilpas/yazi.nvim",
	-- event = "VeryLazy",
	dependencies = { "folke/snacks.nvim", lazy = true },
	keys = {
		-- 👇 in this section, choose your own keymappings!
		{
			"<leader>y",
			mode = { "n", "v" },
			"<cmd>Yazi<cr>",
			desc = "Open yazi at the current file",
		},
		-- {
		-- 	"se",
		-- 	"<cmd>Yazi<cr>",
		-- 	desc = "Open yazi at the current file",
		-- },
	},
	---@type YaziConfig | {}
	opts = {
		-- if you want to open yazi instead of netrw, see below for more info
		open_for_directories = false,
		keymaps = {
			show_help = "<f1>",
		},
	},
}
