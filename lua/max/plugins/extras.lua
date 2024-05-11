-- Nice to have plugins
local enabled = true

return {
	-- surround
	{
		"kylechui/nvim-surround",
		enabled = enabled,
		event = "VeryLazy",
		config = true,
	},

	-- better vim.ui
	{
		"stevearc/dressing.nvim",
		enabled = enabled,
		init = function()
			vim.ui.select = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.select(...)
			end
			vim.ui.input = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.input(...)
			end
		end,
	},

	-- colorizer
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

	-- better quickfix
	{
		"kevinhwang91/nvim-bqf",
		enabled = enabled,
		ft = "qf",
	},

	-- better yank/paste
	-- {
	-- 	"gbprod/yanky.nvim",
	-- 	enabled = enabled,
	-- 	opts = {
	-- 		highlight = {
	-- 			timer = 90,
	-- 		},
	-- 	},
	-- 	keys = {
	-- 		{ "y", "<Plug>(YankyYank)", mode = { "n", "x" } },
	-- 		{ "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" } },
	-- 		{ "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" } },
	-- 	},
	-- },

	-- search/replace in multiple files
	{
		"MagicDuck/grug-far.nvim",
		cmd = "GrugFar",
		keys = {
			{
				"<leader>lR",
				function()
					require("grug-far").grug_far()
				end,
				desc = "Replace in files (Spectre)",
			},
		},
		config = function()
			require("grug-far").setup({})
		end,
	},

	-- neodev
	{
		"folke/neodev.nvim",
		enabled = enabled,
		ft = "lua",
	},

	-- indent line
	{
		"lukas-reineke/indent-blankline.nvim",
		enabled = false,
		event = "BufReadPre",
		main = "ibl",
		opts = {
			indent = {
				char = "▏",
			},
			exclude = {
				filetypes = {
					"help",
					"terminal",
					"starter",
					"nvim-tree",
					"packer",
					"lspinfo",
					"TelescopePrompt",
					"TelescopeResults",
					"mason",
					"",
				},
				buftypes = {
					"terminal",
				},
			},
			scope = {
				enabled = false,
			},
			whitespace = {
				remove_blankline_trail = false,
			},
		},
	},

	-- annotation comments generator
	{
		"danymat/neogen",
		enabled = false,
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
