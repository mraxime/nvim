return {
	{
		"robitx/gp.nvim",
		enabled = false,
		lazy = false,
		opts = {
			openai_api_key = "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",
			agents = {
				{
					name = "ChatGPT4",
					chat = true,
					command = false,
					-- string with model name or table with model name and parameters
					model = { model = "gpt-4-1106-preview", temperature = 1.1, top_p = 1 },
					-- system prompt (use this to specify the persona/role of the AI)
					system_prompt = "You are a general AI assistant.\n\n"
						.. "The user provided the additional info about how they would like you to respond:\n\n"
						.. "- If you're unsure don't guess and say you don't know instead.\n"
						.. "- Ask question if you need clarification to provide better answer.\n"
						.. "- Think deeply and carefully from first principles step by step.\n"
						.. "- Zoom out first to see the big picture and then zoom in to details.\n"
						.. "- Use Socratic method to improve your thinking and coding skills.\n"
						.. "- Don't elide any code from your output if the answer requires coding.\n"
						.. "- Take a deep breath; You've got this!\n",
				},
			},
		},
	},
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
					sorting_strategy = "descending",
					layout_strategy = "horizontal",
					layout_config = {
						horizontal = {
							prompt_position = "bottom",
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
				-- pickers = {
				-- 	find_files = {
				-- 		`hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
				-- 		find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
				-- 	},
				-- },
			})
			telescope.load_extension("fzf")
		end,
	},

	{
		"ibhagwan/fzf-lua",
		-- optional for icon support
		dependencies = { "nvim-tree/nvim-web-devicons" },
		enabled = false,
		keys = {
			{
				"sf",
				function()
					require("fzf-lua").files()
				end,
				desc = "Find Files",
			},
			{
				"st",
				function()
					require("fzf-lua").live_grep()
				end,
				desc = "Find Text (grep)",
			},
			{
				"ss",
				function()
					require("fzf-lua").resume()
				end,
				desc = "Resume Fzf",
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
