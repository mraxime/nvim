return {
	"akinsho/bufferline.nvim",
	enabled = true,
	event = "VeryLazy",
	opts = {
		options = {
			always_show_bufferline = true,
			diagnostics = "nvim_lsp",
			mode = "tabs",
			-- diagnostics_indicator = function(_, _, diag)
			-- 	local icons = require("lazyvim.config").icons.diagnostics
			-- 	local ret = (diag.error and icons.Error .. diag.error .. " " or "")
			-- 		.. (diag.warning and icons.Warn .. diag.warning or "")
			-- 	return vim.trim(ret)
			-- end,
			-- close_command = function(n)
			-- 	require("mini.bufremove").delete(n, false)
			-- end,
			-- right_mouse_command = function(n)
			-- 	require("mini.bufremove").delete(n, false)
			-- end,
			offsets = {
				{
					filetype = "neo-tree",
					text = "Neo-tree",
					highlight = "Directory",
					text_align = "left",
				},
			},
		},
	},
}
