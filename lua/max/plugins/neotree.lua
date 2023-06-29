return {
	-- file explorer
	{
		"nvim-neo-tree/neo-tree.nvim",
		enabled = true,
		branch = "v2.x",
		cmd = "Neotree",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		keys = {
			{
				"so",
				function()
					require("neo-tree.command").execute({ toggle = true, position = "current" })
				end,
				desc = "Explorer NeoTree (root dir)",
				remap = true,
			},
			-- old muscle memory
			{
				"<leader>e",
				function()
					require("neo-tree.command").execute({ toggle = true, position = "current" })
				end,
				desc = "Explorer NeoTree (root dir)",
				remap = true,
			},
		},
		deactivate = function()
			vim.cmd([[Neotree close]])
		end,
		init = function()
			vim.g.neo_tree_remove_legacy_commands = 1
		end,
		opts = {
			filesystem = {
				bind_to_cwd = false,
				follow_current_file = true,
				use_libuv_file_watcher = true,
				hijack_netrw_behavior = "disabled",
			},
			window = {
				width = 32,
				mappings = {
					["<space>"] = "none",
					o = "system_open",
					O = "system_open",
					l = "open",
					h = "close_node",
					["<esc>"] = "close_window",
					s = false,
				},
			},
			commands = {
				system_open = function(state)
					local node = state.tree:get_node()
					local path = node:get_id()
					-- Linux: open file in default application
					vim.api.nvim_command(string.format("silent !xdg-open '%s'", path))
				end,
			},
		},
	},
}
