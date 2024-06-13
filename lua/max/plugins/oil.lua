return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		-- {
		-- 	"-",
		-- 	function()
		-- 		vim.cmd("vsplit | wincmd l | vertical resize -10")
		-- 		require("oil").open()
		-- 	end,
		-- 	desc = "Open Oil",
		-- },
		{
			"si",
			function()
				require("oil").toggle_float()
			end,
			desc = "Toggle Oil",
		},
		{
			"[",
			function()
				require("oil").toggle_float()
			end,
			desc = "Toggle Oil",
		},
		-- {
		-- 	"sk",
		-- 	function()
		-- 		require("oil").toggle_float()
		-- 	end,
		-- 	desc = "Toggle Oil",
		-- },
		-- {
		-- 	"so",
		-- 	function()
		-- 		require("oil").toggle_float()
		-- 	end,
		-- 	desc = "Toggle Oil",
		-- },
		-- {
		-- 	"sl",
		-- 	function()
		-- 		require("oil").toggle_float()
		-- 	end,
		-- 	desc = "Toggle Oil",
		-- },
	},
	opts = {
		keymaps = {
			-- navigation
			["<CR>"] = "actions.select",
			["<C-l>"] = "actions.select",

			["<BS>"] = "actions.parent",
			["<C-h>"] = "actions.parent",

			["`"] = "actions.cd",
			["~"] = "actions.tcd",
			["_"] = "actions.open_cwd",
			["gh"] = "actions.open_cwd",

			-- split
			["<C-s>"] = "actions.select_vsplit",
			-- (will break vim visual_block mode) ["<C-v>"] = "actions.select_split",

			-- close
			["<C-c>"] = "actions.close",
			["<Esc>"] = "actions.close",
			["q"] = "actions.close",

			-- others
			["g?"] = "actions.show_help",
			["R"] = "actions.refresh",
			["<C-p>"] = "actions.preview",
			["<C-t>"] = "actions.select_tab",
			["g."] = "actions.toggle_hidden",
			["g\\"] = "actions.toggle_trash",
			["gs"] = "actions.change_sort",
			["gx"] = "actions.open_external",
		},
		buf_options = {
			buflisted = true, -- jumplist navigation
		},
		-- columns = {},
		-- view_options = {
		-- 	show_hidden = true,
		-- },
		float = {
			max_width = 48,
			max_height = 20,
		},
	},
}
