return {
	{
		"folke/zen-mode.nvim",
		enabled = true,
		cmd = "ZenMode",
		opts = {
			plugins = {
				gitsigns = false,
				tmux = false,
			},
		},
		keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
	},
}
