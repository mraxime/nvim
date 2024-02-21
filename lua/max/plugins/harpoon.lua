return {
	"ThePrimeagen/harpoon",
	dependencies = { "nvim-lua/plenary.nvim" },
	lazy = false,
	enabled = true,
	version = false,
	branch = "harpoon2",
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup({ settings = {
			save_on_toggle = true,
			sync_on_ui_close = true,
		} })
	end,
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
		{
			"sm",
			function()
				local harpoon = require("harpoon")
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end,
			desc = "Toggle harpoon menu",
		},
		{
			"ms",
			function()
				local harpoon = require("harpoon")
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end,
			desc = "Toggle harpoon menu",
		},
		{
			"sh",
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
				harpoon:list():append()
				-- harpoon.ui:toggle_quick_menu(harpoon:list())
			end,
			desc = "Add buffer to harpoon",
		},
		{
			"mm",
			function()
				local harpoon = require("harpoon")
				harpoon:list():append()
			end,
			desc = "Add buffer to harpoon",
		},
		{
			"ma",
			function()
				local harpoon = require("harpoon")
				harpoon:list():append()
				harpoon:list():open_quick_menu(harpoon:list())
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
			desc = "Set current harpoon to file 1",
		},
		{
			"go",
			function()
				local harpoon = require("harpoon")
				harpoon:list():select(3)
			end,
			desc = "Set current harpoon to file 1",
		},
		{
			"gp",
			function()
				local harpoon = require("harpoon")
				harpoon:list():select(4)
			end,
			desc = "Set current harpoon to file 1",
		},

		-- Reset
		{
			"mc",
			function()
				require("harpoon.mark").clear_all()
			end,
			desc = "Reset harpoon",
		},
	},
}
