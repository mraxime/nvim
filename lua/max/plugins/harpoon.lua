return {
	{
		"ThePrimeagen/harpoon",
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
				"sj",
				function()
					local harpoon = require("harpoon")
					harpoon:list():select(1)
				end,
				desc = "Set current harpoon to file 1",
			},
			{
				"sk",
				function()
					local harpoon = require("harpoon")
					harpoon:list():select(2)
				end,
				desc = "Set current harpoon to file 1",
			},
			{
				"sl",
				function()
					local harpoon = require("harpoon")
					harpoon:list():select(3)
				end,
				desc = "Set current harpoon to file 1",
			},
			{
				"s;",
				function()
					local harpoon = require("harpoon")
					harpoon:list():select(4)
				end,
				desc = "Set current harpoon to file 1",
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

	-- {
	-- 	"cbochs/grapple.nvim",
	-- 	enabled = false,
	-- 	opts = {
	-- 		scope = "git", -- also try out "git_branch"
	-- 		icons = false, -- setting to "true" requires "nvim-web-devicons"
	-- 		status = false,
	-- 	},
	-- 	keys = {
	-- 		{ "<leader>a", "<cmd>Grapple toggle<cr>", desc = "Tag a file" },
	-- 		{ "<c-e>", "<cmd>Grapple toggle_tags<cr>", desc = "Toggle tags menu" },
	--
	-- 		{ "<c-h>", "<cmd>Grapple select index=1<cr>", desc = "Select first tag" },
	-- 		{ "<c-t>", "<cmd>Grapple select index=2<cr>", desc = "Select second tag" },
	-- 		{ "<c-n>", "<cmd>Grapple select index=3<cr>", desc = "Select third tag" },
	-- 		{ "<c-s>", "<cmd>Grapple select index=4<cr>", desc = "Select fourth tag" },
	--
	-- 		{ "<c-s-n>", "<cmd>Grapple cycle_tags next<cr>", desc = "Go to next tag" },
	-- 		{ "<c-s-p>", "<cmd>Grapple cycle_tags prev<cr>", desc = "Go to previous tag" },
	-- 	},
	-- },
}
