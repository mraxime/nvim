return {
	"nvim-telescope/telescope.nvim",
	enabled = true,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"nvim-telescope/telescope-file-browser.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	keys = {
		{
			"sd",
			function()
				require("telescope.builtin").find_files({ no_ignore = false, hidden = true })
			end,
			desc = "Find Files",
		},
		{
			"sf",
			function()
				require("telescope.builtin").find_files({ no_ignore = false, hidden = true })
			end,
			desc = "Find Files",
		},
		{
			"sa",
			function()
				require("telescope.builtin").live_grep()
			end,
			desc = "Search Text",
		},
		{
			"s/",
			function()
				require("telescope.builtin").live_grep()
			end,
			desc = "Search Text",
		},
		{
			"ss",
			function()
				require("telescope.builtin").resume()
			end,
			desc = "Resume Telescope",
		},
		{
			"so",
			function()
				require("telescope").extensions.file_browser.file_browser()
			end,
			desc = "Search File Browser",
		},
		-- old muscle memory
		{
			"<leader>f",
			function()
				require("telescope.builtin").find_files({ no_ignore = false, hidden = true })
			end,
			desc = "Find Files",
		},
		{
			"st",
			function()
				require("telescope.builtin").live_grep()
			end,
			desc = "Search Text",
		},
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local fb_actions = require("telescope").extensions.file_browser.actions

		telescope.setup({
			defaults = {
				vimgrep_arguments = {
					"rg",
					"-L",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
				},
				prompt_prefix = "   ",
				selection_caret = " ",
				path_display = { "truncate" },
				sorting_strategy = "ascending",
				layout_config = {
					horizontal = {
						prompt_position = "top",
						preview_width = 0.55,
						results_width = 0.8,
					},
					vertical = {
						mirror = false,
					},
					width = 0.87,
					height = 0.80,
					preview_cutoff = 120,
				},

				mappings = {
					n = {
						["q"] = actions.close,
						["<Space>"] = actions.toggle_selection,
					},
					i = {
						["<esc>"] = actions.close,
					},
				},
			},
			pickers = {
				find_files = {
					-- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
					find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
				},
			},
			extensions = {
				file_browser = {
					theme = "dropdown",
					hijack_netrw = false,
					select_buffer = true, -- auto focus file from current buffer
					initial_browser = "tree",
					auto_depth = true,
					depth = 1,
					-- Default options
					path = "%:p:h",
					cwd = vim.fn.expand("%:p:h"),
					respect_gitignore = false,
					hidden = false,
					grouped = true,
					initial_mode = "normal",
					previewer = false,
					layout_config = { height = 0.8, width = 52 },
					display_stat = false,
					-- Mappings
					mappings = {
						-- your custom insert mode mappings
						["i"] = {
							["<C-w>"] = function()
								vim.cmd("normal vbd")
							end,
						},
						["n"] = {
							-- your custom normal mode mappings
							["a"] = fb_actions.create,
							["h"] = fb_actions.goto_parent_dir,
							["l"] = actions.select_default,
							["gh"] = fb_actions.goto_home_dir,
							["H"] = fb_actions.toggle_hidden,
							["v"] = fb_actions.toggle_all,
							["p"] = fb_actions.copy,
							["m"] = fb_actions.move,
							["x"] = fb_actions.move,
							["q"] = actions.close,
							["/"] = function()
								vim.cmd("startinsert")
							end,
						},
					},
				},
			},
		})
		telescope.load_extension("fzf")
		telescope.load_extension("file_browser")
	end,
}
