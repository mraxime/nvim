return {
	{
		"nvim-telescope/telescope.nvim",
		enabled = true,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- faster than the default lua sorter
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
				"<c-p>",
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
				"s'",
				function()
					require("telescope.builtin").resume()
				end,
				desc = "Resume Telescope",
			},
			{
				"<leader>'",
				function()
					require("telescope.builtin").resume()
				end,
				desc = "Resume Telescope",
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

			telescope.setup({
				defaults = {
					-- vimgrep_arguments = {
					-- 	"rg",
					-- 	"-L",
					-- 	"--color=never",
					-- 	"--no-heading",
					-- 	"--with-filename",
					-- 	"--line-number",
					-- 	"--column",
					-- 	"--smart-case",
					-- },
					prompt_prefix = "   ",
					selection_caret = " ",
					-- path_display = { "truncate" },
					sorting_strategy = "ascending",
					layout_strategy = "horizontal",
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
						hidden = true, -- will still show the inside of `.git/` as it's not `.gitignore`d.
						find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
					},
				},
			})

			telescope.load_extension("fzf")
		end,
	},

	{
		"ibhagwan/fzf-lua",
		enabled = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{
				"sf",
				function()
					require("fzf-lua").files()
				end,
				desc = "Find Files",
			},
		},
		init = function()
			vim.ui.select = function(...)
				require("fzf-lua.providers.ui_select").ui_select(...)
			end
		end,
		opts = {
			winopts = {
				preview = {
					delay = 10,
				},
			},
		},
	},
}
