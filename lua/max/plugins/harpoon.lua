return {
	"ThePrimeagen/harpoon",
	enabled = true,
	keys = {
		{
			"<leader>m",
			function()
				require("harpoon.ui").toggle_quick_menu()
			end,
			desc = "Toggle harpoon menu",
		},
		{
			"sm",
			function()
				require("harpoon.ui").toggle_quick_menu()
			end,
			desc = "Toggle harpoon menu",
		},
		{
			"sh",
			function()
				require("harpoon.ui").toggle_quick_menu()
			end,
			desc = "Toggle harpoon menu",
		},
		{
			"ms",
			function()
				require("harpoon.ui").toggle_quick_menu()
			end,
			desc = "Toggle harpoon menu",
		},
		{
			"ma",
			function()
				require("harpoon.mark").add_file()
			end,
			desc = "Add buffer to harpoon",
		},
		{
			"mm",
			function()
				require("harpoon.mark").add_file()
			end,
			desc = "Add buffer to harpoon",
		},
		{
			"sj",
			function()
				require("harpoon.ui").nav_file(1)
			end,
			desc = "Go to harpoon file 1",
		},
		{
			"sk",
			function()
				require("harpoon.ui").nav_file(2)
			end,
			desc = "Go to harpoon file 2",
		},
		{
			"sl",
			function()
				require("harpoon.ui").nav_file(3)
			end,
			desc = "Go to harpoon file 3",
		},
		{
			"s;",
			function()
				require("harpoon.ui").nav_file(4)
			end,
			desc = "Go to harpoon file 4",
		},
		{
			"sJ",
			function()
				require("harpoon.mark").set_current_at(1)
			end,
			desc = "Set current harpoon to file 1",
		},
		{
			"sK",
			function()
				require("harpoon.mark").set_current_at(2)
			end,
			desc = "Set current harpoon to file 2",
		},
		{
			"sL",
			function()
				require("harpoon.mark").set_current_at(3)
			end,
			desc = "Set current harpoon to file 3",
		},
		{
			"s:",
			function()
				require("harpoon.mark").set_current_at(4)
			end,
			desc = "Set current harpoon to file 4",
		},
		{
			"mc",
			function()
				require("harpoon.mark").clear_all()
			end,
			desc = "Reset harpoon",
		},
		{
			"mr",
			function()
				require("harpoon.mark").clear_all()
			end,
			desc = "Reset harpoon",
		},
	},
}
