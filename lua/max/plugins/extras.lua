-- Nice to have plugins
local enabled = true

return {
	-- Autopairs
	{
		"windwp/nvim-autopairs",
		enabled = enabled,
		event = "InsertEnter",
		config = function(_, opts)
			require("nvim-autopairs").setup(opts)

			-- setup cmp for autopairs
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},

	-- { "echasnovski/mini.nvim", event = "VeryLazy", version = false },

	-- Comments
	{
		"numToStr/Comment.nvim",
		dependencies = {
			{
				"JoosepAlviste/nvim-ts-context-commentstring",
				init = function() -- Performance
					vim.g.skip_ts_context_commentstring_module = true
				end,
				opts = { enable_autocmd = false },
			},
		},
		keys = {
			{ "gcc", mode = "n", desc = "Comment toggle current line" },
			{ "gc", mode = { "n", "o" }, desc = "Comment toggle linewise" },
			{ "gc", mode = "x", desc = "Comment toggle linewise (visual)" },
			{ "gbc", mode = "n", desc = "Comment toggle current block" },
			{ "gb", mode = { "n", "o" }, desc = "Comment toggle blockwise" },
			{ "gb", mode = "x", desc = "Comment toggle blockwise (visual)" },
		},
		config = function(_, opts)
			require("Comment").setup(opts)
		end,
	},

	-- Colorizer
	{
		"NvChad/nvim-colorizer.lua",
		event = "BufReadPre",
		opts = {
			filetypes = { "*", "!lazy" },
			buftype = { "*", "!prompt", "!nofile" },
			user_default_options = {
				RGB = true, -- #RGB hex codes
				RRGGBB = true, -- #RRGGBB hex codes
				names = false, -- "Name" codes like Blue
				RRGGBBAA = true, -- #RRGGBBAA hex codes
				AARRGGBB = false, -- 0xAARRGGBB hex codes
				rgb_fn = true, -- CSS rgb() and rgba() functions
				hsl_fn = true, -- CSS hsl() and hsla() functions
				css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
				css_fn = true,
				mode = "background",
				virtualtext = "■",
			},
		},
	},

	-- better yank/paste
	{
		"gbprod/yanky.nvim",
		enabled = false,
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
		cmd = { "Neogen" },
		keys = {
			{
				"<leader>cc",
				function()
					require("neogen").generate()
				end,
				desc = "Neogen annotation comment",
			},
			{
				"<leader>cf",
				function()
					require("neogen").generate({ type = "func" })
				end,
				desc = "Neogen annotation comment",
			},
			{
				"<leader>ct",
				function()
					require("neogen").generate({ type = "type" })
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
					close = "<C-c>",
					yank_last = "<C-y>",
					scroll_up = "<C-u>",
					scroll_down = "<C-d>",
					new_session = "<C-n>",
					cycle_windows = "<Tab>",
					cycle_modes = "<C-f>",
					select_session = "<CR>",
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

	-- better quickfix
	{
		"kevinhwang91/nvim-bqf",
		enabled = enabled,
		ft = "qf",
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

	-- better folding
	-- {
	-- 	"kevinhwang91/nvim-ufo",
	-- 	enabled = enabled,
	-- 	dependencies = "kevinhwang91/promise-async",
	-- 	event = "BufReadPost",
	--
	-- 	init = function()
	-- 		-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
	-- 		vim.keymap.set("n", "zR", function()
	-- 			require("ufo").openAllFolds()
	-- 		end)
	-- 		vim.keymap.set("n", "zM", function()
	-- 			require("ufo").closeAllFolds()
	-- 		end)
	-- 	end,
	-- },
}
