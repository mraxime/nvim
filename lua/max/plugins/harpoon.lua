return {
	{
		"ThePrimeagen/harpoon",
		enabled = true,
		dependencies = { "nvim-lua/plenary.nvim" },
		branch = "harpoon2",
		keys = {
			-- Menu Toggle
			{
				"gh",
				function()
					local harpoon = require("harpoon")
					harpoon.ui:toggle_quick_menu(harpoon:list())
				end,
				desc = "Toggle harpoon menu",
			},

			-- Menu Add
			{
				"ga",
				function()
					local harpoon = require("harpoon")
					harpoon:list():add()
				end,
				desc = "Add buffer to harpoon",
			},

			-- Navigation
			{
				"gu",
				function()
					local harpoon = require("harpoon")
					harpoon:list():select(1)
				end,
				desc = "Set current harpoon to file 1",
			},
			{
				"gi",
				function()
					local harpoon = require("harpoon")
					harpoon:list():select(2)
				end,
				desc = "Set current harpoon to file 2",
			},
			{
				"go",
				function()
					local harpoon = require("harpoon")
					harpoon:list():select(3)
				end,
				desc = "Set current harpoon to file 3",
			},
			{
				"gp",
				function()
					local harpoon = require("harpoon")
					harpoon:list():select(4)
				end,
				desc = "Set current harpoon to file 4",
			},

			-- Reset
			{
				"gH",
				function()
					require("harpoon.mark").clear_all()
				end,
				desc = "Reset harpoon",
			},
		},
		config = function()
			local harpoon = require("harpoon")
			harpoon:setup({
				settings = {
					save_on_toggle = true,
					sync_on_ui_close = true,
				},
			})
		end,
	},

	{
		"cbochs/grapple.nvim",
		enabled = false,
		opts = {
			scope = "git", -- also try out "git_branch"
			icons = true, -- setting to "true" requires "nvim-web-devicons"
			status = false,
		},
		keys = {
			{ "<leader>a", "<cmd>Grapple toggle<cr>", desc = "Tag a file" },
			{ "gh", "<cmd>Grapple toggle_tags<cr>", desc = "Toggle tags menu" },

			{ "sj", "<cmd>Grapple select index=1<cr>", desc = "Select first tag" },
			-- { "sk", "<cmd>Grapple select index=2<cr>", desc = "Select second tag" },
			{ "sl", "<cmd>Grapple select index=3<cr>", desc = "Select third tag" },
			{ "s;", "<cmd>Grapple select index=4<cr>", desc = "Select fourth tag" },

			{ "sn", "<cmd>Grapple cycle_tags next<cr>", desc = "Go to next tag" },
			{ "sp", "<cmd>Grapple cycle_tags prev<cr>", desc = "Go to previous tag" },
		},
	},
}
