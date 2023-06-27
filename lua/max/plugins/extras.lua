-- Nice to have plugins
local enabled = true

return {
	-- Autopairs
	{
		"windwp/nvim-autopairs",
		enabled = enabled,
		event = "InsertEnter",
		opts = {}, -- this is equalent to setup({}) function
	},

	-- better yank/paste
	{
		"gbprod/yanky.nvim",
		enabled = enabled,
		event = "VeryLazy",
		opts = {
			highlight = { timer = 300 },
		},
		keys = {
			{ "y", "<Plug>(YankyYank)", mode = { "n", "x" } },
			{ "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" } },
			{ "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" } },
		},
	},

	-- search/replace in multiple files
	{
		"nvim-pack/nvim-spectre",
		enabled = enabled,
		cmd = "Spectre",
		keys = {
			{
				"<leader>lR",
				function()
					require("spectre").open()
				end,
				desc = "Replace in files (Spectre)",
			},
		},
	},

	-- annotation comments generator
	{
		"danymat/neogen",
		enabled = enabled,
		dependencies = { "L3MON4D3/LuaSnip" },
		keys = {
			{
				"<leader>cc",
				function()
					require("neogen").generate({})
				end,
				desc = "Neogen annotation comment",
			},
		},
		opts = { snippet_engine = "luasnip" },
	},

	-- ChatGPT interaction
	{
		"jackMort/ChatGPT.nvim",
		enabled = enabled,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
		cmd = { "ChatGPT", "ChatGPTActAs", "ChatGPTRun" },
		keys = {
			{ "<leader>h", "<cmd>ChatGPT<cr>", desc = "Open ChatGPT" },
		},
		opts = {
			api_key_cmd = "echo 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",
			chat = {
				keymaps = {
					close = { "<C-c>" },
					yank_last = "<C-y>",
					scroll_up = "<C-u>",
					scroll_down = "<C-d>",
					new_session = "<C-n>",
					cycle_windows = "<Tab>",
					cycle_modes = "<C-f>",
					select_session = { "<CR>", "l" },
					rename_session = "r",
					delete_session = "d",
					toggle_settings = "<C-o>",
					toggle_message_role = "<C-r>",
					toggle_system_role_open = "<C-s>",
				},
			},
			popup_input = {
				submit = "<CR>",
				submit_n = "<C-CR>",
			},
			openai_params = {
				model = "gpt-4", -- gpt-3.5-turbo
				max_tokens = 300,
			},
		},
		config = function(_, opts)
			require("chatgpt").setup(opts)
		end,
	},

	-- neodev
	{
		"folke/neodev.nvim",
		enabled = enabled,
		ft = "lua",
	},

	-- buffer remove
	{
		"echasnovski/mini.bufremove",
		enabled = false,
		keys = {
			{
				"<leader>c",
				function()
					require("mini.bufremove").delete(0, false)
				end,
				desc = "Delete Buffer",
			},
			{
				"<leader>C",
				function()
					require("mini.bufremove").delete(0, true)
				end,
				desc = "Delete Buffer (Force)",
			},
		},
	},
}
