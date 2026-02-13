-- Nice to have plugins
local enabled = true

return {
	-- surround
	-- {
	-- 	"kylechui/nvim-surround",
	-- 	enabled = enabled,
	-- 	event = "VeryLazy",
	-- 	config = true,
	-- },

	-- Schemastores
	{ "b0o/schemastore.nvim" },

	-- better quickfix
	{
		"kevinhwang91/nvim-bqf",
		enabled = enabled,
		ft = "qf",
	},

	-- Neovim lua_ls setup
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				vim.fn.stdpath("data") .. "/lazy/lazy.nvim",
			},
		},
	},

	-- search/replace in multiple files
	{
		"MagicDuck/grug-far.nvim",
		enabled = enabled,
		cmd = "GrugFar",
		keys = {
			{
				"<leader>R",
				function()
					require("grug-far").open()
				end,
				desc = "Replace in files (Spectre)",
			},
		},
		config = function()
			require("grug-far").setup({})
		end,
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
}
