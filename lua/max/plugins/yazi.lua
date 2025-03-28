---@type LazySpec
return {
	"mikavilpas/yazi.nvim",
	-- event = "VeryLazy",
	dependencies = { "folke/snacks.nvim", lazy = true },
	keys = {
		-- 👇 in this section, choose your own keymappings!
		{
			"<leader>y",
			"<cmd>Yazi<cr>",
			desc = "Open yazi at the current file",
		},
		{
			"<leader>o",
			"<cmd>Yazi<cr>",
			desc = "Open yazi at the current file",
		},
		{
			"<C-y>",
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
		open_for_directories = false,
		floating_window_scaling_factor = 1,
		highlight_hovered_buffers_in_same_directory = false,
		keymaps = {
			show_help = "<f1>",
		},
	},
}
